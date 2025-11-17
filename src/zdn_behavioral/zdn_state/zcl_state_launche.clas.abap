CLASS zcl_state_launche DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_STATE_LAUNCHE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(lo_document) = NEW zcl_document_context( ).

    out->write( lo_document->process_mode( ) ).
    lo_document->set_state( io_state = new zcl_state_draft(  ) ).

    out->write( lo_document->process_mode( ) ).
    out->write( lo_document->process_mode( ) ).
    out->write( lo_document->process_mode( ) ).
    out->write( lo_document->process_mode( ) ).

  ENDMETHOD.
ENDCLASS.
