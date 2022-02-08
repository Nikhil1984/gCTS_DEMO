  METHOD create_quickfix_source_object.
    DATA:
      mapping_options  TYPE REF TO if_adt_source_mapping_options,
      wb_object        TYPE REF TO cl_wb_object,
      source_as_string TYPE        string,
      uri_mapper       TYPE REF TO if_adt_uri_mapper.

    uri_mapper = cl_adt_tools_core_factory=>get_instance( )->get_uri_mapper( ).
    wb_object = uri_mapper->map_objref_to_wb_object( uri ).

    mapping_options = cl_adt_tools_core_factory=>get_instance( )->create_source_mapping_options( ).
    mapping_options->set_source_code_uri( uri ).
    mapping_options->set_source_code( source ).
    mapping_options->set_context_check_enabled( context_check = abap_true empty_context_is_valid = abap_true ).
    mapping_options->if_adt_mapping_options~set_use_parent( abap_false ).
    mapping_options->if_adt_mapping_options~set_use_source_based_position( abap_true ).

    CONCATENATE LINES OF source INTO source_as_string SEPARATED BY cl_abap_char_utilities=>cr_lf.

    quickfix_source_object = cl_quickfix_source_object=>create(
      i_content   = source_as_string
      i_wb_object = wb_object
      i_source_position  = create_source_position( uri = uri mapping_options = mapping_options )
      i_uri = uri
    ).

  ENDMETHOD.