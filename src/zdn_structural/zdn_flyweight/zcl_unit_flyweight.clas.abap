CLASS zcl_unit_flyweight DEFINITION
  PUBLIC FINAL
  CREATE PRIVATE.

  PUBLIC SECTION.
    INTERFACES zif_unit_flyweight.

    CLASS-METHODS get_instance
      IMPORTING iv_unit             TYPE string
      RETURNING VALUE(ro_flyweight) TYPE REF TO zcl_unit_flyweight.

  PRIVATE SECTION.
    DATA mv_unit TYPE string.

    METHODS constructor IMPORTING iv_unit TYPE string.

ENDCLASS.


CLASS zcl_unit_flyweight IMPLEMENTATION.
  METHOD zif_unit_flyweight~get_unit.
    rv_unit = mv_unit.
  ENDMETHOD.

  METHOD constructor.
    mv_unit = iv_unit.
  ENDMETHOD.

  METHOD get_instance.
    ro_flyweight = NEW #( iv_unit = iv_unit ).
  ENDMETHOD.
ENDCLASS.
