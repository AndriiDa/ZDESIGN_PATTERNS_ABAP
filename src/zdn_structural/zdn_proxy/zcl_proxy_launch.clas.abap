CLASS zcl_proxy_launch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PROXY_LAUNCH IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " Create real subject
    DATA(lo_real_account) = NEW zcl_bank_account( initial_balance = '1000.00' ).

    " Create proxy wrapping the real account
    DATA(lo_proxy) = NEW zcl_bank_account_proxy( account = lo_real_account
                                                 user    = sy-uname ).

    " Perform withdrawal via proxy
    IF lo_proxy->zif_bank_account~withdraw( amount = '200.00' ) = abap_true.
      out->write( |Withdrawal successful| ).
    ELSE.
      out->write( |Withdrawal failed or unauthorized| ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
