CLASS zcl_log_observer_event DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    " FOR EVENT state_changed OF zcl_subject_event: Links the handler method to the event signature.
    " IMPORTING message: Matches the event’s exporting parameter.

    METHODS handle_state_changed
      FOR EVENT state_changed OF zcl_subject_event
      IMPORTING !message.

    METHODS get_messages RETURNING VALUE(r_result) TYPE string.

  PRIVATE SECTION.
    DATA message_log TYPE string.
ENDCLASS.


CLASS zcl_log_observer_event IMPLEMENTATION.
  METHOD handle_state_changed.
    message_log = | State changed event received with message. Log { message }|.
  ENDMETHOD.

  METHOD get_messages.
    r_result = message_log.
  ENDMETHOD.
ENDCLASS.
