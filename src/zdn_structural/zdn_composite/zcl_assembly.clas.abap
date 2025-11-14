CLASS zcl_assembly DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_bom_component.

    ALIASES get_name FOR zif_bom_component~get_name.
    ALIASES display  FOR zif_bom_component~display.

    METHODS constructor IMPORTING !name TYPE string.

    METHODS add IMPORTING !component     TYPE REF TO zif_bom_component
                RETURNING VALUE(ro_self) TYPE REF TO zcl_assembly.

  PRIVATE SECTION.
    DATA name       TYPE string.
    DATA components TYPE SORTED TABLE OF zif_bom_component~ty_component WITH UNIQUE KEY name.
ENDCLASS.


CLASS zcl_assembly IMPLEMENTATION.
  METHOD zif_bom_component~display.
    result = |{ repeat( val = '-'
                        occ = indent ) }Assembly: { name }|.
    LOOP AT components INTO DATA(lo_component).
      result = result && cl_abap_char_utilities=>newline &&
                lo_component-ref->display( indent = indent + 2 ).

    ENDLOOP.
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add.
    INSERT VALUE #( name = component->get_name( )
                    ref  = component  ) INTO TABLE components.
    ro_self = me.
  ENDMETHOD.

  METHOD zif_bom_component~get_name.
    result = me->name.
  ENDMETHOD.
ENDCLASS.
