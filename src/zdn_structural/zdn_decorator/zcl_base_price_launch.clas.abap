CLASS zcl_base_price_launch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_base_price_launch IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(lo_base) = NEW zcl_base_price_calculator( ).
    DATA(lo_discounted) = NEW zcl_discount_decorator( lo_base ).
    DATA(lo_final_price) = NEW zcl_surcharge_decorator( lo_discounted ).

    DATA(lv_price) = lo_final_price->zif_price_calculator~get_price( iv_material = 'MAT123' ).

    out->write( |Final price for material MAT123: { lv_price }| ).
  ENDMETHOD.


ENDCLASS.
