CLASS zcl_po DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS set_mediator IMPORTING i_mediator TYPE REF TO zif_mediator.
    METHODS create_po.
    METHODS send_to_vendor.

  PRIVATE SECTION.
    DATA mediator TYPE REF TO zif_mediator.

ENDCLASS.


CLASS zcl_po IMPLEMENTATION.
  METHOD set_mediator.
    mediator = i_mediator.
  ENDMETHOD.

  METHOD create_po.
*     'PO Created'.
    mediator->notify( sender = 'PO'
                      event  = zif_mediator=>c_event_po_created
                      data   = me ).
  ENDMETHOD.

  METHOD send_to_vendor.
*     'PO sent to Vendor'.
  ENDMETHOD.
ENDCLASS.
