  PRIVATE SECTION.

    CLASS-DATA singleton TYPE REF TO cl_quickfix_adt_helper .

    DATA uri_mapper TYPE REF TO if_adt_uri_mapper .

    METHODS create_source_position
      IMPORTING
        !uri              TYPE csequence
        !mapping_options  TYPE REF TO if_adt_mapping_options OPTIONAL
      RETURNING
        VALUE(r_position) TYPE REF TO cl_pst_source_position
      RAISING
        cx_adt_uri_mapping .

    METHODS map_include_source_object
      IMPORTING
         source_object TYPE REF TO if_quickfix_source_object
      RETURNING
        VALUE(result)  TYPE if_adt_object_reference_ch=>ty_object_reference
      RAISING
        cx_adt_uri_mapping .
    METHODS map_sbd_object
      IMPORTING
        i_source_object TYPE REF TO if_quickfix_source_object
      RETURNING
        value(r_result)   TYPE sadt_object_reference.
