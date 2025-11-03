CLASS zcl_concrete_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_notification_factory.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_concrete_factory IMPLEMENTATION.
  METHOD zif_notification_factory~get_email.
    CASE iv_factoty_type.
      WHEN 'ALERT'.
        ro_notif =     NEW zcl_email_alert( ).
      WHEN 'REMINDER'.
        ro_notif =     NEW zcl_email_reminder( ).
    ENDCASE.
  ENDMETHOD.

  METHOD zif_notification_factory~get_sms.
    CASE iv_factoty_type.
      WHEN 'ALERT'.
        ro_notif =     NEW zcl_sms_alert( ).
      WHEN 'REMINDER'.
        ro_notif = NEW zcl_sms_reminder(  ).
    ENDCASE.

  ENDMETHOD.
ENDCLASS.
