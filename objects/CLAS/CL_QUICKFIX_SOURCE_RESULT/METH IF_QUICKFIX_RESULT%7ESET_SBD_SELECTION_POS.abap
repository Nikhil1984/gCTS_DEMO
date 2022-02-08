  METHOD if_quickfix_result~set_sbd_selection_pos.
    DATA: uri           TYPE string,
          source_object TYPE REF TO cl_quickfix_source_object,
          fragment      TYPE cl_adt_text_plain_fragmnt_hndl=>ty_fragment_parsed.
    TRY.
        me->wb_object->get_global_wb_key( IMPORTING p_object_type =  DATA(wb_type) p_object_name =  DATA(name)
                                      EXCEPTIONS key_not_available = 1 OTHERS  = 2 ).

        fragment-start-line = i_selection_position->range-start-row.
        fragment-start-offset = i_selection_position->range-start-col.
        fragment-end-line = i_selection_position->range-end-row.
        fragment-end-offset = i_selection_position->range-end-col.

        uri = cl_sbd_adt_uri_builder=>create_uri( i_name = CONV #( name )  i_type = wb_type  i_fragment = fragment ).


        source_object = cl_quickfix_source_object=>create(
          i_wb_object = me->wb_object
          i_source_position = i_selection_position
          i_uri = to_lower( uri ) ).

        me->source_selection = source_object.
      CATCH cx_adt_uri_mapping.
        CLEAR source_selection.
    ENDTRY.
  ENDMETHOD.