CLASS zcl_property_container DEFINITION PUBLIC CREATE PUBLIC.
  PUBLIC SECTION.
    TYPES: BEGIN OF zproperty,
             key   TYPE string,
             value TYPE string,
           END OF zproperty,
           zproperty_tab TYPE HASHED TABLE OF zproperty WITH UNIQUE KEY key.

    METHODS add_property IMPORTING iv_key   TYPE string
                                   iv_value TYPE string.

    METHODS get_property IMPORTING iv_key          TYPE string
                         RETURNING VALUE(rv_value) TYPE string.

    METHODS has_property IMPORTING iv_key           TYPE string
                         RETURNING VALUE(rv_exists) TYPE abap_bool.

    METHODS get_all_properties RETURNING VALUE(rt_properties) TYPE zproperty_tab.

  PRIVATE SECTION.
    DATA mt_properties TYPE HASHED TABLE OF zproperty WITH UNIQUE KEY key.
ENDCLASS.


CLASS zcl_property_container IMPLEMENTATION.
  METHOD add_property.
    DELETE mt_properties WHERE key = iv_key.
    INSERT VALUE #( key   = iv_key
                    value = iv_value ) INTO TABLE mt_properties.
  ENDMETHOD.

  METHOD get_property.
       rv_value = VALUE #( mt_properties[ key = iv_key ]-value OPTIONAL ).
  ENDMETHOD.

  METHOD has_property.
    rv_exists = xsdbool( line_exists( mt_properties[ key = iv_key ] ) ).
  ENDMETHOD.

  METHOD get_all_properties.
    rt_properties = mt_properties.
  ENDMETHOD.
ENDCLASS.
