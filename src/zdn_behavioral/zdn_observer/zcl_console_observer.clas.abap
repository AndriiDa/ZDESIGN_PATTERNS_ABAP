CLASS zcl_console_observer DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_observer.

    TYPES ty_log_messages TYPE TABLE OF zif_observer~messages WITH DEFAULT KEY.

    METHODS get_messages RETURNING VALUE(r_result) TYPE ty_log_messages.

  PRIVATE SECTION.
    DATA lt_log_messages TYPE TABLE OF zif_observer~messages.
ENDCLASS.


CLASS zcl_console_observer IMPLEMENTATION.
  METHOD zif_observer~update.
    " Append the received message to the log messages table
    APPEND VALUE #( ( type_message = | Console: { i_message-content } |
                      content      = i_message-content )  ) TO lt_log_messages.
  ENDMETHOD.

  METHOD get_messages.
    r_result = lt_log_messages.
  ENDMETHOD.
ENDCLASS.
