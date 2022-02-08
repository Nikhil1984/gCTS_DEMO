  METHOD if_quickfix_result~add_status_message.
    DATA l_status_message TYPE if_quickfix_result=>ty_status_message.
    l_status_message-status_severity = i_status_severity.
    l_status_message-message         = i_message.
    l_status_message-id              = i_id.
    APPEND l_status_message TO status_messages.
  ENDMETHOD.