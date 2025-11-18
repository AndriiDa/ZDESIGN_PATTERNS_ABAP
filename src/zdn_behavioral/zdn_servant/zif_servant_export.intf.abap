INTERFACE zif_servant_export
  PUBLIC.

  TYPES: BEGIN OF zty_data,
           id       TYPE string,
           amount   TYPE wrbtr,
           currency TYPE string,
         END OF zty_data.

  METHODS get_data RETURNING VALUE(rv_data) TYPE zty_data.

ENDINTERFACE.
