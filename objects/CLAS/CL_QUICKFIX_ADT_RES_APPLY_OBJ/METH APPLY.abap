  METHOD apply.

    DATA adt_helper             TYPE REF TO cl_quickfix_adt_helper.
    DATA quickfix_source_object TYPE REF TO if_quickfix_source_object.
    DATA evaluation_result      TYPE REF TO if_quickfix_evaluation_result.
    DATA proposal_result        TYPE REF TO if_quickfix_result.
    DATA source                 TYPE        sadt_srl_plain_text.

    adt_helper = cl_quickfix_adt_helper=>get_or_create_instance( ).

    SPLIT adt_proposal_request-input-content AT cl_abap_char_utilities=>cr_lf INTO TABLE source.
    quickfix_source_object  = adt_helper->create_quickfix_source_object(
                              uri         = adt_proposal_request-input-affected_object-uri
                              source      = source
                          ).
    evaluation_result = adt_helper->create_evaluation_result( adt_rest_request = adt_rest_request adt_proposal_request = adt_proposal_request ).

    apply_obj(
      EXPORTING
        quickfix_source_object  = quickfix_source_object
        evaluation_result       = evaluation_result
      RECEIVING
        proposal_result         = proposal_result
    ).

    adt_proposal_result = adt_helper->create_adt_proposal_result( proposal_result ).

  ENDMETHOD.