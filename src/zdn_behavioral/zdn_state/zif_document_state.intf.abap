INTERFACE zif_document_state
  PUBLIC.

  METHODS process
    IMPORTING io_document   TYPE REF TO zcl_document_context
    RETURNING VALUE(result) TYPE string.

ENDINTERFACE.
