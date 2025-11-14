INTERFACE zif_bom_component
  PUBLIC.

  TYPES: BEGIN OF ty_component,
           name TYPE string,
           ref  TYPE REF TO zif_bom_component,
         END OF ty_component.

  METHODS get_name RETURNING VALUE(result) TYPE string.

  METHODS display IMPORTING indent        TYPE i DEFAULT 0
                  RETURNING VALUE(result) TYPE string.


ENDINTERFACE.
