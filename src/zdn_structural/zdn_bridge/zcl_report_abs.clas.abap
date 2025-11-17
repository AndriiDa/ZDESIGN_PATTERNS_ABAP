CLASS zcl_report_abs DEFINITION
  PUBLIC ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING io_renderer TYPE REF TO zif_renderer.
    METHODS generate ABSTRACT RETURNING VALUE(result) type string.

  PROTECTED SECTION.
    DATA mo_renderer TYPE REF TO zif_renderer.

  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_REPORT_ABS IMPLEMENTATION.


  METHOD constructor.
    mo_renderer = io_renderer.
  ENDMETHOD.
ENDCLASS.
