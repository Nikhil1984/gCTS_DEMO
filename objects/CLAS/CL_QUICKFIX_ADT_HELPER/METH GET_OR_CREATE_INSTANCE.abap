  METHOD get_or_create_instance.
    IF singleton IS NOT BOUND.
      CREATE OBJECT singleton.
      singleton->uri_mapper       = cl_adt_tools_core_factory=>get_instance( )->get_uri_mapper( ).
    ENDIF.
    result = singleton.
  ENDMETHOD.                    "get_or_create_instance