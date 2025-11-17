CLASS zcl_sms_reminder DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_notification_sms .
  PROTECTED SECTION.
  PRIVATE SECTION.
  data: sms_data type zif_notification_sms=>ty_sms_data.
ENDCLASS.



CLASS ZCL_SMS_REMINDER IMPLEMENTATION.


  METHOD zif_notification_sms~display.
    result  = sms_data.
  ENDMETHOD.


  METHOD zif_notification_sms~send_sms.
    sms_data-message = iv_message.
    sms_data-phone_number = iv_phone_number .
    sms_data-status = iv_status.
  ENDMETHOD.
ENDCLASS.
