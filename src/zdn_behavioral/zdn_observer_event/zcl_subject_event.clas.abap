CLASS zcl_subject_event DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
***EVENTS state_changed: Declares an event that observers can handle.
***RAISE EVENT: Triggers the event when the state changes

    EVENTS state_changed
      EXPORTING VALUE(message) TYPE string.

    METHODS:
      change_state IMPORTING i_message TYPE string.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_subject_event IMPLEMENTATION.
  METHOD change_state.
    " Trigger the event when the state changes
    RAISE EVENT state_changed EXPORTING message = i_message.
  ENDMETHOD.

ENDCLASS.
