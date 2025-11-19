CLASS zcl_transfer_stock_cmd DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_command.

    METHODS constructor IMPORTING io_service  TYPE REF TO zcl_inventory_service
                                  iv_material TYPE string
                                  iv_qty      TYPE i
                                  iv_target   TYPE string.

  PRIVATE SECTION.
    DATA mo_service  TYPE REF TO zcl_inventory_service.
    DATA mv_material TYPE string.
    DATA mv_qty      TYPE i.
    DATA mv_target   TYPE string.

ENDCLASS.


CLASS zcl_transfer_stock_cmd IMPLEMENTATION.
  METHOD constructor.
    mo_service = io_service.
    mv_material = iv_material.
    mv_qty = iv_qty.
    mv_target = iv_target.
  ENDMETHOD.

  METHOD zif_command~execute.
    rv_result = mo_service->transfer_stock( iv_material = mv_material
                                            iv_qty      = mv_qty
                                            iv_target   = mv_target ).
  ENDMETHOD.
ENDCLASS.
