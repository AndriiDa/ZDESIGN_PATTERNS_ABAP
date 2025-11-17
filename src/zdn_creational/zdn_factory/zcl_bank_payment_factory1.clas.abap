CLASS zcl_bank_payment_factory1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


    TYPES: BEGIN OF ty_registry,
             bank_name  TYPE string,
             class_name TYPE string,
           END OF ty_registry.

    CLASS-DATA:
      gt_registry TYPE HASHED TABLE OF ty_registry WITH UNIQUE KEY class_name.

    CLASS-METHODS:
      register_bank
        IMPORTING iv_bank_name TYPE string
                  iv_class     TYPE string,

      create_payment_handler
        IMPORTING iv_bank_name      TYPE string
        RETURNING VALUE(ro_handler) TYPE REF TO zif_bank_payme.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BANK_PAYMENT_FACTORY1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    zcl_bank_payment_factory1=>register_bank( iv_bank_name = 'HSBC' iv_class = 'ZCL_HSBC_PAYMENT' ).
    zcl_bank_payment_factory1=>register_bank( iv_bank_name = 'CITYBANK' iv_class = 'ZCL_CITIBANK_PAYMENT' ).
    zcl_bank_payment_factory1=>register_bank( iv_bank_name = 'DB' iv_class = 'ZCL_DEUTSCHE_PAYMENЕT' ).

    TRY.
        DATA(lo_instance) = zcl_bank_payment_factory1=>create_payment_handler( 'HSBC' ).
        DATA(info) = lo_instance->execute_payment( iv_account = 'HSBC200' iv_amount = 200 ).
        out->write( |{ info }|  ).

      CATCH cx_sy_move_cast_error cx_sy_create_object_error INTO DATA(lx_error).
        out->write( |Error: { lx_error->get_text( ) }| ).
    ENDTRY.

  ENDMETHOD.


  METHOD register_bank.
    INSERT VALUE #( bank_name = iv_bank_name
                    class_name = iv_class ) INTO TABLE gt_registry. "ASSIGNING FIELD-SYMBOL(<fs>).

  ENDMETHOD.


  METHOD create_payment_handler.

    DATA(lv_class) = COND string(
      WHEN line_exists( gt_registry[ bank_name = iv_bank_name ] )
      THEN to_upper( gt_registry[ bank_name = iv_bank_name ]-bank_name )
      ELSE 'DEFAULT_BANK_HSBC'
    ).


    ro_handler = SWITCH #( lv_class
                    WHEN 'CITYBANK' OR 'CITY' THEN NEW zcl_citibank_payment(  )
                    WHEN 'DEUTSCHBANK' OR 'DB' THEN NEW zcl_deutsche_payment(  )
                    WHEN 'HSBC' THEN NEW zcl_hsbc_payment( )
                    ELSE  NEW zcl_hsbc_payment( ) ).

  ENDMETHOD.
ENDCLASS.
