
CLASS zcl_visitor_json_export DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_visit_handler.
    METHODS get_json RETURNING VALUE(rv_json) TYPE string.
  PRIVATE SECTION.
    DATA mv_json                    TYPE string.
    DATA mv_last_product_fragment   TYPE string.
ENDCLASS.

CLASS zcl_visitor_json_export IMPLEMENTATION.
  METHOD zif_visit_handler~visit_customer.
    " Optional: enrich header
    mv_json = |"customerId":"{ io_customer->get_id( ) }","tier":"{ io_customer->get_tier( ) }"|.
  ENDMETHOD.

  METHOD zif_visit_handler~visit_product.
    mv_last_product_fragment =
      |"name":"{ io_product->get_name( ) }","price":{ io_product->get_price( ) }|.
  ENDMETHOD.

  METHOD zif_visit_handler~visit_order.
    DATA(items_json) = |[|.
    DATA first TYPE abap_bool VALUE abap_true.

    LOOP AT io_order->get_items( ) ASSIGNING FIELD-SYMBOL(<item>).
      <item>-product->zif_visit_target~accept( me ).  " fill mv_last_product_fragment
      IF first = abap_true.
        first = abap_false.
      ELSE.
        items_json = items_json && ','.
      ENDIF.
      items_json = items_json &&
        |{ mv_last_product_fragment },"qty":{ <item>-qty } |.
    ENDLOOP.

    items_json = items_json && ']'.
    " Combine with optional customer header if present
    IF mv_json IS INITIAL.
      mv_json = | "orderItems": { items_json } |.
    ELSE.
      mv_json = | "customer": { mv_json }, "orderItems": { items_json } |.
    ENDIF.
  ENDMETHOD.

  METHOD get_json.
    rv_json = mv_json.
  ENDMETHOD.
ENDCLASS.

