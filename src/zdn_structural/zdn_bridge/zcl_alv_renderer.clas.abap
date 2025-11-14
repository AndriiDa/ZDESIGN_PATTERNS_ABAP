CLASS zcl_alv_renderer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_renderer .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_alv_renderer IMPLEMENTATION.
  METHOD zif_renderer~render.
    result = |'Rendering ALV Grid:', { iv_content }|.
  ENDMETHOD.

ENDCLASS.
