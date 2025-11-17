CLASS zcl_so_validator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

TYPES: BEGIN OF zso_item,
         material   TYPE matnr,
         quantity   TYPE i,
         unit_price TYPE decfloat16,
       END OF zso_item.

TYPES: zso_item_tab TYPE STANDARD TABLE OF zso_item WITH DEFAULT KEY.

TYPES: BEGIN OF zso_order,
         customer_id  TYPE kunnr,
         items        TYPE zso_item_tab,
         total_price  TYPE decfloat16,
       END OF zso_order.

    METHODS: validate IMPORTING is_order TYPE zso_order RETURNING VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SO_VALIDATOR IMPLEMENTATION.


  METHOD validate.
    result = xsdbool( is_order-customer_id IS NOT INITIAL AND is_order-items IS NOT INITIAL ).
  ENDMETHOD.
ENDCLASS.
