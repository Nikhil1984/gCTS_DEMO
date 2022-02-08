  METHOD if_quickfix_result~add_edit_position.

    DATA(edit_delta) = cl_quickfix_source_object=>create( i_wb_object        = wb_object
                                                      i_source_position  = i_position ).

    APPEND edit_delta TO me->edit_positions.

  ENDMETHOD.