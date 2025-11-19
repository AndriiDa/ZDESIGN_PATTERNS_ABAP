CLASS zcl_el_product DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_visitor_target.

    METHODS constructor
      IMPORTING !name TYPE string
                price TYPE decfloat34.

    METHODS get_name  RETURNING VALUE(rv_name)  TYPE string.
    METHODS get_price RETURNING VALUE(rv_price) TYPE decfloat34.

  PRIVATE SECTION.
    DATA mv_name  TYPE string.
    DATA mv_price TYPE decfloat34.

ENDCLASS.


CLASS zcl_el_product IMPLEMENTATION.
  METHOD constructor.
    mv_name  = name.
    mv_price = price.
  ENDMETHOD.

  METHOD get_name.
    rv_name = mv_name.
  ENDMETHOD.

  METHOD get_price.
    rv_price = mv_price.
  ENDMETHOD.

  METHOD zif_visitor_target~accept.
    io_visitor->visit_product( me ).
  ENDMETHOD.
ENDCLASS.
