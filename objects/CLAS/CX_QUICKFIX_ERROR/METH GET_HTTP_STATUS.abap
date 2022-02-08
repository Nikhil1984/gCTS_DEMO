  method GET_HTTP_STATUS.
    result = cond #( when status_code is initial then cl_rest_status_code=>gc_client_error_bad_request else status_code ).
  endmethod.