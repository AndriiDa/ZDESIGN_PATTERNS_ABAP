CLASS zcl_document DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_cloneable_templ.

    TYPES: BEGIN OF ty_document,
             title   TYPE string,
             content TYPE string,
           END OF ty_document.

    METHODS constructor IMPORTING i_title   TYPE string
                                  i_content TYPE string.

    METHODS get_title   RETURNING VALUE(rv_title)   TYPE string.
    METHODS get_content RETURNING VALUE(rv_content) TYPE string.

    METHODS display
      RETURNING VALUE(rs_doc) TYPE ty_document.

  PRIVATE SECTION.
    DATA mv_title   TYPE string.
    DATA mv_content TYPE string.
ENDCLASS.



CLASS ZCL_DOCUMENT IMPLEMENTATION.


  METHOD zif_cloneable_templ~clone.
    ro_clone = NEW zcl_document( i_title   = mv_title
                                 i_content = mv_content ).
  ENDMETHOD.


  METHOD constructor.
    mv_title   = i_title.
    mv_content = i_content.
  ENDMETHOD.


  METHOD display.
    rs_doc-title   = mv_title.
    rs_doc-content = mv_content.
  ENDMETHOD.


  METHOD get_title.
    rv_title = mv_title.
  ENDMETHOD.


  METHOD get_content.
    rv_content = mv_content.
  ENDMETHOD.
ENDCLASS.
