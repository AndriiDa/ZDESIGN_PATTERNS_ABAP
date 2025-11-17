CLASS zcl_finance DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS   set_mediator IMPORTING i_mediator TYPE REF TO zif_mediator.
    METHODS release_funds IMPORTING i_po       TYPE REF TO zcl_po.

  PRIVATE SECTION.
    DATA mediator TYPE REF TO zif_mediator.

ENDCLASS.


CLASS zcl_finance IMPLEMENTATION.

  METHOD set_mediator.
    mediator = i_mediator.
  ENDMETHOD.


  METHOD release_funds.
*    'Finance releasing funds'.
    mediator->notify( sender = 'Finance'
                      event  = zif_mediator=>c_event_funds_released
                      data   = i_po ).
  ENDMETHOD.
ENDCLASS.
