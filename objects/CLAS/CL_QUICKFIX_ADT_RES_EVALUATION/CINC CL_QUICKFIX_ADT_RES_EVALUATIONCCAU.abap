define append_to.
  append &2 to &1.
end-of-definition.

CLASS ltcl_evaluation DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    METHODS:
      setup,
      intgr_evaluation FOR TESTING RAISING cx_static_check.

    DATA:
      sut                type ref to cl_quickfix_adt_res_evaluation,
      request_stub       type ref to cl_adt_rest_request_stub,
      response_spy       type ref to cl_adt_rest_response_spy,
      data               TYPE        string,
      evaluation_results TYPE        if_quickfix_adt_types=>ty_quickfix_evaluation_results.
ENDCLASS.

CLASS ltcl_evaluation IMPLEMENTATION.
  METHOD setup.
    CREATE OBJECT sut.
    CREATE OBJECT request_stub.
    CREATE OBJECT response_spy.
  ENDMETHOD.

  METHOD intgr_evaluation.
    DATA class_uri TYPE string.
    DATA fragment TYPE cl_adt_text_plain_fragmnt_hndl=>ty_fragment_parsed.
    DATA qf_uri              TYPE string.
    DATA test_client         TYPE REF TO cl_adt_rc_test_client_integr.
    DATA http_status         TYPE i.
    DATA quickfix_eval_out   TYPE if_quickfix_adt_types=>ty_quickfix_evaluation_results.
    data source        type        sadt_srl_plain_text.

    fragment-start-line   = 3.
    fragment-start-offset = 10.

    class_uri = cl_oo_adt_uri_builder_class=>create_uri_for_class_include(
        class_name        = 'CL_RFAC_CLASS_DUMMY'
        include_type      = cl_oo_adt_uri_builder_class=>co_inc_type_main
        fragment          = fragment ).

    append_to source:
      'class CL_RFAC_CLASS_DUMMY definition.',
      'private section.',
      'methods mymethod.',
      'endclass.',
      'class CL_RFAC_CLASS_DUMMY implementation.',
      'endclass.'.

*    class_uri = escape( val = class_uri format = cl_abap_format=>e_xss_url ).

    me->request_stub->add_query_param(
      exporting
        key   = 'uri'
        value = class_uri
    ).
    me->request_stub->add_header_field(
        key   = if_http_header_fields=>accept
        value = if_rest_media_type=>gc_appl_xml
    ).

    try.
        me->request_stub->set_body_data( source ).
        me->sut->post( request = request_stub response = response_spy ).
        me->response_spy->get_body_data( importing data = quickfix_eval_out ).
        evaluation_results = quickfix_eval_out.
        cl_abap_unit_assert=>assert_not_initial( evaluation_results ).
      catch cx_adt_rest.
        cl_aunit_assert=>fail( ).
    endtry.

  ENDMETHOD.

ENDCLASS.