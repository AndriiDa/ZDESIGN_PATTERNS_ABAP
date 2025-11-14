CLASS zcl_handler_abs DEFINITION
  PUBLIC ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_handler.

    METHODS get_rule_name RETURNING VALUE(result) TYPE string.

  PROTECTED SECTION.
    DATA next_handler TYPE REF TO zif_handler.

    DATA rule_name    TYPE string.
ENDCLASS.


CLASS zcl_handler_abs IMPLEMENTATION.
  METHOD zif_handler~handle.
    " Default: pass to next if exists
    IF next_handler IS BOUND.

    ELSE.
      rule_name = |No handler found for: { i_request }|.

    ENDIF.
  ENDMETHOD.

  METHOD zif_handler~set_next.
    next_handler = i_next.
  ENDMETHOD.

  METHOD get_rule_name.
    result = rule_name.
  ENDMETHOD.
ENDCLASS.
