CLASS zcl_email_reminder DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_notification_email .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EMAIL_REMINDER IMPLEMENTATION.


  METHOD zif_notification_email~display.
  ENDMETHOD.


  METHOD zif_notification_email~send_email.
  ENDMETHOD.
ENDCLASS.
