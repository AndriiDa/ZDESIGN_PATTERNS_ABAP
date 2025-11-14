CLASS zcl_chain_responsibility_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_chain_responsibility_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Create handlers
    DATA(lo_credit)   = NEW zcl_credit_check( ).
    DATA(lo_stock)    = NEW zcl_stock_check( ).
    DATA(lo_approval) = NEW zcl_approval_check( ).

    " Build the chain
    lo_credit->zif_handler~set_next( lo_stock ).
    lo_stock->zif_handler~set_next( lo_approval ).

    out->write( |--- Chain of Responsibility Demo ---| ).

    " Process requests
    out->write( |Request: STOCK| ).
    lo_credit->zif_handler~handle( 'STOCK' ).

    out->write( |Request: CREDIT| ).
    lo_credit->zif_handler~handle( 'CREDIT' ).

    out->write( |Request: APPROVAL| ).
    lo_credit->zif_handler~handle( 'APPROVAL' ).

    out->write( |Request: UNKNOWN| ).
    lo_credit->zif_handler~handle( 'UNKNOWN' ).

    " Display applied rules
    out->write( |--- Rules Applied ---| ).
    IF lo_credit->get_rule_name( ) IS NOT INITIAL.
      out->write( |Credit: { lo_credit->get_rule_name( ) }| ).
    ENDIF.
    IF lo_stock->get_rule_name( ) IS NOT INITIAL.
      out->write( |Stock: { lo_stock->get_rule_name( ) }| ).
    ENDIF.
    IF lo_approval->get_rule_name( ) IS NOT INITIAL.
      out->write( |Approval: { lo_approval->get_rule_name( ) }| ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
