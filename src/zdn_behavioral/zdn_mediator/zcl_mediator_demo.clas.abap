CLASS zcl_mediator_demo DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_mediator_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*    " With a mediator:
*    " PO → Mediator → Approver
*    " Approver → Mediator → Finance
*    " Finance → Mediator → PO

**********************************************************************Origin
*    " Step 1 Create colleagues
*    DATA(lo_po)       = NEW zcl_po( ).
*    DATA(lo_approver) = NEW zcl_approver( ).
*    DATA(lo_finance)  = NEW zcl_finance( ).
*
*    " Step 2: Create mediator with colleagues
*    DATA(lo_mediator) = NEW zcl_workflow_mediator( i_po       = lo_po
*                                                   i_approver = lo_approver
*                                                   i_finance  = lo_finance ).
*
*     Step 3: Inject mediator into colleagues
*    lo_po->set_mediator( lo_mediator ).
*    lo_approver->set_mediator( lo_mediator ).
*    lo_finance->set_mediator( lo_mediator ).
*
*     Step 4 Start workflow
*    lo_po->create_po( ).

**********************************************************************Demonstration

    " Step 1: Create colleagues
    DATA(lo_po)       = NEW zcl_po( ).
    DATA(lo_approver) = NEW zcl_approver( ).
    DATA(lo_finance)  = NEW zcl_finance( ).

    " Step 2: Create mediator with colleagues
    DATA(lo_mediator) = NEW zcl_workflow_mediator( i_po       = lo_po
                                                   i_approver = lo_approver
                                                   i_finance  = lo_finance ).

    " Step 3: Inject mediator into colleagues
    lo_po->set_mediator( lo_mediator ).
    lo_approver->set_mediator( lo_mediator ).
    lo_finance->set_mediator( lo_mediator ).

    " Step 4: Demonstrate flow inline
    out->write( |PO Created| ).
    lo_mediator->zif_mediator~notify( sender = 'PO'
                                      event  = zif_mediator=>c_event_po_created
                                      data   = lo_po ).

    out->write( |Approver reviewing PO| ).
    lo_mediator->zif_mediator~notify( sender = 'Approver'
                                      event  = zif_mediator=>c_event_po_approved
                                      data   = lo_po ).

    out->write( |Finance releasing funds| ).
    lo_mediator->zif_mediator~notify( sender = 'Finance'
                                      event  = zif_mediator=>c_event_funds_released
                                      data   = lo_po ).

    out->write( |PO sent to Vendor| ).




  ENDMETHOD.
ENDCLASS.
