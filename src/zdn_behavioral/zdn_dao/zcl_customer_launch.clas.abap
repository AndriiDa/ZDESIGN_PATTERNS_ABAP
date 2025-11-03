CLASS zcl_customer_launch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_customer_launch IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA(customer1_id) = NEW zcl_dao_customer_src1( ).
    DATA(customer2_id) = NEW zcl_dao_customer_src2( ).

    out->write( |Source1 Customer Name| ).
    out->write( data = customer1_id->zif_dao_customer~get_customer_by_id( iv_kunnr = '100003' ) ).

    out->write( |=================| ).
    out->write( |Source2 Customer Name| ).
    out->write( data = customer2_id->zif_dao_customer~get_customer_by_id( iv_kunnr = '100003' ) ).
  ENDMETHOD.
ENDCLASS.
