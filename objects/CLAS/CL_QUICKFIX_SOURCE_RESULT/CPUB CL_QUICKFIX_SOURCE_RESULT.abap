CLASS cl_quickfix_source_result DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: if_quickfix_result.

    CLASS-METHODS create
      IMPORTING
        i_wb_object     TYPE REF TO cl_wb_object OPTIONAL
      RETURNING
        VALUE(r_result) TYPE REF TO cl_quickfix_source_result.

