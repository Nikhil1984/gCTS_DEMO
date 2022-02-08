  method if_quickfix_evaluation~evaluate.

    data:
      adt_helper             type ref to cl_quickfix_adt_helper,
      quickfix_proposals     type        if_quickfix_evaluation_result=>tab,
      serialized_proposals   type        if_quickfix_adt_types=>ty_quickfix_evaluation_results.

    adt_helper = cl_quickfix_adt_helper=>get_or_create_instance( ).

    quickfix_proposals = if_qfix_proposal_provider~create_proposals(
                           quickfix_source_object  = quickfix_source_object
                           dirty_objects           = dirty_objects
                           marker_id_is_filter     = adt_evaluation_request-marker_id_is_filter
                           marker_ids              = adt_evaluation_request-marker_ids
                         ).

    serialized_proposals = adt_helper->create_adt_evaluation_results(
                             evaluation_results = quickfix_proposals
                           ).

    append lines of serialized_proposals to all_adt_evaluation_results.

  endmethod.