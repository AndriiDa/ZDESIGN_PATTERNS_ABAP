CLASS zcl_deutsche_payment DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_bank_payme .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DEUTSCHE_PAYMENT IMPLEMENTATION.


  METHOD zif_bank_payme~execute_payment.
  rv_result = |Payment of { iv_amount } to Deutsch account { iv_account } processed|.
  ENDMETHOD.


  METHOD zif_bank_payme~is_account_active.
  rv_result = abap_false.
  ENDMETHOD.
ENDCLASS.
