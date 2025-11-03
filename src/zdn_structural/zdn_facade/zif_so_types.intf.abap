
INTERFACE zif_so_types PUBLIC.
  TYPES: BEGIN OF zso_item,
           material   TYPE matnr,
           quantity   TYPE i,
           unit_price TYPE decfloat16,
         END OF zso_item.

  TYPES: zso_item_tab TYPE STANDARD TABLE OF zso_item WITH DEFAULT KEY.

  TYPES: BEGIN OF zso_order,
           customer_id TYPE kunnr,
           items       TYPE zso_item_tab,
           total_price TYPE decfloat16,
         END OF zso_order.
ENDINTERFACE.
