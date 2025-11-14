CLASS zcl_purchase_report DEFINITION
  PUBLIC
  INHERITING FROM zcl_report_abs FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING io_renderer TYPE REF TO zif_renderer.
    METHODS generate REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_purchase_report IMPLEMENTATION.
  METHOD generate.
    result = mo_renderer->render( |Sales Purchase generated on { sy-datum }| ).
  ENDMETHOD.

  METHOD constructor.
    super->constructor( io_renderer = io_renderer ).
  ENDMETHOD.
ENDCLASS.
