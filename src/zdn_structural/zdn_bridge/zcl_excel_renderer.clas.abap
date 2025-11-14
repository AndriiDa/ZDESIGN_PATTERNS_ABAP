CLASS zcl_excel_renderer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_renderer .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_excel_renderer IMPLEMENTATION.


  METHOD zif_renderer~render.
     result = |'Rendering Excel:', { iv_content }|.
  ENDMETHOD.
ENDCLASS.
