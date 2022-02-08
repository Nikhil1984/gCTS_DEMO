  method CONSTRUCTOR ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous   = previous
        subtype    = subtype
        msgv1      = msgv1
        msgv2      = msgv2
        msgv3      = msgv3
        msgv4      = msgv4
        properties = properties.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.

      if previous is instance of if_t100_dyn_msg.
        "adjust t100 key
        if_t100_message~t100key-attr1 = 'MSGV1'.
        if_t100_message~t100key-attr2 = 'MSGV2'.
        if_t100_message~t100key-attr3 = 'MSGV3'.
        if_t100_message~t100key-attr4 = 'MSGV4'.
      endif.
    ENDIF.

  endmethod.