CLASS zcl_dao_customer_src2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES zif_dao_customer.
  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS mock_data RETURNING VALUE(rt_customers) TYPE zif_dao_customer=>customers.
ENDCLASS.


CLASS zcl_dao_customer_src2 IMPLEMENTATION.
  METHOD zif_dao_customer~get_customer_by_id.
    " Implementation logic to retrieve customer by ID, mock data for demonstration
    DATA(mock_customers) = mock_data( ).

    rv_customer = VALUE #( mock_customers[ kunnr = iv_kunnr ] OPTIONAL ).
  ENDMETHOD.

  METHOD mock_data.
    rt_customers = VALUE #( ( kunnr = '100001' name1 = 'Acme Corp'      ort01 = 'Berlin'     land1 = 'DE' )
                            ( kunnr = '100002' name1 = 'Globex Ltd'     ort01 = 'Warsaw'     land1 = 'PL' )
                            ( kunnr = '100003' name1 = 'Umbrella Inc.'  ort01 = 'London'     land1 = 'GB' )
                            ( kunnr = '100004' name1 = 'Initech'        ort01 = 'Paris'      land1 = 'FR' )
                            ( kunnr = '100005' name1 = 'Stark Industries' ort01 = 'New York' land1 = 'US' )
                            ( kunnr = '100006' name1 = 'Wayne Enterprises' ort01 = 'Gotham'  land1 = 'US' ) ).
  ENDMETHOD.
ENDCLASS.
