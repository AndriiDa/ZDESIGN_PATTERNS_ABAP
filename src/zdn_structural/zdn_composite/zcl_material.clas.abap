CLASS zcl_material DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_bom_component.

    ALIASES get_name FOR zif_bom_component~get_name.
    ALIASES display  FOR zif_bom_component~display.

    METHODS constructor IMPORTING !name TYPE string
                                  qty   TYPE i.

  PRIVATE SECTION.
  METHODS: display_material RETURNING VALUE(result) TYPE string.
    DATA name TYPE string.
    DATA qty  TYPE i.
ENDCLASS.



CLASS ZCL_MATERIAL IMPLEMENTATION.


  METHOD zif_bom_component~display.
    result = |{ repeat( val = '-'
                        occ = indent ) }    { display_material( ) }|.
  ENDMETHOD.


  METHOD constructor.
    " Constructor implementation
    me->name = name.
    me->qty  = qty.
  ENDMETHOD.


  METHOD zif_bom_component~get_name.
    result = me->name.
  ENDMETHOD.


  METHOD display_material.
    result = |Material: { me->name }, Quantity: { me->qty }|.
  ENDMETHOD.
ENDCLASS.
