INTERFACE zif_handler
  PUBLIC.

  METHODS set_next IMPORTING i_next    TYPE REF TO zif_handler.
  METHODS handle   IMPORTING i_request TYPE string.

ENDINTERFACE.
