  METHOD get_quickfixes_4_marker_id.

    DATA l_marker_id_len TYPE i.
    DATA l_syntax_error_prefix_len TYPE i.
    DATA l_syntax_error_id TYPE string.
    DATA l_art_qfixes TYPE ce_art_qfix=>tab.
    DATA l_art_qfix   TYPE REF TO ce_art_qfix.

    l_marker_id_len = strlen( i_marker_id ).
    l_syntax_error_prefix_len = strlen( co_syntax_error_prefix ).

    IF l_marker_id_len > l_syntax_error_prefix_len AND i_marker_id(l_syntax_error_prefix_len) = co_syntax_error_prefix.
      l_syntax_error_id = i_marker_id+l_syntax_error_prefix_len.

      l_art_qfixes = ce_art_qfix=>get_quickfixes_4_syntax_error( l_syntax_error_id ).

      LOOP AT l_art_qfixes INTO l_art_qfix.
        APPEND l_art_qfix TO r_quickfixes.
      ENDLOOP.

    ENDIF.

  ENDMETHOD.