INTERFACE zif_bank_payme
  PUBLIC .

*  CLASS-METHODS:
*    get_bank_instance
*      IMPORTING !iv_label        TYPE string
*      RETURNING VALUE(ro_result) TYPE REF TO zif_bank_payme.

  METHODS:
    is_account_active
        IMPORTING iv_account       TYPE string
        RETURNING VALUE(rv_result) type xsdboolean,
    execute_payment
      IMPORTING iv_account       TYPE string
                iv_amount        TYPE decfloat34
      RETURNING VALUE(rv_result) TYPE string.

ENDINTERFACE.
