CLASS zcl_subject DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS attach IMPORTING i_observer TYPE REF TO zif_observer.
    METHODS detach IMPORTING i_observer TYPE REF TO zif_observer.
    METHODS notify IMPORTING i_message  TYPE zif_observer=>message.

  PRIVATE SECTION.
    DATA observers TYPE STANDARD TABLE OF REF TO zif_observer WITH DEFAULT KEY.
ENDCLASS.


CLASS zcl_subject IMPLEMENTATION.
  METHOD attach.
    APPEND i_observer TO observers.
  ENDMETHOD.

  METHOD detach.
    DELETE observers WHERE table_line = i_observer.
  ENDMETHOD.

  METHOD notify.
    LOOP AT observers INTO DATA(lo_observer).
      lo_observer->update( i_message ).
    ENDLOOP.
  ENDMETHOD.


ENDCLASS.
