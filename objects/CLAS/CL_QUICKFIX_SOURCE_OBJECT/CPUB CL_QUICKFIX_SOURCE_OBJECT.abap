CLASS cl_quickfix_source_object DEFINITION
  PUBLIC
  CREATE PRIVATE .

  PUBLIC SECTION.

    INTERFACES if_quickfix_source_object .

    CLASS-METHODS:

      create
        IMPORTING
          i_wb_object       TYPE REF TO cl_wb_object
          i_content         TYPE csequence OPTIONAL
          i_source_position TYPE REF TO cl_pst_source_position OPTIONAL
          i_uri             TYPE string OPTIONAL
          i_include         TYPE programm OPTIONAL
          i_name            TYPE string OPTIONAL
          i_description     TYPE string OPTIONAL
          i_links           TYPE if_atom_types=>link_t OPTIONAL
        RETURNING
          VALUE(result)     TYPE REF TO cl_quickfix_source_object .
