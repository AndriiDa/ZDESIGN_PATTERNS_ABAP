INTERFACE zif_sales_model
  PUBLIC.

  TYPES: BEGIN OF zsales_item,
           product  TYPE string,
           quantity TYPE i,
           price    TYPE p LENGTH 8 DECIMALS 2,
         END OF zsales_item.

  TYPES: BEGIN OF zsales_order,
           order_id TYPE string,
           customer TYPE string,
           items    TYPE STANDARD TABLE OF zsales_item WITH DEFAULT KEY,
         END OF zsales_order.

  METHODS get_sales_order
    IMPORTING iv_order_id     TYPE string
    RETURNING VALUE(rs_order) TYPE zsales_order.


ENDINTERFACE.
