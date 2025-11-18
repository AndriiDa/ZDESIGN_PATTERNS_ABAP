CLASS zcl_sales_order_originator DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
      TYPES: BEGIN OF ty_order_data,
                 quantity TYPE i,
                 price    TYPE wrbtr,
             END OF ty_order_data.

    METHODS constructor IMPORTING i_quantity TYPE i
                                  i_price    TYPE wrbtr.

    METHODS set_quantity    IMPORTING i_quantity      TYPE i.
    METHODS set_price       IMPORTING i_price         TYPE wrbtr.

METHODS get_data
  RETURNING VALUE(result) TYPE ty_order_data.

    METHODS create_memento  RETURNING VALUE(ro_state) TYPE REF TO zcl_sales_order_state.
    METHODS restore_memento IMPORTING io_state        TYPE REF TO zcl_sales_order_state.

  PRIVATE SECTION.
    DATA quantity TYPE i.
    DATA price    TYPE wrbtr.
ENDCLASS.


CLASS zcl_sales_order_originator IMPLEMENTATION.
  METHOD constructor.
    quantity = i_quantity.
    price    = i_price.
  ENDMETHOD.

  METHOD set_quantity.
    quantity = i_quantity.
  ENDMETHOD.

  METHOD set_price.
    price = i_price.
  ENDMETHOD.

  METHOD create_memento.
    ro_state = NEW zcl_sales_order_state( i_quantity = quantity
                                          i_price    = price ).
  ENDMETHOD.

  METHOD restore_memento.
    quantity = io_state->get_data(  )-quantity.
    price    = io_state->get_data(  )-price.
  ENDMETHOD.

  METHOD get_data.
    result-quantity = quantity.
    result-price    = price.
  ENDMETHOD.

ENDCLASS.
