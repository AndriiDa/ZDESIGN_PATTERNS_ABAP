CLASS zcl_memento_demo DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_memento_demo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(lo_order)   = NEW zcl_sales_order_originator( i_quantity = 10 i_price = '100.00' ).
    DATA(lo_history) = NEW zcl_order_history( ).

    out->write( |Initial State: Quantity={ lo_order->get_data( )-quantity }, Price={ lo_order->get_data( )-price }| ).

    " Save initial state
    lo_history->add_state( lo_order->create_memento( ) ).

    " Change order
    lo_order->set_quantity( 20 ).
    lo_order->set_price( '150.00' ).
    out->write( |After Change: Quantity={ lo_order->get_data( )-quantity }, Price={ lo_order->get_data( )-price }| ).

    " Undo changes
    DATA(lo_prev_state) = lo_history->get_last_state( ).
    lo_order->restore_memento( lo_prev_state ).
    out->write( |After Undo: Quantity={ lo_order->get_data( )-quantity }, Price={ lo_order->get_data( )-price }| ).
  ENDMETHOD.

ENDCLASS.


*What is the Memento Pattern?
*
*It’s a way to save the state of an object so you can restore it later.
*Think of it like an “Undo” button: you take a snapshot of the object before changes, and if needed, you go back to that snapshot.

*Roles

*Originator – The object whose state you want to save (e.g., Sales Order).
*Memento – A small object that stores the state (e.g., quantity and price).
*Caretaker – Keeps the history of states (e.g., a list of snapshots).
