CLASS zcl_visitor_pricing DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_visit_handler.

    METHODS get_total RETURNING VALUE(rv_total) TYPE decfloat34.

  PRIVATE SECTION.
    DATA mv_total        TYPE decfloat34 VALUE 0.
    DATA mv_current_qty  TYPE i          VALUE 0.
    DATA mv_discount_pct TYPE decfloat34 VALUE 0.

ENDCLASS.


CLASS zcl_visitor_pricing IMPLEMENTATION.
  METHOD zif_visit_handler~visit_customer.
    mv_discount_pct = io_customer->get_discount_pct( ).
  ENDMETHOD.

  METHOD zif_visit_handler~visit_order.
    mv_total = 0.
    LOOP AT io_order->get_items( ) ASSIGNING FIELD-SYMBOL(<item>).
      mv_current_qty = <item>-qty.
      <item>-product->zif_visit_target~accept( me ).  " double-dispatch into visit_product
    ENDLOOP.
    IF mv_discount_pct IS NOT INITIAL.
      mv_total *= ( 1 - mv_discount_pct ).
    ENDIF.
  ENDMETHOD.

  METHOD zif_visit_handler~visit_product.
    mv_total += io_product->get_price( ) * CONV decfloat34( mv_current_qty ).
  ENDMETHOD.

  METHOD get_total.
    rv_total = mv_total.
  ENDMETHOD.
ENDCLASS.
