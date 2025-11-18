CLASS zcl_servant_demo DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_servant_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Create domain objects
    DATA(lo_sales)    = NEW zcl_sales_order_snt( iv_id     = 'SO123'
                                                 iv_amount = '150.00' ).
    DATA(lo_purchase) = NEW zcl_purchase_order_snt( iv_id     = 'PO456'
                                                    iv_amount = '250.00' ).

    " Create servant
    DATA(lo_servant)  = NEW zcl_json_export_servant( ).

    " Export to JSON
    DATA(json_sales)    = lo_servant->export_to_json( io_object = lo_sales ).
    DATA(json_purchase) = lo_servant->export_to_json( io_object = lo_purchase ).

    " Output results
    out->write( |Sales Order JSON: { json_sales }| ).
    out->write( |Purchase Order JSON: { json_purchase }| ).
  ENDMETHOD.
ENDCLASS.



" What is the Servant Pattern?

" Imagine you have different objects (like Sales Order, Purchase Order).
" They all need to do something common (e.g., export to JSON, print, validate).
" Instead of teaching each object how to do it, you create a helper object called a Servant.
" The Servant does the job for them, using their data, without changing their main logic.
