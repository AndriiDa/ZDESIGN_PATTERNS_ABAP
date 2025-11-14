CLASS zdn_property_container_demo DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zdn_property_container_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_container) = NEW zcl_property_container( ).

    " Add dynamic properties
    lo_container->add_property( iv_key   = 'DELIVERY_PRIORITY'
                                iv_value = 'HIGH' ).
    lo_container->add_property( iv_key   = 'CUSTOMER_SEGMENT'
                                iv_value = 'VIP' ).

    " Retrieve property
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA(lv_priority) = lo_container->get_property( 'DELIVERY_PRIORITY' ).

    " Check existence
    IF lo_container->has_property( 'CUSTOMER_SEGMENT' ) = abap_true.
      out->write( |'Customer Segment:', { lo_container->get_property( 'CUSTOMER_SEGMENT' ) }| ).
    ENDIF.

    out->write( lo_container->get_all_properties( ) ).
  ENDMETHOD.
ENDCLASS.
