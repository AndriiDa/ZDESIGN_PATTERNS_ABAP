CLASS zcl_payment_adapter DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_payment_processor .

    METHODS:
      constructor IMPORTING io_legacy TYPE REF TO zcl_legacy_payment.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mo_legacy TYPE REF TO zcl_legacy_payment.
ENDCLASS.


CLASS zcl_payment_adapter IMPLEMENTATION.
  METHOD zif_payment_processor~process_payment.
    " Adapt interface
    mo_legacy->make_payment( iv_total = iv_amount
                             iv_curr  = iv_currency ).
  ENDMETHOD.

  METHOD constructor.
    mo_legacy = io_legacy.
  ENDMETHOD.
ENDCLASS.
