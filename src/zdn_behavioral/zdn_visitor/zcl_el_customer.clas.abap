CLASS zcl_el_customer DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_visitor_target.

    METHODS constructor IMPORTING !id  TYPE string
                                  tier TYPE string.

    METHODS get_id           RETURNING VALUE(rv_id)   TYPE string.
    METHODS get_tier         RETURNING VALUE(rv_tier) TYPE string.
    METHODS get_discount_pct RETURNING VALUE(rv_pct)  TYPE decfloat34.

  PRIVATE SECTION.
    DATA mv_id   TYPE string.
    DATA mv_tier TYPE string.

ENDCLASS.


CLASS zcl_el_customer IMPLEMENTATION.
  METHOD constructor.
    mv_id   = id.
    mv_tier = tier.
  ENDMETHOD.

  METHOD get_id.
    rv_id = mv_id.
  ENDMETHOD.

  METHOD get_tier.
    rv_tier = mv_tier.
  ENDMETHOD.

  METHOD get_discount_pct.
    " Simple tier mapping: adjust to your business rules

    CASE mv_tier.
      WHEN 'Gold'.
        rv_pct = '0.15'.
      WHEN 'Silver'.
        rv_pct = '0.10'.
      WHEN 'Bronze'.
        rv_pct = '0.05'.
      WHEN OTHERS.
        rv_pct = '0.01'.
    ENDCASE.
  ENDMETHOD.

  METHOD zif_visitor_target~accept.
    io_visitor->visit_customer( me ).
  ENDMETHOD.
ENDCLASS.
