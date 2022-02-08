  METHOD if_quickfix_source_object~set_source_code.
    CONCATENATE LINES OF source_tab INTO me->source SEPARATED BY cl_abap_char_utilities=>cr_lf.
  ENDMETHOD.