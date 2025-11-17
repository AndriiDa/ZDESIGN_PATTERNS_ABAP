CLASS zcl_observer_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_observer_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_subject) = NEW zcl_subject( ).
    DATA(lo_console) = NEW zcl_console_observer( ).
    DATA(lo_log)     = NEW zcl_log_observer( ).

    lo_subject->attach( lo_console ).
    lo_subject->attach( lo_log ).

    DATA(lv_message) = VALUE zif_observer=>message( type_message = 'INFO'
                                                    content      = 'Demo message for display' ).


    lo_subject->notify( lv_message ).

    out->write( 'Observers have been notified.' ).
    out->write( lo_console->get_messages(  ) ).
    out->write( lo_log->get_messages(  ) ).

  ENDMETHOD.
ENDCLASS.
