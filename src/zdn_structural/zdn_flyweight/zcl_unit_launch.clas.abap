CLASS zcl_unit_launch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_UNIT_LAUNCH IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(lv_kg_unit) = CONV string( 'KG' ).
    DATA(lv_m_unit) = CONV string( 'M' ).

    DATA(lo_kg1) = zcl_unit_flyweight=>get_instance( lv_kg_unit ).
    DATA(lo_m1) = zcl_unit_flyweight=>get_instance( lv_m_unit ).
    DATA(lo_kg2) = zcl_unit_flyweight=>get_instance( lv_kg_unit ).

    zcl_unit_factory=>get_unit( lv_kg_unit ).
    zcl_unit_factory=>display_cache(  ).
    zcl_unit_factory=>get_unit( lv_m_unit ).
    zcl_unit_factory=>get_unit( lv_m_unit ).
    zcl_unit_factory=>display_cache(  ).



  ENDMETHOD.
ENDCLASS.
