  method post.
    data:
      adt_evaluation_request    type        if_quickfix_adt_types=>ty_quickfix_evaluation_request,
      affected_object           type        if_quickfix_adt_types=>ty_quickfix_proposal_delta,
      source                    type        sadt_srl_plain_text,
      param_marker_id_is_filter type        string,
      adt_evaluation_results    type        if_quickfix_adt_types=>ty_quickfix_evaluation_results,
      badi_ref                  type ref to badi_quickfix_evaluation,
      cx_root                   type ref to cx_root,
      response_content_handler  type ref to cl_adt_rest_comp_cnt_handler.

    "validate request accept header
    response_content_handler = cl_adt_rest_comp_cnt_handler=>create(
                                   request         = request
                                   content_handler = cl_adt_rest_st_handler=>create_instance(
                                                         st_name   = c_st_name_evaluation_res
                                                         root_name = c_st_root_evaluation_res
                                                     )
    ).
    response_content_handler->check_cnt_type_is_supported( ).

    request->get_uri_query_parameter(
      exporting
        name        = if_adt_uri_query_parameters=>co_uri
        mandatory   = abap_true
      importing
        value       = adt_evaluation_request-uri
    ).

    request->get_uri_query_parameter(
      exporting
        name        = if_adt_uri_query_parameters=>co_marker_id_is_filter
      importing
        value       = param_marker_id_is_filter
    ).
    adt_evaluation_request-marker_id_is_filter = boolc( param_marker_id_is_filter = 'true' ).

    request->get_uri_query_parameter_values(
      exporting
        name        = if_adt_uri_query_parameters=>co_marker_id
      importing
        values       = adt_evaluation_request-marker_ids
    ).

    "case content_type
    case request->get_content_type( ).
      when cl_quickfix_adt_res_app=>co_content_type_v1.

        data: eval_req_affected_objects type if_quickfix_adt_types=>ty_quickfix_eval_affected_objs.

        request->get_body_data(
          exporting
              content_handler = cl_adt_rest_st_handler=>create_instance( st_name = c_st_name_evaluation_req root_name = c_st_root_evaluation_req )
          importing
              data            = eval_req_affected_objects
          ).

          adt_evaluation_request-affected_objects = eval_req_affected_objects-affected_objects.

      when others.
        request->get_body_data(
          exporting content_handler = cl_adt_rest_cnt_hdl_factory=>get_instance( )->get_handler_for_plain_text( )
          importing data = source ).

        concatenate lines of source into affected_object-content separated by cl_abap_char_utilities=>newline.

        affected_object-affected_object-uri = adt_evaluation_request-uri.
        append affected_object to adt_evaluation_request-affected_objects.

    endcase.

    try.
        get badi badi_ref.

*        if adt_evaluation_request-marker_ids is not initial.
*          adt_evaluation_request-marker_id_is_filter = abap_true.
*        endif.

        data(adt_helper) = cl_quickfix_adt_helper=>get_or_create_instance( ).
        loop at adt_evaluation_request-affected_objects assigning field-symbol(<affected_obj_entry>).
          if <affected_obj_entry>-affected_object-uri = adt_evaluation_request-uri or
            <affected_obj_entry>-affected_object-uri = substring_before( val = adt_evaluation_request-uri sub = '#start' ).
            split <affected_obj_entry>-content at cl_abap_char_utilities=>cr_lf into table source.
         endif.
       endloop.

       data(quickfix_source_object) = adt_helper->create_quickfix_source_object(
                                        uri    = adt_evaluation_request-uri
                                        source = source
                                      ).
       data(dirty_objects) = adt_helper->create_affected_objects(
                                affected_objects = adt_evaluation_request-affected_objects
                             ).

        "Just because one implementation raises an exception (i.e. fails)
        "  doesn't mean we shouldn't collect the proposals
        "  from the remaining implementations
        loop at badi_ref->imps assigning field-symbol(<imp>).
          try.
              <imp>->evaluate(
                exporting
                  adt_rest_request           = request
                  adt_evaluation_request     = adt_evaluation_request
                  quickfix_source_object     = quickfix_source_object
                  dirty_objects              = dirty_objects
                changing
                  all_adt_evaluation_results = adt_evaluation_results
              ).
              "at least one implementation completed successfully
              data(success) = abap_true.
            catch cx_adt_rest into data(cx_adt).
          endtry.
        endloop.
        "If all implementations failed, raise an exception
        if success = abap_false.
          raise exception type cx_adt_rest_data_invalid
            exporting
              textid   = cx_adt_rest_data_invalid=>cx_adt_rest_data_invalid
              previous = cx_adt.
        endif.

*        call badi badi_ref->evaluate
*          exporting
*            adt_rest_request           = request
*            adt_evaluation_request     = adt_evaluation_request
*            quickfix_source_object     = quickfix_source_object
*            dirty_objects              = dirty_objects
*          changing
*            all_adt_evaluation_results = adt_evaluation_results.

      catch cx_badi into cx_root.
        raise exception type cx_adt_rest_data_invalid
          exporting
            textid   = cx_adt_rest_data_invalid=>create_textid_from_exc_text( cx_root )
            previous = cx_root.
    endtry.

    response->set_body_data(
      exporting
        content_handler = response_content_handler
        data            = adt_evaluation_results
    ).

  endmethod.