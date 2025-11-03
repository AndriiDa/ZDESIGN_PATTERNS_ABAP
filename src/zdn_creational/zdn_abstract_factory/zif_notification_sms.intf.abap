INTERFACE zif_notification_sms
  PUBLIC.


TYPES: BEGIN OF ty_sms_data,
           phone_number TYPE string,
           message      TYPE string,
           status       TYPE string,
         END OF ty_sms_data.

  METHODS: send_sms
    IMPORTING
      iv_phone_number  TYPE string
      iv_message       TYPE string
    RETURNING
      VALUE(rv_status) TYPE string,

    display
    RETURNING
      VALUE(result) TYPE ty_sms_data.


ENDINTERFACE.
