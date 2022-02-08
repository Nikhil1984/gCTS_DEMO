  METHOD create_evaluation_result.

    DATA casted_evaluation_result TYPE REF TO cl_quickfix_evaluation_result.

    CREATE OBJECT casted_evaluation_result
      EXPORTING
        i_uri = adt_rest_request->get_inner_rest_request( )->get_uri( ).

    casted_evaluation_result->set_user_content( adt_proposal_request-user_content ).
    casted_evaluation_result->set_affected_objects( create_affected_objects( adt_proposal_request-affected_objects ) ).

    evaluation_result = casted_evaluation_result.

  ENDMETHOD.