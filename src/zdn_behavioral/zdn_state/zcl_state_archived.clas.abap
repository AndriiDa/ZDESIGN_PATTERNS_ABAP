CLASS zcl_state_archived DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_document_state .
    ALIASES: process for zif_document_state~process.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_STATE_ARCHIVED IMPLEMENTATION.


  METHOD process.
    result = |Document is archived. No further actions allowed.'|.
  ENDMETHOD.
ENDCLASS.
