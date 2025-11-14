CLASS zcl_bridge_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_bridge_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA lo_renderer TYPE REF TO zif_renderer.
    DATA lo_report   TYPE REF TO zcl_report_abs. " Abstract superclass

    " PDF Renderer + Sales Report
    lo_renderer = NEW zcl_pdf_renderer( ).
    lo_report = NEW zcl_sales_report( lo_renderer ).
    out->write( lo_report->generate( ) ).

    " Switch dynamically to Excel
    lo_renderer = NEW zcl_excel_renderer( ).
    lo_report = NEW zcl_inventory_report( lo_renderer ).
    out->write( lo_report->generate( ) ).

    " Switch dynamically to JSON
    lo_renderer = NEW zcl_json_render( ).
    lo_report = NEW zcl_purchase_report( lo_renderer ).
    out->write( lo_report->generate( ) ).

    lo_renderer = NEW zcl_pdf_renderer( ).
    lo_report = NEW zcl_purchase_report( lo_renderer ).
    out->write( lo_report->generate( ) ).
  ENDMETHOD.
ENDCLASS.
