CLASS zcx_tax_error DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC.


  PUBLIC SECTION.
    CONSTANTS:
      BEGIN OF ty_textid,
        invalid_tax_code    TYPE string VALUE 'Invalid tax code',
        missing_tax_rate    TYPE string VALUE 'Missing tax rate',
        calculation_failure TYPE string VALUE 'Tax calculation failed',
      END OF ty_textid.

    DATA message TYPE string READ-ONLY.

    METHODS constructor
      IMPORTING
        !iv_message TYPE string OPTIONAL
        !previous   TYPE REF TO cx_root OPTIONAL.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcx_tax_error IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    " Assign message or default
    message = COND #( WHEN iv_message IS INITIAL
                      THEN 'Unknown tax error'
                      ELSE iv_message ).
  ENDMETHOD.


ENDCLASS.
