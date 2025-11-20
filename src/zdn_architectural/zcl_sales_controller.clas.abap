CLASS zcl_sales_controller DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_sales_controller.
    ALIASES run FOR zif_sales_controller~run.

ENDCLASS.


CLASS zcl_sales_controller IMPLEMENTATION.
  METHOD zif_sales_controller~run.
    DATA(lo_model) = NEW zcl_sales_model( ).
    DATA(lo_view)  = NEW zcl_sales_view( ).
    DATA(ls_order) = lo_model->get_sales_order( iv_order_id = 'SO12345' ).
    lo_view->display_order( is_order = ls_order
                            out      = out ).
  ENDMETHOD.
ENDCLASS.
