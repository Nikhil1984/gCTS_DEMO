  METHOD create_adt_evaluation_results.
    DATA qf_affected_objects  TYPE if_quickfix_source_object=>tab.
    DATA mapping_options      TYPE REF TO if_adt_source_mapping_options.
    DATA evaluation_result    LIKE LINE OF adt_evaluation_results.
    DATA affected_object      LIKE LINE OF evaluation_result-affected_objects.
    DATA qf_evaluation_result LIKE LINE OF evaluation_results.
    DATA qf_affected_object   LIKE LINE OF qf_affected_objects.

    mapping_options = cl_adt_tools_core_factory=>get_instance( )->create_source_mapping_options( ).
    mapping_options->set_use_source_main( abap_true ).
    mapping_options->if_adt_mapping_options~set_use_fragment( abap_true ).

    LOOP AT evaluation_results INTO qf_evaluation_result.

      CLEAR evaluation_result.

      evaluation_result-object_reference-uri          = qf_evaluation_result->get_uri( ).
      evaluation_result-object_reference-name         = qf_evaluation_result->get_display_name( ).
      evaluation_result-object_reference-description  = qf_evaluation_result->get_description( ).
      evaluation_result-user_content                  = qf_evaluation_result->get_user_content( ).
      evaluation_result-object_reference-type         = qf_evaluation_result->get_type( ).
      qf_affected_objects                             = qf_evaluation_result->get_affected_objects( ).

      LOOP AT qf_affected_objects INTO qf_affected_object.

        CLEAR affected_object.

        affected_object = uri_mapper->map_wb_object_to_objref(
          wb_object       = qf_affected_object->get_wb_object( )
          mapping_options = mapping_options
        )->ref_data.

        READ TABLE evaluation_result-affected_objects WITH KEY uri = affected_object-uri TRANSPORTING NO FIELDS.
        IF sy-subrc <> 0.
          APPEND affected_object TO evaluation_result-affected_objects.
        ENDIF.
      ENDLOOP.

      APPEND evaluation_result TO adt_evaluation_results.
    ENDLOOP.

  ENDMETHOD.                                             "#EC CI_VALPAR