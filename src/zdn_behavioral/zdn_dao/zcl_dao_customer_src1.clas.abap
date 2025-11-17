CLASS zcl_dao_customer_src1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES zif_dao_customer.
  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS mock_data RETURNING VALUE(rt_customers) TYPE zif_dao_customer=>customers.
ENDCLASS.



CLASS ZCL_DAO_CUSTOMER_SRC1 IMPLEMENTATION.


  METHOD zif_dao_customer~get_customer_by_id.
    " Implementation logic to retrieve customer by ID, mock data for demonstration
    data(mock_customers) = mock_data( ).

    rv_customer = VALUE #( mock_customers[ kunnr = iv_kunnr ] OPTIONAL ).

  ENDMETHOD.


  METHOD mock_data.

rt_customers = VALUE #(
      ( kunnr = '100001' name1 = 'Acme Corp'   ort01 = 'Berlin'  land1 = 'DE' )
      ( kunnr = '100002' name1 = 'Globex Ltd'  ort01 = 'Warsaw'  land1 = 'PL' )
      ( kunnr = '100003' name1 = 'Initech'     ort01 = 'Paris'   land1 = 'FR' )
    ).

  ENDMETHOD.
ENDCLASS.
