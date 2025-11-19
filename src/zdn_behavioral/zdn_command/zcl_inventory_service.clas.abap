CLASS zcl_inventory_service DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS add_stock IMPORTING iv_material   TYPE string
                                iv_qty        TYPE i
                      RETURNING VALUE(rv_msg) TYPE string.

    METHODS remove_stock IMPORTING iv_material   TYPE string
                                   iv_qty        TYPE i
                         RETURNING VALUE(rv_msg) TYPE string.

    METHODS transfer_stock IMPORTING iv_material   TYPE string
                                     iv_qty        TYPE i
                                     iv_target     TYPE string
                           RETURNING VALUE(rv_msg) TYPE string.

ENDCLASS.


CLASS zcl_inventory_service IMPLEMENTATION.
  METHOD add_stock.
    rv_msg = |Added { iv_qty } units to material { iv_material }|.
  ENDMETHOD.

  METHOD remove_stock.
    rv_msg = |Removed { iv_qty } units from material { iv_material }|.
  ENDMETHOD.

  METHOD transfer_stock.
    rv_msg = |Transferred { iv_qty } units of { iv_material } to { iv_target }|.
  ENDMETHOD.
ENDCLASS.
