  METHOD if_quickfix_result~add_link_to_object_delta.



    data(delta) = cl_quickfix_source_object=>create( i_wb_object = wb_object
                                                     i_uri = to_lower( i_uri )
                                                     i_name = i_name ).

    APPEND delta TO source_deltas.

  ENDMETHOD.