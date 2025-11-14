CLASS zcl_credit_check DEFINITION
  PUBLIC
  INHERITING FROM zcl_handler_abs
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS zif_handler~handle REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_credit_check IMPLEMENTATION.
  METHOD zif_handler~handle.
    IF i_request = 'CREDIT'.
      rule_name = 'Credit check passed.'.
    ELSE.
      super->zif_handler~handle( i_request ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
