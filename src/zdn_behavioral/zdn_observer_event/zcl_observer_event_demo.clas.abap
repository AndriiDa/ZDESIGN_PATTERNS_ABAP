CLASS zcl_observer_event_demo DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    " SET HANDLER dynamically binds observer methods to the subject’s event.
    " When RAISE EVENT is called, all registered handlers execute automatically.
    " No need for manual observer list management—the ABAP runtime handles it.
    "
ENDCLASS.


CLASS zcl_observer_event_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_subject) = NEW zcl_subject_event( ).
    DATA(lo_console) = NEW zcl_console_observer_event( ).
    DATA(lo_log)     = NEW zcl_log_observer_event( ).

    " Register handlers dynamically
    SET HANDLER lo_console->handle_state_changed FOR lo_subject.
    SET HANDLER lo_log->handle_state_changed FOR lo_subject.

    " Trigger event
    lo_subject->change_state( 'State changed via event!' ).

    out->write( 'Observers have been notified.' ).
    out->write( lo_console->get_messages( ) ).
    out->write( lo_log->get_messages( ) ).
  ENDMETHOD.
ENDCLASS.
