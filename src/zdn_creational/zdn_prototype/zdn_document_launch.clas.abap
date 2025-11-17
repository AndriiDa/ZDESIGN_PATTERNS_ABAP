CLASS zdn_document_launch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZDN_DOCUMENT_LAUNCH IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    FINAL(lo_doc1) = NEW zcl_document( i_title   = 'Report'
                                      i_content = 'Prototype Pattern Example' ).
    FINAL(print_doc1) = lo_doc1->display( ).
    out->write( print_doc1 ).

    FINAL(lo_doc2) = CAST zcl_document( lo_doc1->zif_cloneable_templ~clone( ) ).
    FINAL(print_doc2) = lo_doc2->display( ).
    out->write( print_doc2 ).

  ENDMETHOD.
ENDCLASS.
