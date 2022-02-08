  METHOD if_seu_adt_message_links~add_links.

    DATA l_longtext TYPE rslinltxt.
    DATA l_syntax_error_id TYPE string.
    DATA l_marker_id TYPE string.
    DATA l_quickfixes TYPE ce_art_qfix=>tab.
    DATA l_link TYPE if_atom_types=>link_s.

    " find the error-id of the message:
    " the parameter 'MSGID' has the value 'MESSAGE             G(2'
    READ TABLE longtexts WITH KEY param = 'MSGID' INTO l_longtext ##no_text .
    IF strlen( l_longtext-value ) >= 23.
      l_syntax_error_id = l_longtext-value+20(3).
      CASE condense( val  = to_upper( l_longtext-value(20) ) ).
        WHEN 'INCLUDE'.
          "add include, because there is a conflict with others errors possible, e.g. ELSEIF 001
          l_syntax_error_id = 'INCLUDE' && l_syntax_error_id.
        WHEN '+BDL'.
          l_syntax_error_id = '+BDL' && l_syntax_error_id.
      ENDCASE.
    ENDIF.
    IF l_syntax_error_id IS INITIAL. " no error-id for this message => return
      l_syntax_error_id = |{ message-message-msgid }{ message-message-msgno }|.
    ENDIF.
    l_marker_id = co_syntax_error_prefix && l_syntax_error_id ##no_text.

    " map marker to quickfixes
    l_quickfixes = get_quickfixes_4_marker_id( l_marker_id ).
    IF l_quickfixes IS INITIAL. " no quickfixes for this marker => return
      RETURN.
    ENDIF.

    l_link-rel = cl_quickfix_adt_res_app=>co_scheme.
    l_link-href = l_marker_id.
    APPEND l_link TO links.

    LOOP AT l_quickfixes ASSIGNING FIELD-SYMBOL(<quick_fix>).
      IF <quick_fix>->type = 'activate_ddic_adjust_dep_objs'.
        l_link-rel = 'http://www.sap.com/adt/categories/quickfixes/command'.
        l_link-href = <quick_fix>->uri.
        APPEND l_link TO links.
        l_link-rel = 'http://www.sap.com/adt/categories/quickfixes/command/description'.
        l_link-href = text-001.
        APPEND l_link TO links.
      ENDIF.

    ENDLOOP.


  ENDMETHOD.