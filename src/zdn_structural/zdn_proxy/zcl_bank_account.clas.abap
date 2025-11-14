CLASS zcl_bank_account DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_bank_account .
    METHODS constructor IMPORTING initial_balance TYPE wrbtr.
  PROTECTED SECTION.
  PRIVATE SECTION.
  data: balance TYPE wrbtr.
ENDCLASS.


CLASS zcl_bank_account IMPLEMENTATION.
  METHOD zif_bank_account~withdraw.
    IF amount <= balance.
      balance -= amount.
      success = abap_true.
    ELSE.
      success = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD constructor.
    balance = initial_balance.
  ENDMETHOD.
ENDCLASS.
