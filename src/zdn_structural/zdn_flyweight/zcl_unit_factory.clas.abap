CLASS zcl_unit_factory DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_flyweight_cache,
             unit TYPE string,
             ref  TYPE REF TO zcl_unit_flyweight,
           END OF ty_flyweight_cache.
    TYPES tt_flyweight_cache TYPE HASHED TABLE OF ty_flyweight_cache WITH UNIQUE KEY unit.
    CLASS-METHODS get_unit
      IMPORTING iv_unit             TYPE string
      RETURNING VALUE(ro_flyweight) TYPE REF TO zif_unit_flyweight.


    CLASS-METHODS display_cache
      RETURNING VALUE(rt_flyweight_cache) TYPE tt_flyweight_cache.

  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-DATA mt_flyweight_cache TYPE HASHED TABLE OF ty_flyweight_cache WITH UNIQUE KEY unit.
ENDCLASS.



CLASS ZCL_UNIT_FACTORY IMPLEMENTATION.


  METHOD get_unit.
    IF line_exists( mt_flyweight_cache[ unit = iv_unit ] ).
      DATA(ls_cache_entry) = mt_flyweight_cache[ unit = iv_unit ].
      ro_flyweight ?= ls_cache_entry-ref.
    ELSE.
      DATA(lo_flyweight) = zcl_unit_flyweight=>get_instance( iv_unit ).
      ro_flyweight ?= lo_flyweight.
      mt_flyweight_cache = VALUE #( BASE mt_flyweight_cache
                                    ( unit = iv_unit
                                      ref  = lo_flyweight ) ).

*      INSERT VALUE #( unit = iv_unit ref = lo_flyweight ) INTO TABLE mt_flyweight_cache.

    ENDIF.
  ENDMETHOD.


  METHOD display_cache.
    rt_flyweight_cache = mt_flyweight_cache.
  ENDMETHOD.
ENDCLASS.
