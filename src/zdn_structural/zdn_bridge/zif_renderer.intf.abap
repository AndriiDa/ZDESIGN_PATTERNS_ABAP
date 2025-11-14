INTERFACE zif_renderer
  PUBLIC.
  METHODS render IMPORTING iv_content    TYPE string
                 RETURNING VALUE(result) TYPE string.

ENDINTERFACE.
