CLASS zcl_json_render DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_renderer .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_json_render IMPLEMENTATION.


  METHOD zif_renderer~render.
   result = |'Rendering JSON:', { iv_content }|.
  ENDMETHOD.
ENDCLASS.
