INTERFACE zif_command
  PUBLIC.
  METHODS execute RETURNING VALUE(rv_result) TYPE string.
ENDINTERFACE.
