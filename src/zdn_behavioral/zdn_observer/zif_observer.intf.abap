
INTERFACE zif_observer PUBLIC.

  TYPES: BEGIN OF message,
           type_message TYPE string,
           content      TYPE string,
         END OF message.

  TYPES messages TYPE STANDARD TABLE OF message WITH DEFAULT KEY.

  METHODS update
    IMPORTING i_message TYPE message.

ENDINTERFACE.
