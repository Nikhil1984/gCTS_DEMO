DEFINE mac_raise_initial.
  if &1 is initial.
    raise exception type cx_adt_res_creation_failure
      exporting
        textid = cx_adt_res_creation_failure=>create_textid_from_msg_params( msgid = 'S_QUICKFIX_ADT' msgno = &2 ).
  endif.
END-OF-definition.