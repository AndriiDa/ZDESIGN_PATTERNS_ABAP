CLASS zcl_state_draft DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_document_state .
        ALIASES: process for zif_document_state~process.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_STATE_DRAFT IMPLEMENTATION.


  METHOD process.
    io_document->set_state( NEW zcl_state_reviewed( ) ).
    result = |'Document moved from Draft to Reviewed'|.
  ENDMETHOD.
ENDCLASS.
