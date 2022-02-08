  METHOD if_quickfix_result~set_selection_pos.

    me->source_selection = cl_quickfix_source_object=>create(
     i_wb_object       = me->wb_object
     i_source_position = i_position ).

  ENDMETHOD.