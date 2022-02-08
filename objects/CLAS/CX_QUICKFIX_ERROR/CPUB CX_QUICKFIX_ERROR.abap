class CX_QUICKFIX_ERROR definition
  public
  inheriting from CX_ADT_REST
  create public .

public section.

  constants:
    BEGIN OF literal_operator_not_supported,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '132',
            attr1 TYPE scx_attrname VALUE '',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
          END OF literal_operator_not_supported .
  constants:
    BEGIN OF incompatble_type_4_deflt_param,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '140',
            attr1 TYPE scx_attrname VALUE '',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
          END OF incompatble_type_4_deflt_param .
  constants:
    BEGIN OF no_default_for_parameter_type,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '176',
            attr1 TYPE scx_attrname VALUE 'MSGV1',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
          END OF no_default_for_parameter_type .
  constants:
    BEGIN OF data_ref_invisible_for_param,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '178',
            attr1 TYPE scx_attrname VALUE 'MSGV1',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
          END OF data_ref_invisible_for_param .
  constants:
    BEGIN OF var_defined_with_like_4_param,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '179',
            attr1 TYPE scx_attrname VALUE 'MSGV1',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
          END OF var_defined_with_like_4_param .
  constants:
    BEGIN OF var_defined_inline_4_imp_param,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '180',
            attr1 TYPE scx_attrname VALUE '',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
          END OF var_defined_inline_4_imp_param .
  constants:
    BEGIN OF type_invisible_for_param,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '181',
            attr1 TYPE scx_attrname VALUE 'MSGV1',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
          END OF type_invisible_for_param .
  constants:
    BEGIN OF structured_var_not_promotable,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '181',
            attr1 TYPE scx_attrname VALUE 'MSGV1',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
          END OF structured_var_not_promotable .
  constants:
    BEGIN OF no_convert_to_param_for_type,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '177',
            attr1 TYPE scx_attrname VALUE 'MSGV1',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
          END OF no_convert_to_param_for_type .
  constants:
    BEGIN OF assist_not_possible,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '188',
            attr1 TYPE scx_attrname VALUE '',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
          END OF assist_not_possible .
  constants:
    BEGIN OF textpool_is_locked,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '189',
            attr1 TYPE scx_attrname VALUE 'MSGV1',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
          END OF textpool_is_locked .
  constants:
    BEGIN OF sql_view_name_not_found,
        msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
        msgno TYPE symsgno VALUE '228',
        attr1 TYPE scx_attrname VALUE 'MSGV1',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF sql_view_name_not_found .
  constants:
    BEGIN OF gen_create_stmnt_failed,
        msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
        msgno TYPE symsgno VALUE '231',
        attr1 TYPE scx_attrname VALUE 'MSGV1',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF gen_create_stmnt_failed .
  constants:
    BEGIN OF entity_not_found,
        msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
        msgno TYPE symsgno VALUE '232',
        attr1 TYPE scx_attrname VALUE 'MSGV1',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF entity_not_found .
  constants:
    BEGIN OF table_function_not_supported,
        msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
        msgno TYPE symsgno VALUE '311',
        attr1 TYPE scx_attrname VALUE 'MSGV1',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF table_function_not_supported .
  constants:
    BEGIN OF old_client_not_supported,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '233',
            attr1 TYPE scx_attrname VALUE '',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
      END OF old_client_not_supported .
  constants:
    BEGIN OF create_method_on_SAP_class,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '235',
            attr1 TYPE scx_attrname VALUE 'MSGV1',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
      END OF create_method_on_SAP_class .
  constants:
    BEGIN OF create_method_on_SAP_interface,
            msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
            msgno TYPE symsgno VALUE '236',
            attr1 TYPE scx_attrname VALUE 'MSGV1',
            attr2 TYPE scx_attrname VALUE '',
            attr3 TYPE scx_attrname VALUE '',
            attr4 TYPE scx_attrname VALUE '',
      END OF create_method_on_SAP_interface .
  constants:
    BEGIN OF test_method_gen_failed,
        msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
        msgno TYPE symsgno VALUE '308',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF test_method_gen_failed .
  constants:
    BEGIN OF no_doubles_available,
        msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
        msgno TYPE symsgno VALUE '309',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_doubles_available .
  constants:
    BEGIN OF no_cds_under_test,
        msgid TYPE symsgid VALUE 'RFAC_QUICKFIX',
        msgno TYPE symsgno VALUE '310',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_cds_under_test .

  methods CONSTRUCTOR
    importing
       TEXTID like IF_T100_MESSAGE=>T100KEY optional
       PREVIOUS like PREVIOUS optional
       SUBTYPE type SADT_EXC_TYPE optional
       MSGV1 type SYMSGV default SY-MSGV1
       MSGV2 type SYMSGV default SY-MSGV2
       MSGV3 type SYMSGV default SY-MSGV3
       MSGV4 type SYMSGV default SY-MSGV4
       PROPERTIES type ref to IF_ADT_EXCEPTION_PROPERTIES optional .
  methods SET_STATUS_CODE
    importing
      I_STATUS_CODE type I.

  methods GET_HTTP_STATUS
    redefinition .
  methods GET_NAMESPACE
    redefinition .
  methods GET_TYPE
    redefinition .