CLASS zcl_order_history DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_history TYPE STANDARD TABLE OF REF TO zcl_sales_order_state WITH DEFAULT KEY.

    METHODS add_state      IMPORTING io_state        TYPE REF TO zcl_sales_order_state.
    METHODS get_last_state RETURNING VALUE(ro_state) TYPE REF TO zcl_sales_order_state.
    METHODS get_history    RETURNING VALUE(r_result) TYPE ty_history.

  PRIVATE SECTION.
    DATA history TYPE STANDARD TABLE OF REF TO zcl_sales_order_state WITH DEFAULT KEY.
ENDCLASS.


CLASS zcl_order_history IMPLEMENTATION.
  METHOD add_state.
    APPEND io_state TO history.
  ENDMETHOD.

  METHOD get_last_state.
    READ TABLE history INTO ro_state INDEX lines( history ).
    DELETE history INDEX lines( history ).
  ENDMETHOD.

  METHOD get_history.
    r_result = history.
  ENDMETHOD.
ENDCLASS.
