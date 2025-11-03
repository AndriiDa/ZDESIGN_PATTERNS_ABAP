CLASS zcl_standard_pricing DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_pricing_strategy .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_standard_pricing IMPLEMENTATION.


  METHOD zif_pricing_strategy~calculate_price.
    result = iv_base_price.
  ENDMETHOD.
ENDCLASS.
