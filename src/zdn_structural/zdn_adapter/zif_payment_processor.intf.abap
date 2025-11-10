INTERFACE zif_payment_processor
  PUBLIC.
  METHODS process_payment
    IMPORTING iv_amount        TYPE wrbtr
              iv_currency      TYPE curtp
    RETURNING VALUE(rv_status) TYPE string.
ENDINTERFACE.
