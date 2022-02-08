  METHOD create_adt_proposal_result.

    DATA: qf_source_delta  TYPE REF TO if_quickfix_source_object,
          editing_position TYPE REF TO if_quickfix_source_object,
          source_position  TYPE REF TO cl_pst_source_position,
          include_based    TYPE abap_bool.

    FIELD-SYMBOLS:
      <delta>                 LIKE LINE OF adt_proposal_result-deltas,
      <variable_source_state> LIKE LINE OF adt_proposal_result-variable_source_states,
      <var_source_state>      LIKE LINE OF <variable_source_state>.

    IF proposal_result IS BOUND.

      LOOP AT proposal_result->get_source_deltas( ) INTO qf_source_delta.
      APPEND INITIAL LINE TO adt_proposal_result-deltas ASSIGNING <delta>.
        source_position = qf_source_delta->get_source_position( ).
        IF source_position IS BOUND.
          include_based = boolc( source_position->main_prog IS NOT INITIAL OR source_position->include IS NOT INITIAL ).
          IF include_based = abap_false AND qf_source_delta->get_source_uri( ) IS NOT INITIAL.
          " SBD structures/tables
            <delta>-affected_object = me->map_sbd_object( qf_source_delta ).
          ELSE.
            <delta>-affected_object = me->map_include_source_object( qf_source_delta ).
          ENDIF.
          qf_source_delta->get_source_code_as_string( IMPORTING source_code = <delta>-content ).
        ELSE.
          <delta>-affected_object-uri = qf_source_delta->get_source_uri( ).
          <delta>-affected_object-name = qf_source_delta->get_name( ).
          DATA(wb_type) = qf_source_delta->get_object_type(  ).
          <delta>-affected_object-type = |{ wb_type-objtype_tr }/{ wb_type-subtype_wb }|.
        ENDIF.
          <delta>-links = qf_source_delta->get_atom_links(  ).
      ENDLOOP.

      DATA(source_selection) = proposal_result->get_source_selection( ).
      IF source_selection IS BOUND.
        include_based = boolc( source_selection->get_source_position( )->main_prog IS NOT INITIAL OR
                               source_selection->get_source_position( )->include IS NOT INITIAL ).
        IF include_based = abap_true.
          adt_proposal_result-selection = me->map_include_source_object( proposal_result->get_source_selection( ) ).
        ELSE.
          adt_proposal_result-selection-uri = source_selection->get_source_uri( ).
        ENDIF.
      ENDIF.

      adt_proposal_result-keep_cursor = proposal_result->keep_cursor_for_editing( ).

      APPEND INITIAL LINE TO adt_proposal_result-variable_source_states ASSIGNING <variable_source_state>.
      LOOP AT proposal_result->get_edit_positions( ) INTO editing_position.
        APPEND INITIAL LINE TO <variable_source_state> ASSIGNING <var_source_state>.
        include_based = boolc( editing_position->get_source_position( )->main_prog IS NOT INITIAL OR editing_position->get_source_position( )->include IS NOT INITIAL ).
        IF include_based = abap_true.
          <var_source_state> = me->map_include_source_object( editing_position ).
        ELSE.
          <var_source_state> = me->map_sbd_object( i_source_object = editing_position ).
        ENDIF.
      ENDLOOP.

      adt_proposal_result-status_messages = proposal_result->get_status_messages( ).
    ENDIF.

  ENDMETHOD.                                             "#EC CI_VALPAR