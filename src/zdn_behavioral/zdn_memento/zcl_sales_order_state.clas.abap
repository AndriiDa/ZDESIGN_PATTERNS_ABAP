CLASS zcl_sales_order_state DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_order_data,
             quantity TYPE i,
             price    TYPE wrbtr,
           END OF ty_order_data.

    METHODS constructor IMPORTING i_quantity TYPE i
                                  i_price    TYPE wrbtr.

    METHODS get_data RETURNING VALUE(result) TYPE ty_order_data.

  PRIVATE SECTION.
    DATA quantity TYPE i.
    DATA price    TYPE wrbtr.
ENDCLASS.


CLASS zcl_sales_order_state IMPLEMENTATION.
  METHOD constructor.
    quantity = i_quantity.
    price = i_price.
  ENDMETHOD.

  METHOD get_data.
    result = VALUE ty_order_data( quantity = quantity
                                  price    = price ).
  ENDMETHOD.
ENDCLASS.
