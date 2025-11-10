CLASS zcl_surcharge_decorator DEFINITION INHERITING FROM zcl_price_decorator
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: zif_price_calculator~get_price
        REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_surcharge_decorator IMPLEMENTATION.
  METHOD zif_price_calculator~get_price.
    rv_price = mo_component->get_price( iv_material ).
    rv_price = rv_price +  15. " Add fixed surcharge
  ENDMETHOD.
ENDCLASS.
