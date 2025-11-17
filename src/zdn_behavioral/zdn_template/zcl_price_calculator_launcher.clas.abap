CLASS zcl_price_calculator_launcher DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_PRICE_CALCULATOR_LAUNCHER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lo_object    TYPE REF TO object,
          lo_absstract TYPE REF TO zcl_price_calculator,
*          price_type   TYPE string VALUE 'ZCL_EXPORT_PRICE'.
          price_type   TYPE string VALUE 'ZCL_DOMESTIC_PRICE'.

    create object lo_object type (price_type).
    lo_absstract ?= lo_object.

    data(calculate) = lo_absstract->calculate_price(  ).
    out->write( calculate ).
  ENDMETHOD.
ENDCLASS.
