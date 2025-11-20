CLASS zcl_mvc_demo DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_mvc_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_controller) = NEW zcl_sales_controller( ).
    lo_controller->run( out ).
  ENDMETHOD.
ENDCLASS.
