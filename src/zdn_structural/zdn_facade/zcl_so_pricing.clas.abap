CLASS zcl_so_pricing DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_so_types.
    METHODS: calculate_price IMPORTING is_order TYPE zif_so_types=>zso_order
                             RETURNING VALUE(rv_price) TYPE decfloat16.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_so_pricing IMPLEMENTATION.
  METHOD calculate_price.

    DATA(lv_total) = CONV decfloat16( 0 ).

    LOOP AT is_order-items INTO DATA(ls_item).
      lv_total += ls_item-quantity * ls_item-unit_price.
    ENDLOOP.

    " Apply discount if total > 1000
    IF lv_total > 1000.
      lv_total = lv_total * '0.95'. " 5% discount
    ENDIF.

    " Add tax (e.g., 23%)
    lv_total = lv_total * '1.23'.

    rv_price = lv_total.

  ENDMETHOD.

ENDCLASS.
