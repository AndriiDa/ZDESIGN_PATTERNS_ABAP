CLASS zcl_export_price DEFINITION INHERITING FROM zcl_price_calculator
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: get_base_price REDEFINITION,
             apply_discounts REDEFINITION,
             apply_taxes REDEFINITION,
             finalize_price REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_export_price IMPLEMENTATION.
  METHOD apply_discounts.
    rs_step = VALUE #( step_name = 'Discounts' action = 'Applied export discount: 5%' ).
  ENDMETHOD.

  METHOD apply_taxes.
    rs_step = VALUE #( step_name = 'Taxes' action = 'Applied customs duty: 8%' ).
  ENDMETHOD.

  METHOD finalize_price.
    rs_step = VALUE #( step_name = 'Final Price' action = 'Final export price: 103 EUR' ).
  ENDMETHOD.

  METHOD get_base_price.
    rs_step = VALUE #( step_name = 'Base Price' action = 'Export base price: 100 EUR' ).
  ENDMETHOD.

ENDCLASS.
