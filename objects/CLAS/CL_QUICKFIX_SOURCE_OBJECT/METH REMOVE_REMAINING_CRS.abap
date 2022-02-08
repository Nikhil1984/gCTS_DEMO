  METHOD remove_remaining_crs.
    DATA: xx     TYPE x VALUE '0D',
          cc     TYPE c LENGTH 1,
          l_conv TYPE REF TO cl_abap_conv_in_ce.

    FIELD-SYMBOLS: <l_string> TYPE string.

    l_conv = cl_abap_conv_in_ce=>create( ).

    TRY.
        l_conv->convert(
          EXPORTING
            input                         =  xx
          IMPORTING
            data                          =  cc  ).

        LOOP AT c_source_code ASSIGNING <l_string>.
          <l_string> = translate( val = <l_string> from = cc to = '' ).
        ENDLOOP.

      CATCH cx_sy_conversion_codepage
            cx_sy_codepage_converter_init
            cx_parameter_invalid_type.
        RETURN.
    ENDTRY.
  ENDMETHOD.