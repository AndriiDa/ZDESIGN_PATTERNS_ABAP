CLASS zcl_sales_order_builder DEFINITION PUBLIC CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      constructor,
      set_order_type     IMPORTING iv_value       TYPE string
                         RETURNING VALUE(builder) TYPE REF TO zcl_sales_order_builder,
      set_sales_org      IMPORTING iv_value       TYPE string
                         RETURNING VALUE(builder) TYPE REF TO zcl_sales_order_builder,
      set_customer       IMPORTING iv_value       TYPE string
                         RETURNING VALUE(builder) TYPE REF TO zcl_sales_order_builder,
      set_payment_terms  IMPORTING iv_value       TYPE string
                         RETURNING VALUE(builder) TYPE REF TO zcl_sales_order_builder,
      set_incoterms      IMPORTING iv_value       TYPE string
                         RETURNING VALUE(builder) TYPE REF TO zcl_sales_order_builder,
      set_delivery_block IMPORTING iv_value       TYPE string
                         RETURNING VALUE(builder) TYPE REF TO zcl_sales_order_builder,
      build RETURNING VALUE(ro_order) TYPE REF TO zcl_sales_order.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA order TYPE REF TO zcl_sales_order.
ENDCLASS.



CLASS ZCL_SALES_ORDER_BUILDER IMPLEMENTATION.


  METHOD constructor.
    order = zcl_sales_order=>create(  ). "Factory method handles CREATE PRIVATE
  ENDMETHOD.


METHOD set_order_type.
    order->set_order_type( iv_value ).
    builder = me.
  ENDMETHOD.


  METHOD set_sales_org.
    order->set_sales_org( iv_value ).
    builder = me.
  ENDMETHOD.


  METHOD set_customer.
    order->set_customer( iv_value ).
    builder = me.
  ENDMETHOD.


  METHOD set_payment_terms.
    order->set_payment_terms( iv_value ).
    builder = me.
  ENDMETHOD.


  METHOD set_incoterms.
    order->set_incoterms( iv_value ).
    builder = me.
  ENDMETHOD.


  METHOD set_delivery_block.
    order->set_delivery_block( iv_value ).
    builder = me.
  ENDMETHOD.


  METHOD build.
    ro_order = order.
  ENDMETHOD.
ENDCLASS.
