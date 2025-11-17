CLASS zcl_pricing_context DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING io_price TYPE REF TO zif_pricing_strategy,

      get_price IMPORTING iv_base_price   TYPE decfloat34
                RETURNING VALUE(rv_price) TYPE decfloat34.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mo_strategy TYPE REF TO zif_pricing_strategy.
ENDCLASS.



CLASS ZCL_PRICING_CONTEXT IMPLEMENTATION.


  METHOD constructor.
    mo_strategy = io_price.
  ENDMETHOD.


  METHOD get_price.
    rv_price = mo_strategy->calculate_price( iv_base_price ).
  ENDMETHOD.
ENDCLASS.
