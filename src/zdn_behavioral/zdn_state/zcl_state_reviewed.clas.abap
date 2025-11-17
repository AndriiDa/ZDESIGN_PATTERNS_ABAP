CLASS zcl_state_reviewed DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_document_state .
        ALIASES: process for zif_document_state~process.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_STATE_REVIEWED IMPLEMENTATION.


  METHOD process.
    io_document->set_state( NEW zcl_state_published( ) ).
       result = | 'Document moved from Reviewed to Published' |.
  ENDMETHOD.
ENDCLASS.
