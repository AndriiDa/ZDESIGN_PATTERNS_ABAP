CLASS zcl_stock_check DEFINITION
  PUBLIC
  INHERITING FROM zcl_handler_abs FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS zif_handler~handle REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_STOCK_CHECK IMPLEMENTATION.


  METHOD zif_handler~handle.
    IF i_request = 'STOCK'.
      rule_name = 'Stock check passed.'.
    ELSE.
      super->zif_handler~handle( i_request ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
