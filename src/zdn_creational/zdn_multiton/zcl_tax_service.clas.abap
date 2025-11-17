CLASS zcl_tax_service DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.
    INTERFACES zif_tax_service.

    CLASS-METHODS:
      get_instance
        IMPORTING iv_bukrs           TYPE bukrs
        RETURNING VALUE(ro_instance) TYPE REF TO zcl_tax_service
        RAISING   cx_static_check,
      refresh
        IMPORTING iv_bukrs TYPE bukrs OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: BEGIN OF ty_instance,
             bukrs TYPE bukrs,
             ref   TYPE REF TO zcl_tax_service,
           END OF ty_instance.

    CLASS-DATA mt_multiton_instances TYPE HASHED TABLE OF ty_instance WITH UNIQUE KEY bukrs.

    " per-instance cached
    DATA mv_bukrs TYPE bukrs.
    DATA mv_waers TYPE waers.
    DATA mv_land  TYPE land1.
    DATA mt_rate  TYPE STANDARD TABLE OF zif_tax_service=>ty_tax_rate.

    METHODS constructor
      IMPORTING iv_bukrs TYPE bukrs.

    METHODS load_config.

    METHODS find_rate
      IMPORTING iv_mwskz      TYPE mwskz
                iv_budat      TYPE budat
      RETURNING VALUE(result) TYPE wrbtr. " tax rate

ENDCLASS.



CLASS ZCL_TAX_SERVICE IMPLEMENTATION.


  METHOD constructor.
    mv_bukrs = iv_bukrs.
    load_config( ).
  ENDMETHOD.


  METHOD zif_tax_service~calculate_tax .

    DATA lv_rate TYPE wrbtr.
    DATA lv_tax  TYPE wrbtr.

    lv_rate = find_rate( iv_mwskz = iv_mwskz iv_budat = iv_budat ).

    IF lv_rate IS INITIAL OR lv_rate <= 0.
      RAISE EXCEPTION TYPE zcx_tax_error
        EXPORTING
          iv_message = |No valid tax rate for code { iv_mwskz } on { iv_budat }|.
    ENDIF.

    lv_tax = iv_amount * lv_rate.

    rs_tax-net_amount   = iv_amount.
    rs_tax-tax_amount   = lv_tax.
    rs_tax-gross_amount = iv_amount + lv_tax.

  ENDMETHOD.


  METHOD get_instance.
    DATA: ls_instance TYPE ty_instance,
          lo_instance TYPE REF TO zcl_tax_service.

    READ TABLE mt_multiton_instances INTO ls_instance WITH KEY bukrs = iv_bukrs.
    IF sy-subrc = 0.
      ro_instance = ls_instance-ref.
      RETURN.
    ENDIF.

    lo_instance = NEW zcl_tax_service( iv_bukrs = iv_bukrs ).

    ls_instance-bukrs = iv_bukrs.
    ls_instance-ref   = lo_instance.
    INSERT ls_instance INTO TABLE mt_multiton_instances.

    ro_instance = lo_instance.
  ENDMETHOD.


  METHOD refresh.

    IF iv_bukrs IS INITIAL.
      CLEAR mt_multiton_instances.
    ELSE.
      DELETE mt_multiton_instances WHERE bukrs = iv_bukrs.
    ENDIF.
  ENDMETHOD.


  METHOD find_rate.

    " Candidate rates matching mwskz and valid_from <= iv_budat
    DATA lt_candidates TYPE STANDARD TABLE OF zif_tax_service=>ty_tax_rate.

    " Filter relevant entries from mt_rate

    lt_candidates = VALUE #( FOR ls_rate IN mt_rate
                             WHERE ( mwskz = iv_mwskz AND valid_from <= iv_budat )
                             ( ls_rate ) ).

    " If no candidates found, return 0
    IF lt_candidates IS INITIAL.
      result = 0.
      RETURN.
    ENDIF.

    " Sort by valid_from descending to get the latest valid date
    SORT lt_candidates BY valid_from DESCENDING.

    " Take the first entry after sort (latest valid_from)
    result  = lt_candidates[ 1 ]-rate.

  ENDMETHOD.


  METHOD load_config.

    " For demonstration purposes, we hardcode some values here.
    mv_waers = 'EUR'.
    mv_land  = 'DE'.

    CLEAR mt_rate.
    APPEND VALUE zif_tax_service=>ty_tax_rate( mwskz = 'A0' rate = '19.00' valid_from = '00000000' valid_to = '99991231' ) TO mt_rate.
    APPEND VALUE zif_tax_service=>ty_tax_rate( mwskz = 'B1' rate = '7.00'  valid_from = '00000000' valid_to = '99991231' ) TO mt_rate.


  ENDMETHOD.
ENDCLASS.
