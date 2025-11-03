CLASS zcl_pricing_context_launch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pricing_context_launch IMPLEMENTATION.



METHOD if_oo_adt_classrun~main.

  " Table of strategy objects
  DATA lt_strategies TYPE STANDARD TABLE OF REF TO zif_pricing_strategy.
  DATA lv_base_price TYPE decfloat34 VALUE '100.00'.

  " Fill strategies
  APPEND NEW zcl_standard_pricing( ) TO lt_strategies.
  APPEND NEW zcl_discount_pricing( ) TO lt_strategies.
  APPEND NEW zcl_promo_pricing( )    TO lt_strategies.

  " Loop through strategies and calculate price
  LOOP AT lt_strategies INTO DATA(lo_strategy).
    DATA(lo_context) = NEW zcl_pricing_context( lo_strategy ).
    DATA(lv_price)   = lo_context->get_price( iv_base_price = lv_base_price ).

    out->write( |Strategy Price: { lv_price }| ).
  ENDLOOP.

ENDMETHOD.

ENDCLASS.
