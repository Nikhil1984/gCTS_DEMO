  PROTECTED SECTION.

    METHODS
      apply final REDEFINITION.

    methods
      apply_obj abstract
        IMPORTING
          quickfix_source_object  TYPE REF TO if_quickfix_source_object
          evaluation_result       TYPE REF TO if_quickfix_evaluation_result
        RETURNING
          VALUE(proposal_result)  TYPE REF TO if_quickfix_result
        RAISING
          cx_quickfix_error.

