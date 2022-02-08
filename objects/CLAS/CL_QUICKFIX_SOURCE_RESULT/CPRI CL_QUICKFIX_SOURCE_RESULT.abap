  PRIVATE SECTION.

    DATA:

      wb_object        TYPE REF TO cl_wb_object,

      keep_cursor      TYPE abap_bool,
      source_selection TYPE REF TO if_quickfix_source_object,
      edit_positions   TYPE if_quickfix_source_object=>tab,
      source_deltas    TYPE if_quickfix_source_object=>tab,
      status_messages  TYPE if_quickfix_result=>ty_status_messages.

