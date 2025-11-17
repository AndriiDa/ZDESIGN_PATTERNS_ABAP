CLASS zcl_composite_launch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_COMPOSITE_LAUNCH IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(lo_root) = NEW zcl_assembly( name = 'Car' ).

    lo_root->add(
        NEW zcl_assembly( name = 'Engine' )->add( NEW zcl_material( name = 'Piston'
                                                                    qty  = 4 ) )->add(
                                                                                   NEW zcl_material( name = 'Spark Plug'
                                                                                                     qty  = 4 ) ) ).

    lo_root->add(
        NEW zcl_assembly( name = 'Body' )->add( NEW zcl_material( name = 'Door'
                                                                  qty  = 4 ) )->add( NEW zcl_material(
                                                                                             name = 'Window'
                                                                                             qty  = 6 ) )->add(
                                                                                                        NEW zcl_material(
                                                                                                            name = 'Wheel'
                                                                                                            qty  = 4 ) ) ).

    out->write( lo_root->display( indent = 0 ) ).
  ENDMETHOD.
ENDCLASS.
