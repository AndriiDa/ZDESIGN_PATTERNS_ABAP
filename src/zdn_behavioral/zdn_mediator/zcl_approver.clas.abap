CLASS zcl_approver DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS:
      set_mediator IMPORTING i_mediator TYPE REF TO zif_mediator,
      review_po IMPORTING i_po TYPE REF TO zcl_po.
  PRIVATE SECTION.
    DATA mediator TYPE REF TO zif_mediator.


ENDCLASS.


CLASS zcl_approver IMPLEMENTATION.


  METHOD set_mediator.
    mediator = i_mediator.
  ENDMETHOD.


  METHOD review_po.
*    'Approver reviewing PO'.
    mediator->notify( sender = 'Approver'
                      event  = zif_mediator=>c_event_po_approved
                      data   = i_po ).

  ENDMETHOD.
ENDCLASS.
