  METHOD if_quickfix_result~add_textsymbol_delta.

    DATA: delta       TYPE REF TO cl_quickfix_source_object,
          uri         TYPE string,
          object_name TYPE seu_objkey,
          object_type TYPE wbobjtype.

    ASSERT me->wb_object IS BOUND.

    me->wb_object->get_global_wb_key( IMPORTING p_object_name = object_name ).

    object_type-objtype_tr = 'PROG'.
    object_type-subtype_wb = 'PX'.

    uri = cl_adt_uri_builder_vit=>create_uri(
        object_type  = 'progpx'
        object_name  = object_name
        text_type    = 'I'
        text_key     = i_key ).

    DATA(wb_object) = cl_wb_object=>create_from_global_type( p_object_type = object_type
                                                             p_object_key  = object_name ).

    if_quickfix_result~add_link_to_object_delta( i_name = i_name
                                                 i_uri = uri
                                                 i_wb_object = wb_object ).

  ENDMETHOD.