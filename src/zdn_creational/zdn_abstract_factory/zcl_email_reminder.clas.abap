CLASS zcl_email_reminder DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_notification_email .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_email_reminder IMPLEMENTATION.
  METHOD zif_notification_email~send_email.
  ENDMETHOD.

  METHOD zif_notification_email~display.
  ENDMETHOD.
ENDCLASS.
