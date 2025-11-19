INTERFACE zif_visitor_target
  PUBLIC .
METHODS accept IMPORTING io_visitor TYPE REF TO zif_visit_handler.
ENDINTERFACE.
