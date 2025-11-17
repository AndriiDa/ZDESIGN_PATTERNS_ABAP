CLASS zcl_console_observer_event DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

 METHODS handle_state_changed
      FOR EVENT state_changed OF zcl_subject_event
      IMPORTING message.
 METHODS: get_messages RETURNING value(r_result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
  data: message_console type string.
ENDCLASS.



CLASS zcl_console_observer_event IMPLEMENTATION.
  METHOD handle_state_changed.
    message_console = | State changed event received with message. Console { message }|.
  ENDMETHOD.

  METHOD get_messages.
    r_result = me->message_console.
  ENDMETHOD.

ENDCLASS.
