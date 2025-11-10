CLASS zcl_adapter_launch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_adapter_launch IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_legacy) = NEW zcl_legacy_payment( ).
    DATA(lo_adapter) = NEW zcl_payment_adapter( io_legacy = lo_legacy ).

    " Cast to interface to access process_payment
    DATA(lo_processor) = CAST zif_payment_processor( lo_adapter ).

    lo_processor->process_payment( iv_amount   = '100.00'
                                   iv_currency = 'EU' ).

    out->write( |Payment processing completed.| ).
  ENDMETHOD.
ENDCLASS.
