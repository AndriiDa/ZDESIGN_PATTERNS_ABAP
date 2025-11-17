CLASS zcl_sales_order_launch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SALES_ORDER_LAUNCH IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


 " ✅ Create Builder instance first
    DATA(lo_builder) = NEW zcl_sales_order_builder( ).

    " ✅ Chain fluent methods on the builder
    DATA(lo_order) = lo_builder->set_order_type( 'OR' )->set_sales_org( '1000' )->set_customer( 'CUST01' )->set_payment_terms( '0001' )->set_incoterms( 'FOB' )->build( ).

    " ✅ Get structure with order info
    DATA(ls_info) = lo_order->get_order_info( ).

    " ✅ Output result
    out->write( |Order Type: { ls_info-order_type }| ).
    out->write( |Customer:   { ls_info-customer }| ).
    out->write( |Sales Org:  { ls_info-sales_org }| ).

  ENDMETHOD.
ENDCLASS.
