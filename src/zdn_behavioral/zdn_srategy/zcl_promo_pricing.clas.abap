CLASS zcl_promo_pricing DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_pricing_strategy .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PROMO_PRICING IMPLEMENTATION.


  METHOD zif_pricing_strategy~calculate_price.
    result = iv_base_price - '5'. "Flat 5 currency units off
  ENDMETHOD.
ENDCLASS.
