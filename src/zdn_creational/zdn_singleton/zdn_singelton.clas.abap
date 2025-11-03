CLASS zdn_singelton DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    CLASS-METHODS:  get_instance RETURNING VALUE(ro_instance) TYPE REF TO zdn_singelton.

    METHODS: do_something RETURNING VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA: go_instance TYPE REF TO zdn_singelton.

ENDCLASS.



CLASS zdn_singelton IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(text) = zdn_singelton=>get_instance(  )->do_something(  ).

    out->write( name = 'Congrats' data = |Hello { sy-uname } { text } | ).
  ENDMETHOD.

  METHOD get_instance.
    ro_instance = go_instance.
    IF ro_instance IS INITIAL.
      ro_instance = NEW zdn_singelton( ).
      go_instance = ro_instance.
    ENDIF.
  ENDMETHOD.

  METHOD do_something.
    result = 'do something great!'.
  ENDMETHOD.

ENDCLASS.
