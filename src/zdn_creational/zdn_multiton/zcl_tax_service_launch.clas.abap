CLASS zcl_tax_service_launch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TAX_SERVICE_LAUNCH IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(lo_out) = out.

    lo_out->write( |=== ZCL_TAX_SERVICE Multiton Demo ===| ).

    TRY.
        " Create or get per-BUKRS instances
        DATA(lo_tax_svc_pl01) = zcl_tax_service=>get_instance( iv_bukrs = 'PL01' ).

        lo_tax_svc_pl01->zif_tax_service~calculate_tax(
          iv_amount = '1000'
          iv_budat = '20240615'
          iv_mwskz = 'A0'
        ).
        DATA(lo_tax_svc_de01) = zcl_tax_service=>get_instance( iv_bukrs = 'DE01' ).
        DATA(lo_tax_svc_pl01_again) = zcl_tax_service=>get_instance( iv_bukrs = 'PL01' ).


      CATCH cx_root INTO DATA(lx).
        lo_out->write( |ERROR: { lx->get_text( ) }| ).
    ENDTRY.

    lo_out->write( |=== End of Demo ===| ).
  ENDMETHOD.
ENDCLASS.
