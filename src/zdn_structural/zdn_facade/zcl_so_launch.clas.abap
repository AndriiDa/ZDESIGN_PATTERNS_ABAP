CLASS zcl_so_launch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SO_LAUNCH IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Create facade instance
    DATA(facade) = NEW zcl_so_facade( ).

    " Prepare order data
    DATA(order) = VALUE zif_so_types=>zso_order(
      customer_id = 'CUST01'
      items = VALUE zif_so_types=>zso_item_tab(
        ( material = 'MAT001' quantity = 2 unit_price = '150.00' )
        ( material = 'MAT002' quantity = 1 unit_price = '500.00' )
      )
    ).

    " Call process_order with the order
    DATA(result) = facade->process_order( order ).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
