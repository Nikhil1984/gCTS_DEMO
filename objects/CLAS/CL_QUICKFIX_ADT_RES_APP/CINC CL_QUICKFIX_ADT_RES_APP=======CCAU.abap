*"* use this source file for your ABAP unit test classes

class ltcl_check_routing definition final for testing
  duration short
  risk level harmless .
  public section.
    methods:
      check_compatibility for testing raising cx_static_check.
  private section.
    data test_client type ref to cl_adt_res_app_test_tool.
    methods setup.
endclass.

*----------------------------------------------------------------------*
*       CLASS ltcl_check_routing IMPLEMENTATION
*----------------------------------------------------------------------*
class ltcl_check_routing implementation.

  method setup.
    data application type ref to cl_quickfix_adt_res_app.
    create object application.
    create object test_client exporting application = application.
  endmethod.

  method check_compatibility.
    test_client->set_uri( '/quickfixes/proposals/providers/refactoring/quickfixes/my_quickfix' ).
    cl_abap_unit_assert=>assert_equals( exp = 'CL_QUICKFIX_ADT_RES_COMMAND'  act = test_client->get_handler( ) ).
  endmethod.

endclass.