CLASS zcl_ext_bridge_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EXT_BRIDGE_DEMO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lo_renderer TYPE REF TO zif_renderer.
    DATA lo_report   TYPE REF TO zcl_report_abs.

    " PDF Renderer + Sales Report
    lo_renderer = zcl_ext_renderer_factory=>factory_create_renderer( 'PDF' ).
    lo_report = NEW zcl_sales_report( lo_renderer ).
    out->write( lo_report->generate( ) ).

    " Switch dynamically to Excel
    lo_renderer = zcl_ext_renderer_factory=>factory_create_renderer( 'EXCEL' ).
    lo_report = NEW zcl_inventory_report( lo_renderer ).
    out->write( lo_report->generate( ) ).

    " Switch dynamically to XML
    lo_renderer = zcl_ext_renderer_factory=>factory_create_renderer( 'JSON' ).
    lo_report = NEW zcl_purchase_report( lo_renderer ).
    out->write( lo_report->generate( ) ).
  ENDMETHOD.
ENDCLASS.
