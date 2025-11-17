CLASS zcl_email_alert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_notification_email .

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: email_data TYPE zif_notification_email~ty_email_data.

ENDCLASS.



CLASS ZCL_EMAIL_ALERT IMPLEMENTATION.


  METHOD zif_notification_email~display.
    result = email_data.
  ENDMETHOD.


  METHOD zif_notification_email~send_email.
    email_data-body = iv_body.
    email_data-recipient = iv_recipient.
    email_data-subject = iv_subject.
    rv_status = 'Success'.
  ENDMETHOD.
ENDCLASS.
