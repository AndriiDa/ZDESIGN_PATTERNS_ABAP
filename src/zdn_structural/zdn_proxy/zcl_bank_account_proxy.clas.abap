
CLASS zcl_bank_account_proxy DEFINITION PUBLIC CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_bank_account.

    METHODS constructor
      IMPORTING account TYPE REF TO zcl_bank_account
                !user   TYPE syuname.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA account TYPE REF TO zcl_bank_account.
    DATA user    TYPE syuname.
    DATA: msg_authorized TYPE string.

    METHODS is_authorized
      IMPORTING iv_action            TYPE string
      RETURNING VALUE(rv_authorized) TYPE abap_bool.
ENDCLASS.



CLASS ZCL_BANK_ACCOUNT_PROXY IMPLEMENTATION.


  METHOD constructor.
    me->account = account.
    me->user    = user.
  ENDMETHOD.


  METHOD zif_bank_account~withdraw.
    IF is_authorized( iv_action = 'WITHDRAW' ).
      success = account->zif_bank_account~withdraw( amount ).
    ELSE.
      success = abap_false.
      msg_authorized = 'Unauthorized withdrawal attempt'.
    ENDIF.
  ENDMETHOD.


  METHOD is_authorized.
    " Demo purpose: simple check (replace with AUTHORITY-CHECK in real case)
*    rv_authorized = xsdbool( user = 'ADMIN' ).  " Only ADMIN allowed
    rv_authorized = xsdbool( user = sy-uname ).  " Only ADMIN allowed
  ENDMETHOD.
ENDCLASS.
