  METHOD is_quickfix_in_marker_ids.

    DATA l_marker_id TYPE string.
    DATA l_quickfixes TYPE ce_art_qfix=>tab.

    r_result = abap_false.

    LOOP AT i_marker_ids INTO l_marker_id.
      l_quickfixes = get_quickfixes_4_marker_id( l_marker_id ).
      LOOP AT l_quickfixes INTO DATA(quicl_fix).
        IF quicl_fix->uri = i_quickfix_uri.
          r_result = abap_true.
          RETURN.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.