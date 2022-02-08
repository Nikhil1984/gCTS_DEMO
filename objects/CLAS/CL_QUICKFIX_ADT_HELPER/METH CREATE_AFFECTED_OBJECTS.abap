  METHOD create_affected_objects.

    DATA: source_object   TYPE REF TO if_quickfix_source_object,
          affected_object TYPE if_quickfix_adt_types=>ty_quickfix_proposal_delta.

    LOOP AT affected_objects INTO affected_object.

      source_object = me->create_affected_object( i_adt_object_reference = affected_object-affected_object i_content = affected_object-content ).
      APPEND source_object TO result.

    ENDLOOP.

  ENDMETHOD.