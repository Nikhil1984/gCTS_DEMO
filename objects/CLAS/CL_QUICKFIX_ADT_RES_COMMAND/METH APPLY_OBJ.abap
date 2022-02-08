  METHOD apply_obj.

    cl_art_quickfix_provider=>create( )->apply(
      EXPORTING
        input             = quickfix_source_object
        evaluation_result = evaluation_result
      RECEIVING
        result            = proposal_result
    ).

  ENDMETHOD.