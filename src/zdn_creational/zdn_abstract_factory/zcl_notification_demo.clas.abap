CLASS zcl_notification_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_notification_demo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_factory) = NEW zcl_concrete_factory( ).

    DATA(lo_email) = lo_factory->zif_notification_factory~get_email( 'ALERT' ).
    DATA(lo_sms)   = lo_factory->zif_notification_factory~get_sms( 'REMINDER' ).

    lo_email->send_email( iv_body  = 'body' iv_recipient = 'recipient' iv_subject = 'subject2' ).
    lo_sms->send_sms( iv_message = 'message' iv_phone_number = 'phone number' ).

    out->write( lo_email->display(  ) ).
     out->write( '==========' ).
    out->write( lo_sms->display(  ) ).

  ENDMETHOD.
ENDCLASS.



