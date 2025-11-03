INTERFACE zif_dao_customer
  PUBLIC.


  TYPES: BEGIN OF customer,
           kunnr TYPE kunnr,
           name1 TYPE string,
           ort01 TYPE string,
           land1 TYPE land1,
         END OF customer.

  TYPES customers TYPE STANDARD TABLE OF customer WITH EMPTY KEY.


  METHODS get_customer_by_id
    IMPORTING iv_kunnr           TYPE kunnr
    RETURNING VALUE(rv_customer) TYPE customer.

ENDINTERFACE.
