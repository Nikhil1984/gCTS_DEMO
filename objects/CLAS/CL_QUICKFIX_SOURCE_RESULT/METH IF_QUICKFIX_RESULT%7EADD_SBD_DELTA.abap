  METHOD if_quickfix_result~add_sbd_delta.
    DATA: delta       TYPE REF TO cl_quickfix_source_object,
          uri         TYPE string,
          object_name TYPE seu_objkey,
          fragment    TYPE cl_adt_text_plain_fragmnt_hndl=>ty_fragment_parsed.

    ASSERT me->wb_object IS BOUND.

    me->wb_object->get_global_wb_key( IMPORTING p_object_type =  DATA(wb_type) p_object_name =  DATA(name)
                                      EXCEPTIONS key_not_available = 1 OTHERS  = 2 ).
    ASSERT sy-subrc = 0.
    TRY.
        IF i_position IS NOT INITIAL.
          fragment-start-line = i_position->range-start-row.
          fragment-start-offset = i_position->range-start-col.
          fragment-end-line = i_position->range-end-row.
          fragment-end-offset = i_position->range-end-col.
          uri = cl_sbd_adt_uri_builder=>create_uri( i_name = CONV #( name )  i_type = wb_type  i_fragment = fragment ).
        ELSE.
          uri = cl_sbd_adt_uri_builder=>create_uri( i_name = CONV #( name )  i_type = wb_type ).
        ENDIF.

        me->wb_object->get_global_wb_key( IMPORTING p_object_name = object_name ).

        delta = cl_quickfix_source_object=>create(
          i_content   = i_content
          i_wb_object = me->wb_object
          i_source_position = i_position
          i_uri = to_lower( uri )
          i_name = i_name
          i_description = i_description
          i_links = i_links ).

        APPEND delta TO source_deltas.
      CATCH cx_adt_uri_mapping.
        CLEAR source_selection.
    ENDTRY.

  ENDMETHOD.