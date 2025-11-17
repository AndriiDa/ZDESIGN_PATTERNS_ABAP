CLASS zcl_workflow_mediator DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_mediator.

    METHODS constructor
      IMPORTING i_po       TYPE REF TO zcl_po
                i_approver TYPE REF TO zcl_approver
                i_finance  TYPE REF TO zcl_finance.

  PRIVATE SECTION.
    DATA po       TYPE REF TO zcl_po.
    DATA approver TYPE REF TO zcl_approver.
    DATA finance  TYPE REF TO zcl_finance.

ENDCLASS.




CLASS zcl_workflow_mediator IMPLEMENTATION.
  METHOD constructor.
    po       = i_po.
    approver = i_approver.
    finance  = i_finance.
  ENDMETHOD.



  METHOD zif_mediator~notify.
    CASE event.
      WHEN 'PO_CREATED'.
        approver->review_po( data ).
      WHEN 'PO_APPROVED'.
        finance->release_funds( data ).
      WHEN 'FUNDS_RELEASED'.
        po->send_to_vendor( ).
    ENDCASE.

*    CASE event.
*      WHEN zif_mediator=>c_event_po_created.
*        approver->review_po( i_po = data ).
*      WHEN zif_mediator=>c_event_po_approved.
*        finance->release_funds( i_po = data ).
*      WHEN zif_mediator=>c_event_funds_released.
*        po->send_to_vendor( ).
*    ENDCASE.



  ENDMETHOD.
ENDCLASS.
