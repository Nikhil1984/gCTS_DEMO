
INTERFACE if_quickfix_source_object PUBLIC.

  TYPES: tab TYPE STANDARD TABLE OF REF TO if_quickfix_source_object WITH DEFAULT KEY.

  METHODS:

    get_object_type
      RETURNING
        VALUE(result) TYPE wbobjtype,

    get_wb_object
      RETURNING
        VALUE(result) TYPE REF TO cl_wb_object,

    set_source_code
      IMPORTING
        source_tab TYPE rswsourcet,

    get_source_code
      EXPORTING
        source_code TYPE rswsourcet,

    get_source_code_as_string
      EXPORTING
        source_code TYPE string,

    set_source_code_as_string
      IMPORTING
        source_code TYPE string,

    get_source_position
      RETURNING
        VALUE(result) TYPE REF TO cl_pst_source_position,

    get_source_uri
      RETURNING
        VALUE(uri) TYPE string,

    get_include
      returning value(include) type programm,

    get_name
      returning value(name) type string,

    get_description
      returning value(description) type string,

    get_atom_links DEFAULT IGNORE
     RETURNING VALUE(links)  TYPE if_atom_types=>link_t.

ENDINTERFACE.