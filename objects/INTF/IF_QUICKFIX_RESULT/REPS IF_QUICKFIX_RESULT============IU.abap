"! A quickfix result describes all the changes which should be applied to the affected source code objects.
INTERFACE if_quickfix_result PUBLIC .

  CONSTANTS:

    BEGIN OF co_status_severity,
      info    TYPE string VALUE 'info',
      warning TYPE string VALUE 'warning',
    END OF co_status_severity .

  TYPES:
    BEGIN OF ty_status_message,
      status_severity TYPE string, " allowed values: co_status_severity
      message         TYPE string,
      id              type string,
    END OF ty_status_message.
  TYPES:
    ty_status_messages TYPE STANDARD TABLE OF ty_status_message WITH DEFAULT KEY .

  METHODS:

    "! Returns all deltas which describe changes to the source code.
    get_source_deltas
      RETURNING
        VALUE(result) TYPE if_quickfix_source_object=>tab,

    "! Adds a change descrption to the quickfix result
    "! If i_is_editable is true, the identifier can be changed afterwards
    add_delta
      IMPORTING
        i_delta       TYPE REF TO if_art_source_delta
        i_is_editable TYPE abap_bool DEFAULT abap_false,

    add_textsymbol_delta
      IMPORTING
        i_key  TYPE csequence
        i_name TYPE csequence,

    "! Defines the code which should be selected after the quickfix has been applied.
    set_source_selection
      IMPORTING
        i_selection TYPE REF TO if_quickfix_source_object,

    set_selection_pos
      IMPORTING
        i_position TYPE REF TO cl_pst_source_position,

    "! Set the code position which should be selected after the quickfix has been applied.
    "! It's only relevant to SBD sources (structures,tables) where the include mapping is not supported
    set_sbd_selection_pos
      IMPORTING
        i_selection_position TYPE REF TO cl_pst_source_position,

    "! Adds a position which should be editable after the quickfix has been applied.
    "! All positions are linked and should refer to the same identifier.
    add_edit_position
      IMPORTING
        i_position TYPE REF TO cl_pst_source_position,

    "! Adds a position which should be editable after the quickfix has been applied.
    "! All positions are linked and should refer to the same identifier.
    "! It's only relevant to SBD sources (structures,tables) where the include mapping is not supported
    add_sbd_edit_position
      IMPORTING
        i_position    TYPE REF TO cl_pst_source_position,

    "! Returns all edit positions which are linked together.
    get_edit_positions
      RETURNING
        VALUE(r_result) TYPE if_quickfix_source_object=>tab,

    get_status_messages
      RETURNING
        VALUE(result) TYPE ty_status_messages,

    add_status_message
      IMPORTING
        i_status_severity TYPE string  " allowed values: co_status_severity
        i_message         TYPE string
        i_id              TYPE string OPTIONAL,

    "! Returns the position which should be selecetd after the quickfix has been applied.
    get_source_selection
      RETURNING
        VALUE(r_result) TYPE REF TO if_quickfix_source_object,

    "! Sets the flag if cursor should be kept after editing.
    set_keep_cursor_for_editing
      IMPORTING
        i_keep_cursor TYPE abap_bool,

    "! Returns true, if the cursor shall be kept at the original position after
    "! the linked editing completed.
    keep_cursor_for_editing
      RETURNING
        VALUE(result) TYPE abap_bool,

    add_sbd_delta
      IMPORTING
        i_content     TYPE string
        i_position    TYPE REF TO cl_pst_source_position
        i_name        TYPE string OPTIONAL
        i_description TYPE string OPTIONAL
        i_links       TYPE if_atom_types=>link_t OPTIONAL,

    add_link_to_object_delta
          IMPORTING
            i_name        TYPE csequence
            i_uri         TYPE string
            i_wb_object   type ref to cl_wb_object.

  DATA:

    deltas TYPE if_art_source_delta=>tab READ-ONLY.

ENDINTERFACE.