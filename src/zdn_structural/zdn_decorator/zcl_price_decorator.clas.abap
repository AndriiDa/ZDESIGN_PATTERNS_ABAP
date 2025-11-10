CLASS zcl_price_decorator DEFINITION ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_price_calculator .
    METHODS constructor
      IMPORTING
        !io_component TYPE REF TO zif_price_calculator.

  PROTECTED SECTION.
    DATA: mo_component TYPE REF TO zif_price_calculator.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_price_decorator IMPLEMENTATION.
  METHOD constructor.
    mo_component = io_component.
  ENDMETHOD.
ENDCLASS.
