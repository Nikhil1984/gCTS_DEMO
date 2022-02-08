  METHOD create_affected_object.

    DATA: mapping_options TYPE REF TO if_adt_source_mapping_options,
          include TYPE progname,
          wb_object TYPE REF TO cl_wb_object.

      mapping_options = cl_adt_tools_core_factory=>get_instance( )->create_source_mapping_options( ).
      mapping_options->set_source_code_uri( i_adt_object_reference-uri ).
      mapping_options->set_context_check_enabled( context_check = abap_true empty_context_is_valid = abap_true ).
      mapping_options->if_adt_mapping_options~set_use_parent( abap_false ).
      mapping_options->if_adt_mapping_options~set_use_source_based_position( abap_true ).


      me->uri_mapper->map_objref_to_include( EXPORTING uri = i_adt_object_reference-uri mapping_options = mapping_options
                                             IMPORTING include = include ).

      wb_object = me->uri_mapper->map_objref_to_wb_object( i_adt_object_reference-uri ).

      r_result = cl_quickfix_source_object=>create(
        i_content = i_content
        i_wb_object = wb_object
        i_include = include ).

  ENDMETHOD.