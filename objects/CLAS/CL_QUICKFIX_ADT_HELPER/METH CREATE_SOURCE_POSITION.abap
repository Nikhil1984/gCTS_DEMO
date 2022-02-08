  METHOD create_source_position.

    DATA: fragment TYPE cl_adt_text_plain_fragmnt_hndl=>ty_fragment_parsed,
          program  TYPE progname,
          include  TYPE progname.

    fragment = cl_adt_tools_core_factory=>get_instance( )->get_text_plain_fragment_handl( )->parse( uri ).

    IF fragment-end-line <> -1 AND fragment-start-line <> -1.

      me->uri_mapper->map_objref_to_include( EXPORTING uri = uri mapping_options = mapping_options
                                             IMPORTING program = program include = include ).

      r_position = cl_pst_source_position=>create(
        i_main_prog = program
        i_include   = include
        i_start_row = fragment-start-line
        i_start_col = fragment-start-offset
        i_end_row   = fragment-end-line
        i_end_col   = fragment-end-offset
      ).

    ELSEIF fragment-start-line <> -1.

      me->uri_mapper->map_objref_to_include( EXPORTING uri = uri mapping_options = mapping_options
                                             IMPORTING program = program include = include ).

      r_position = cl_pst_source_position=>create(
        i_main_prog = program
        i_include   = include
        i_start_row = fragment-start-line
        i_start_col = fragment-start-offset
      ).

    ENDIF.
  ENDMETHOD.