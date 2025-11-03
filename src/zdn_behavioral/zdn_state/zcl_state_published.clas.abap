CLASS zcl_state_published DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_document_state .
    ALIASES: process for zif_document_state~process.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_state_published IMPLEMENTATION.
  METHOD process.
    io_document->set_state( NEW zcl_state_archived( ) ).
    result = | 'Document is already Published. No further processing.' |.
  ENDMETHOD.
ENDCLASS.
