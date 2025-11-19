CLASS zcl_el_order DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_visitor_target.

    TYPES: BEGIN OF ty_item,
             product TYPE REF TO zcl_el_product,
             qty     TYPE i,
           END OF ty_item.

    TYPES tt_items TYPE STANDARD TABLE OF ty_item WITH DEFAULT KEY.

    METHODS get_items
      RETURNING VALUE(rt_items) TYPE tt_items.

    METHODS add_item
      IMPORTING io_product TYPE REF TO zcl_el_product
                qty        TYPE i.

  PRIVATE SECTION.
    DATA mt_items TYPE STANDARD TABLE OF ty_item WITH EMPTY KEY.

ENDCLASS.


CLASS zcl_el_order IMPLEMENTATION.
  METHOD add_item.
    APPEND VALUE ty_item( product = io_product
                          qty     = qty ) TO mt_items.
  ENDMETHOD.

  METHOD get_items.
    rt_items = mt_items.
  ENDMETHOD.

  METHOD zif_visitor_target~accept.
    io_visitor->visit_order( me ).
  ENDMETHOD.
ENDCLASS.
