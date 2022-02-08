  METHOD map_include_source_object.

    DATA: source_pos         TYPE REF TO cl_pst_source_position.
    "l_fragment_handler TYPE REF TO cl_adt_text_plain_fragmnt_hndl.

    IF source_object IS INITIAL.
      RETURN.
    ENDIF.

    source_pos = source_object->get_source_position( ).

    "l_fragment_handler = cl_adt_tools_core_factory=>get_instance( )->get_text_plain_fragment_handl( ).
    IF source_pos->is_cursor( ) = abap_true.
      result = me->uri_mapper->map_include_to_objref(
        program     = source_pos->main_prog
        include     = source_pos->include
        line        = source_pos->range-start-row
        line_offset = source_pos->range-start-col
      )->ref_data.

    ELSE.
      result = me->uri_mapper->map_include_to_objref(
        program     = source_pos->main_prog
        include     = source_pos->include
        line        = source_pos->range-start-row
        line_offset = source_pos->range-start-col
        end_line    = source_pos->range-end-row
        end_offset  = source_pos->range-end-col
      )->ref_data.

    ENDIF.

    " replace name/description (if not initial)
    IF source_object->get_name( ) IS NOT INITIAL.
      result-name = source_object->get_name( ).
    ENDIF.
    IF source_object->get_description( ) IS NOT INITIAL.
      result-description = source_object->get_description( ).
    ENDIF.

  ENDMETHOD.