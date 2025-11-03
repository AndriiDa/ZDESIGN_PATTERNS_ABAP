INTERFACE zif_notification_factory
  PUBLIC.

  METHODS get_email
    IMPORTING iv_factoty_type TYPE !string
    RETURNING VALUE(ro_notif) TYPE REF TO zif_notification_email.

  METHODS get_sms
    IMPORTING iv_factoty_type TYPE !string
    RETURNING VALUE(ro_notif) TYPE REF TO zif_notification_sms.

ENDINTERFACE.
