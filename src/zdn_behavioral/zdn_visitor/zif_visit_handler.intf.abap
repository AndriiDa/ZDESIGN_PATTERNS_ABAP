INTERFACE zif_visit_handler
  PUBLIC.

  METHODS visit_product  IMPORTING io_product  TYPE REF TO zcl_el_product.
  METHODS visit_order    IMPORTING io_order    TYPE REF TO zcl_el_order.
  METHODS visit_customer IMPORTING io_customer TYPE REF TO zcl_el_customer.

ENDINTERFACE.
