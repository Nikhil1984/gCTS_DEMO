  METHOD map_sbd_object.
    r_result-uri = i_source_object->get_source_uri( ).
    r_result-name = i_source_object->get_name( ).
    r_result-description = i_source_object->get_description( ).
  ENDMETHOD.