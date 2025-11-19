CLASS zcl_remove_stock_cmd DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_command.

    METHODS constructor IMPORTING io_service  TYPE REF TO zcl_inventory_service
                                  iv_material TYPE string
                                  iv_qty      TYPE i.

  PRIVATE SECTION.
    DATA mo_service  TYPE REF TO zcl_inventory_service.
    DATA mv_material TYPE string.
    DATA mv_qty      TYPE i.

ENDCLASS.


CLASS zcl_remove_stock_cmd IMPLEMENTATION.
  METHOD constructor.
    mo_service = io_service.
    mv_material = iv_material.
    mv_qty = iv_qty.
  ENDMETHOD.

  METHOD zif_command~execute.
    rv_result = mo_service->remove_stock( iv_material = mv_material
                                          iv_qty      = mv_qty ).
  ENDMETHOD.
ENDCLASS.
