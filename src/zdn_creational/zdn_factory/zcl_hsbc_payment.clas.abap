CLASS zcl_hsbc_payment DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_bank_payme .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hsbc_payment IMPLEMENTATION.


  METHOD zif_bank_payme~execute_payment.
    rv_result = |Payment of { iv_amount } to HSBC account { iv_account } processed|.
  ENDMETHOD.

  METHOD zif_bank_payme~is_account_active.
    rv_result = abap_true.
  ENDMETHOD.
ENDCLASS.
