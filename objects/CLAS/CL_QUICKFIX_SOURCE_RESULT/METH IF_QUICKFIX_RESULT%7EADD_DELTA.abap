  METHOD if_quickfix_result~add_delta.

    DATA: delta TYPE REF TO cl_quickfix_source_object.

    CHECK me->wb_object IS BOUND.
    CHECK i_delta IS BOUND.

    APPEND i_delta TO if_quickfix_result~deltas.

    delta = cl_quickfix_source_object=>create(
      i_wb_object = me->wb_object
      i_content   = i_delta->content
      i_source_position  = i_delta->source_position
      i_name = i_delta->name
      i_description = i_delta->description
    ).

    APPEND delta TO source_deltas.

    IF i_is_editable = abap_true.
      APPEND delta TO me->edit_positions.
    ENDIF.

  ENDMETHOD.