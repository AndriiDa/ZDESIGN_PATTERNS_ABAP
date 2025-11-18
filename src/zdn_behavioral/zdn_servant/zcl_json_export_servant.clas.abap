CLASS zcl_json_export_servant DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS export_to_json
      IMPORTING io_object      TYPE REF TO zif_servant_export
      RETURNING VALUE(rv_json) TYPE string.
ENDCLASS.


CLASS zcl_json_export_servant IMPLEMENTATION.
  METHOD export_to_json.
    TRY.
        DATA(lv_data) = io_object->get_data( ).

        "/UI2/CL_JSON for serialization (available in ABAP Cloud)
        rv_json = /ui2/cl_json=>serialize( data        = lv_data
                                           pretty_name = /ui2/cl_json=>pretty_mode-camel_case ).

      CATCH cx_root INTO DATA(lx_error).
        rv_json = | "error": "{ lx_error->get_text( ) }" |.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
