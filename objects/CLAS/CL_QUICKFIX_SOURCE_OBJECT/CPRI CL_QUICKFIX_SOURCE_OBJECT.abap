  PRIVATE SECTION.

    METHODS:

      constructor
        IMPORTING
          wb_object TYPE REF TO cl_wb_object
          source    TYPE string OPTIONAL,

      remove_remaining_crs CHANGING c_source_code TYPE string_table.

    DATA:

      wb_object_type  TYPE        wbobjtype,
      wb_object       TYPE REF TO cl_wb_object,
      source          TYPE        string,
      source_position TYPE REF TO cl_pst_source_position,
      include         type programm,
      name            type string,
      description     type string.

    DATA: uri   TYPE string,
          links TYPE if_atom_types=>link_t.
