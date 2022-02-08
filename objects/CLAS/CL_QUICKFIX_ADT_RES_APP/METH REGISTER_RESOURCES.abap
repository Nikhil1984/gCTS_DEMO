  method register_resources.

    data: accepted_content_types type if_adt_discovery_collection=>ty_accepts,
          atc_quickfixes_enabled type abap_bool,
          l_satc_quickfix        type c length 40.

    append co_content_type_v1 to accepted_content_types.

    registry->register_discoverable_resource(
        accepted_types = accepted_content_types
        url             = |/quickfixes/evaluation|
        handler_class   = 'CL_QUICKFIX_ADT_RES_EVALUATION'
        description     = 'Quickfixes'
        category_scheme = co_scheme
        category_term   = 'evaluation' ) ##NO_TEXT.

    registry->register_resource( template = '/quickfixes/proposals/providers/refactoring/quickfixes/{ quickfix_id }'    handler_class = 'CL_QUICKFIX_ADT_RES_COMMAND' ).
    registry->register_resource( template = '/quickfixes/proposals/providers/wdarefactoring/quickfixes/{ quickfix_id }' handler_class = 'CL_QUICKFIX_ADT_WDY_COMMAND').
    registry->register_resource( template = '/quickfixes/proposals/providers/atc/quickfixes/{ quickfix_id }' handler_class = 'CL_SATC_CI_QUICKFIX_APPLY').

  endmethod.