  METHOD if_quickfix_result~add_sbd_edit_position.
    DATA: uri        TYPE string,
          edit_delta TYPE REF TO cl_quickfix_source_object,
          fragment   TYPE cl_adt_text_plain_fragmnt_hndl=>ty_fragment_parsed.
    TRY.
        me->wb_object->get_global_wb_key( IMPORTING p_object_type =  DATA(wb_type) p_object_name =  DATA(name)
                                      EXCEPTIONS key_not_available = 1 OTHERS  = 2 ).

        fragment-start-line = i_position->range-start-row.
        fragment-start-offset = i_position->range-start-col.
        fragment-end-line = i_position->range-end-row.
        fragment-end-offset = i_position->range-end-col.

        uri = cl_sbd_adt_uri_builder=>create_uri( i_name = CONV #( name )  i_type = wb_type  i_fragment = fragment ).


        edit_delta = cl_quickfix_source_object=>create(
          i_wb_object = me->wb_object
          i_source_position = i_position
          i_uri = to_lower( uri ) ).

        APPEND edit_delta TO me->edit_positions.
      CATCH cx_adt_uri_mapping.
        CLEAR edit_delta.
    ENDTRY.

  ENDMETHOD.