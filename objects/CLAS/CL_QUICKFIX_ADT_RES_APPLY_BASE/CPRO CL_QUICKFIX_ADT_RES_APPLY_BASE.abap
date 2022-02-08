  PROTECTED SECTION.

    METHODS
      apply ABSTRACT
        IMPORTING
          adt_rest_request            TYPE REF TO if_adt_rest_request
          adt_proposal_request        TYPE if_quickfix_adt_types=>ty_quickfix_proposal_request
        RETURNING
          VALUE(adt_proposal_result)  TYPE if_quickfix_adt_types=>ty_quickfix_proposal_result
        RAISING
          cx_static_check.
