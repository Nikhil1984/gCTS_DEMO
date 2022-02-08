CLASS cl_quickfix_adt_message_links DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_seu_adt_message_links.

    CLASS-METHODS
      get_quickfixes_4_marker_id
        IMPORTING
          i_marker_id         TYPE string
        RETURNING
          VALUE(r_quickfixes) TYPE ce_art_qfix=>tab.

    CLASS-METHODS
      is_quickfix_in_marker_ids
        IMPORTING
          i_quickfix_uri  TYPE string
          i_marker_ids    TYPE string_table
        RETURNING
          VALUE(r_result) TYPE abap_bool.
