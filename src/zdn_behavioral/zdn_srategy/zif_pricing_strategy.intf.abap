INTERFACE zif_pricing_strategy
  PUBLIC .

METHODS calculate_price
    IMPORTING iv_base_price TYPE decfloat34
    RETURNING VALUE(result) TYPE decfloat34 .

ENDINTERFACE.
