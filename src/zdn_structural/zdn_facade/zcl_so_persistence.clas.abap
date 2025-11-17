CLASS zcl_so_persistence DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_so_types.

    METHODS: save IMPORTING is_order TYPE zif_so_types=>zso_order.
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: zso_orders TYPE SORTED TABLE OF zif_so_types=>zso_order
                     WITH UNIQUE KEY customer_id.

ENDCLASS.



CLASS ZCL_SO_PERSISTENCE IMPLEMENTATION.


  METHOD save.
    INSERT is_order INTO TABLE zso_orders.

  ENDMETHOD.
ENDCLASS.
