CLASS zcl_sales_model DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_sales_model.
    ALIASES get_sales_order FOR zif_sales_model~get_sales_order.
ENDCLASS.


CLASS zcl_sales_model IMPLEMENTATION.
  METHOD zif_sales_model~get_sales_order.
    rs_order-order_id = iv_order_id.
    rs_order-customer = 'ACME Corp'.
    rs_order-items    = VALUE #( ( product = 'Laptop' quantity = 2 price = '1200.00' )
                                 ( product = 'Mouse'  quantity = 5 price = '25.00' ) ).
  ENDMETHOD.
ENDCLASS.
