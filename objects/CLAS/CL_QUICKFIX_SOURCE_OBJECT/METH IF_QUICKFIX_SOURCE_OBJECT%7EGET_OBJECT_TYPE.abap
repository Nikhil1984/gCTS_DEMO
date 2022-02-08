  METHOD if_quickfix_source_object~get_object_type.
      if me->wb_object_type is initial.
        me->wb_object->get_global_wb_key( IMPORTING p_object_type = me->wb_object_type ).
      endif.
      result = me->wb_object_type.
  ENDMETHOD.