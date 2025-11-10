INTERFACE zif_price_calculator
  PUBLIC .

 METHODS: get_price
    IMPORTING iv_material TYPE matnr
    RETURNING VALUE(rv_price) TYPE wrbtr.

ENDINTERFACE.
