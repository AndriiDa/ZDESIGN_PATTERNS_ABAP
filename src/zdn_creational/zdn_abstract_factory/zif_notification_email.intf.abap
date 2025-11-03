INTERFACE zif_notification_email
  PUBLIC .
  TYPES: BEGIN OF ty_email_data,
           recipient TYPE string,
           subject   TYPE string,
           body      TYPE string,
         END OF ty_email_data.

  METHODS: send_email
    IMPORTING iv_recipient     TYPE string
              iv_subject       TYPE string
              iv_body          TYPE string
    RETURNING VALUE(rv_status) TYPE string,

    display RETURNING VALUE(result) TYPE ty_email_data.

ENDINTERFACE.
