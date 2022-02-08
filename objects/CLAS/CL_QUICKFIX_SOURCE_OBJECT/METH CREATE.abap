  METHOD create.

    CREATE OBJECT result
      EXPORTING
        wb_object = i_wb_object.

    result->source_position = i_source_position.
    result->source = i_content.
    result->uri = i_uri.

    if i_include is not initial and i_source_position is not initial.
      assert i_include = i_source_position->include.
      result->include = i_include.
    elseif i_include is not initial.
      result->include = i_include.
    elseif i_source_position is not initial.
      result->include = i_source_position->include.
    endif.

    result->name = i_name.
    result->description = i_description.
    result->links = i_links.

  ENDMETHOD.