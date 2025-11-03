INTERFACE zif_tax_service PUBLIC.

  TYPES: BEGIN OF ty_tax_result,
           net_amount   TYPE wrbtr,
           tax_amount   TYPE wrbtr,
           gross_amount TYPE wrbtr,
         END OF ty_tax_result,


         BEGIN OF ty_tax_rate,
           bukrs      TYPE bukrs,        " Company Code
           mwskz      TYPE mwskz,        " Tax Code
           valid_from TYPE datum,         " Validity Start Date
           valid_to   TYPE datum,         " Validity End Date
           rate       TYPE wrbtr, " Tax Rate (e.g., 0.230000 for 23%)
         END OF ty_tax_rate.
  TYPES: tt_tax_rate TYPE STANDARD TABLE OF ty_tax_rate WITH DEFAULT KEY.

  METHODS calculate_tax
    IMPORTING
      iv_amount     TYPE wrbtr           " Amount in document currency
      iv_mwskz      TYPE mwskz           " Tax code
      iv_budat      TYPE budat           " Posting date
    RETURNING
      VALUE(rs_tax) TYPE ty_tax_result " net/gross/tax breakdown

    RAISING
      zcx_tax_error.                       " Custom exception for tax errors

ENDINTERFACE.
