INTERFACE zif_sales_view
  PUBLIC.

  METHODS display_order
    IMPORTING is_order TYPE zif_sales_model=>zsales_order
              !out     TYPE REF TO if_oo_adt_classrun_out.

ENDINTERFACE.
