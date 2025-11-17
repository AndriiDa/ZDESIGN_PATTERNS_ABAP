CLASS zcl_sales_order DEFINITION PUBLIC CREATE PRIVATE.
  PUBLIC SECTION.
    TYPES: BEGIN OF ty_order_info,
             order_type     TYPE string,
             sales_org      TYPE string,
             customer       TYPE string,
             payment_terms  TYPE string,
             incoterms      TYPE string,
             delivery_block TYPE string,
           END OF ty_order_info.

    " Factory method must be PUBLIC
    CLASS-METHODS create RETURNING VALUE(ro_order) TYPE REF TO zcl_sales_order.

    METHODS:
      set_order_type     IMPORTING iv_value TYPE string,
      set_sales_org      IMPORTING iv_value TYPE string,
      set_customer       IMPORTING iv_value TYPE string,
      set_payment_terms  IMPORTING iv_value TYPE string,
      set_incoterms      IMPORTING iv_value TYPE string,
      set_delivery_block IMPORTING iv_value TYPE string.
    METHODS:
      get_order_info RETURNING VALUE(rv_order_info) TYPE ty_order_info.

PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: order_type     TYPE string,
          sales_org      TYPE string,
          customer       TYPE string,
          payment_terms  TYPE string,
          incoterms      TYPE string,
          delivery_block TYPE string.
ENDCLASS.



CLASS ZCL_SALES_ORDER IMPLEMENTATION.


  METHOD get_order_info.
    rv_order_info = VALUE ty_order_info(
      order_type     = order_type
      sales_org      = sales_org
      customer       = customer
      payment_terms  = payment_terms
      incoterms      = incoterms
      delivery_block = delivery_block ).
  ENDMETHOD.


  METHOD set_customer.
    customer = iv_value.
  ENDMETHOD.


  METHOD set_payment_terms.
    payment_terms = iv_value.
  ENDMETHOD.


  METHOD set_delivery_block.
    delivery_block = iv_value.
  ENDMETHOD.


  METHOD set_sales_org.
    sales_org = iv_value.
  ENDMETHOD.


  METHOD set_order_type.
    order_type = iv_value.
  ENDMETHOD.


  METHOD set_incoterms.
    incoterms = iv_value.
  ENDMETHOD.


  METHOD create.
    ro_order = NEW zcl_sales_order( ).
  ENDMETHOD.
ENDCLASS.
