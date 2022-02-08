  METHOD if_quickfix_source_object~get_source_code.

    CLEAR source_code.

      REPLACE ALL OCCURRENCES OF cl_abap_char_utilities=>cr_lf IN me->source
        WITH cl_abap_char_utilities=>newline.
      SPLIT me->source AT cl_abap_char_utilities=>newline INTO TABLE source_code.

    me->remove_remaining_crs( CHANGING c_source_code = source_code ).

  ENDMETHOD.