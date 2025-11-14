INTERFACE zif_bank_account PUBLIC.
  METHODS withdraw
    IMPORTING amount TYPE wrbtr
    RETURNING VALUE(success) TYPE abap_bool.
ENDINTERFACE.
