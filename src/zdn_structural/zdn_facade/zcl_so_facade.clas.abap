CLASS zcl_so_facade DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES zif_so_types.

    METHODS: process_order IMPORTING is_order         TYPE zif_so_types=>zso_order
                           RETURNING VALUE(rv_result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: mo_validator   TYPE REF TO zcl_so_validator,
          mo_pricing     TYPE REF TO zcl_so_pricing,
          mo_persistence TYPE REF TO zcl_so_persistence.

ENDCLASS.



CLASS zcl_so_facade IMPLEMENTATION.
  METHOD process_order.


    mo_validator   = NEW zcl_so_validator( ).
    mo_pricing     = NEW zcl_so_pricing( ).
    mo_persistence = NEW zcl_so_persistence( ).


    IF mo_validator->validate( is_order ) = abap_false.
      rv_result = 'Validation failed'.
      RETURN.
    ENDIF.


    DATA(ls_order) = is_order. " Local copy
    DATA(lv_price) = mo_pricing->calculate_price( ls_order ).
    ls_order-total_price = lv_price.


    mo_persistence->save( ls_order ).
    rv_result = |Order processed successfully. Total Price: { lv_price }|.

  ENDMETHOD.

ENDCLASS.
