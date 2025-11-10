CLASS zcl_legacy_payment DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      make_payment
        IMPORTING
          iv_total TYPE wrbtr
          iv_curr  TYPE curtp
        RETURNING VALUE(rv_success) TYPE abap_bool,

      display_payment
        RETURNING VALUE(rv_output) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      mv_last_amount TYPE wrbtr,
      mv_last_currency TYPE curtp.
ENDCLASS.


CLASS zcl_legacy_payment IMPLEMENTATION.
  METHOD make_payment.
    " Simulate payment logic
    mv_last_amount = iv_total.
    mv_last_currency = iv_curr.

    " Here you could call external services, BAPIs, etc.
    rv_success = abap_true.
  ENDMETHOD.

  METHOD display_payment.
    rv_output = |Last payment: { mv_last_amount } { mv_last_currency }|.
  ENDMETHOD.
ENDCLASS.
