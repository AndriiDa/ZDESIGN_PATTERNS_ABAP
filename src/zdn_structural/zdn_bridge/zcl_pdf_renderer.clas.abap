CLASS zcl_pdf_renderer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_renderer .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pdf_renderer IMPLEMENTATION.


  METHOD zif_renderer~render.
   result = |'Rendering PDF:', { iv_content }|.
  ENDMETHOD.
ENDCLASS.
