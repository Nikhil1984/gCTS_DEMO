  METHOD post.

    DATA proposal_request         TYPE if_quickfix_adt_types=>ty_quickfix_proposal_request.
    DATA proposal_result          TYPE if_quickfix_adt_types=>ty_quickfix_proposal_result.
    DATA cx_root                  TYPE REF TO cx_root.
    DATA response_content_handler TYPE REF TO cl_adt_rest_comp_cnt_handler.

    response_content_handler = cl_adt_rest_comp_cnt_handler=>create(
                                   request = request
                                   content_handler = cl_adt_rest_st_handler=>create_instance(
                                                         st_name   = co_st_name_proposal_res
                                                         root_name = co_st_root_proposal_res
                                                     )
    ).
    response_content_handler->check_cnt_type_is_supported( ).

    request->get_body_data(
      EXPORTING
        content_handler = cl_adt_rest_st_handler=>create_instance(
                              st_name      = co_st_name_proposal_req
                              root_name    = co_st_root_proposal_req
                          )
      IMPORTING
        data            = proposal_request
    ).

    TRY.
      proposal_result = apply( adt_rest_request     = request
                               adt_proposal_request = proposal_request ).

      CATCH cx_quickfix_error INTO DATA(quickfix_error).
        raise EXCEPTION quickfix_error.
      CATCH cx_static_check INTO cx_root.
        RAISE EXCEPTION TYPE cx_adt_rest_data_invalid
          EXPORTING
            textid   = cx_adt_rest_data_invalid=>create_textid_from_exc_text( cx_root )
            previous = cx_root.
    ENDTRY.

    response->set_body_data(
      EXPORTING
        content_handler = response_content_handler
        data            = proposal_result
    ).

  ENDMETHOD.