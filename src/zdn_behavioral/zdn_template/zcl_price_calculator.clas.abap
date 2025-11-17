CLASS zcl_price_calculator DEFINITION ABSTRACT
      PUBLIC  CREATE PUBLIC .


  PUBLIC SECTION.

    TYPES: BEGIN OF ty_price_step,
             step_name TYPE string,
             action    TYPE string,
           END OF ty_price_step.

    TYPES: tt_price_steps TYPE STANDARD TABLE OF ty_price_step WITH DEFAULT KEY.

    DATA: steps TYPE tt_price_steps.

    METHODS:
      calculate_price FINAL RETURNING VALUE(result) TYPE tt_price_steps,
      get_base_price ABSTRACT RETURNING VALUE(rs_step) TYPE ty_price_step,
      apply_discounts ABSTRACT RETURNING VALUE(rs_step) TYPE ty_price_step,
      apply_taxes ABSTRACT RETURNING VALUE(rs_step) TYPE ty_price_step,
      finalize_price ABSTRACT RETURNING VALUE(rs_step) TYPE ty_price_step.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PRICE_CALCULATOR IMPLEMENTATION.


  METHOD calculate_price.
    clear steps.
    APPEND get_base_price( )    TO steps.
    APPEND apply_discounts( )   TO steps.
    APPEND apply_taxes( )       TO steps.
    APPEND finalize_price( )    TO steps.
    result = steps.
  ENDMETHOD.
ENDCLASS.
