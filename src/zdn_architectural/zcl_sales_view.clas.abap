CLASS zcl_sales_view DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_sales_view.
    ALIASES display_order FOR zif_sales_view~display_order.
ENDCLASS.


CLASS zcl_sales_view IMPLEMENTATION.
  METHOD zif_sales_view~display_order.
    out->write( |Order ID: { is_order-order_id }| ).
    out->write( |Customer: { is_order-customer }| ).
    out->write( |Items:| ).
    LOOP AT is_order-items INTO DATA(ls_item).
      out->write( | - { ls_item-product } x{ ls_item-quantity } @ { ls_item-price } EUR| ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
