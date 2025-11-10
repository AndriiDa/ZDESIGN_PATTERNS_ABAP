CLASS zcl_discount_decorator DEFINITION INHERITING FROM zcl_price_decorator
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS zif_price_calculator~get_price
        REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_discount_decorator IMPLEMENTATION.
  METHOD zif_price_calculator~get_price.
    rv_price = mo_component->get_price( iv_material ).
    rv_price *= '0.88'. " Apply a 12% discount
  ENDMETHOD.
ENDCLASS.
