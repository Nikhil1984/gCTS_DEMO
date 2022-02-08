interface IF_QFIX_PROPOSAL_PROVIDER
  public .
  METHODS
    create_proposals
      IMPORTING
        quickfix_source_object        TYPE REF TO if_quickfix_source_object
        dirty_objects                 TYPE if_quickfix_source_object=>tab OPTIONAL
        marker_id_is_filter           TYPE        abap_bool DEFAULT abap_false
        marker_ids                    TYPE        if_quickfix_adt_types=>ty_marker_ids OPTIONAL
      RETURNING
        VALUE(r_result) TYPE if_quickfix_evaluation_result=>tab.

endinterface.