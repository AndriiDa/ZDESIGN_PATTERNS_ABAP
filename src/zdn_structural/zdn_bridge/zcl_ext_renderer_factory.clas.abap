CLASS zcl_ext_renderer_factory DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS factory_create_renderer
      IMPORTING iv_format          TYPE string
      RETURNING VALUE(ro_renderer) TYPE REF TO zif_renderer.
ENDCLASS.



CLASS ZCL_EXT_RENDERER_FACTORY IMPLEMENTATION.


  METHOD factory_create_renderer.
    TRY.
        CASE iv_format.
          WHEN 'PDF'.
            ro_renderer = NEW zcl_pdf_renderer( ).
          WHEN 'EXCEL'.
            ro_renderer = NEW zcl_excel_renderer( ).
          WHEN 'JSON'.
            ro_renderer = NEW zcl_json_render( ).

          WHEN OTHERS.
        ENDCASE.
      CATCH cx_sy_create_object_error INTO DATA(lx_create_error). " TODO: variable is assigned but never used (ABAP cleaner)
        " Handle object creation error
*        ro_renderer = NEW zcl_default_renderer( ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
