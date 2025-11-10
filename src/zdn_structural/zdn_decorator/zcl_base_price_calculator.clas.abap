CLASS zcl_base_price_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_price_calculator .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_base_price_calculator IMPLEMENTATION.
  METHOD zif_price_calculator~get_price.
    " Simulate base price retrieval
    rv_price = 100. " Example base price
  ENDMETHOD.
ENDCLASS.
