CLASS zcl_document_context DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS constructor.
    METHODS process_mode RETURNING VALUE(result) type string.
    METHODS set_state IMPORTING io_state TYPE REF TO zif_document_state.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mo_state TYPE REF TO zif_document_state.
ENDCLASS.



CLASS ZCL_DOCUMENT_CONTEXT IMPLEMENTATION.


  METHOD constructor.
    mo_state = NEW zcl_state_draft(  ).
  ENDMETHOD.


  METHOD set_state.
    mo_state = io_state.
  ENDMETHOD.


  METHOD process_mode.
   result = mo_state->process( me ).
  ENDMETHOD.
ENDCLASS.
