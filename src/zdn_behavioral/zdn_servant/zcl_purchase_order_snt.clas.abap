CLASS zcl_purchase_order_snt DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_servant_export.

    METHODS constructor IMPORTING iv_id     TYPE string
                                  iv_amount TYPE wrbtr.

  PRIVATE SECTION.
    DATA mv_id     TYPE string.
    DATA mv_amount TYPE wrbtr.

ENDCLASS.


CLASS zcl_purchase_order_snt IMPLEMENTATION.
  METHOD zif_servant_export~get_data.
    rv_data = VALUE zif_servant_export=>zty_data( id       = mv_id
                                                  amount   = mv_amount
                                                  currency = 'EUR' ).
  ENDMETHOD.

  METHOD constructor.
    mv_id = iv_id.
    mv_amount = iv_amount.
  ENDMETHOD.
ENDCLASS.
