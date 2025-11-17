INTERFACE zif_mediator
  PUBLIC.

  CONSTANTS:
    c_event_po_created     TYPE string VALUE 'PO_CREATED',
    c_event_po_approved    TYPE string VALUE 'PO_APPROVED',
    c_event_funds_released TYPE string VALUE 'FUNDS_RELEASED'.


  METHODS notify
    IMPORTING sender TYPE string
              !event TYPE string
              !data  TYPE any.

ENDINTERFACE.
