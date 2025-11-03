CLASS zcl_customer_manager DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS:
      constructor
        IMPORTING iv_flight_id TYPE /dmo/travel_id,

      get_flight_data
        RETURNING VALUE(flight) TYPE zrap110_atrav001,

      get_book_data
        RETURNING VALUE(books) TYPE zrap110_abook001.

  PRIVATE SECTION.
    METHODS:
      load_flights,
      load_books,
      log_message IMPORTING iv_text TYPE string
                            iv_type TYPE string DEFAULT 'INFO'.

    TYPES: BEGIN OF ty_log,
             timestamp TYPE timestampl,
             msg_type  TYPE string,
             message   TYPE string,
           END OF ty_log.

    DATA:
      flight_id     TYPE /dmo/travel_id,
      flight        TYPE zrap110_atrav001,
      books         TYPE STANDARD TABLE OF zrap110_abook001 WITH DEFAULT KEY,
      log_messages  TYPE STANDARD TABLE OF ty_log WITH DEFAULT KEY,
      flight_loaded TYPE abap_bool,
      books_loaded  TYPE abap_bool.
ENDCLASS.


CLASS zcl_customer_manager IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(lo_manager) = NEW zcl_customer_manager( iv_flight_id = '00000012' ).

    DATA(ls_flight) = lo_manager->get_flight_data( ).
    DATA(lt_books)  = lo_manager->get_book_data( ).

    out->write( |Flight: { ls_flight-travel_id }| ).
    out->write( |Bookings: { lines( books ) }| ).

    out->write( |--- Log Messages ---| ).
    LOOP AT lo_manager->log_messages INTO DATA(log).
      out->write( log ).
    ENDLOOP.

  ENDMETHOD.

  METHOD constructor.
    flight_id = iv_flight_id.
    CLEAR: flight, books.
    flight_loaded = abap_false.
    books_loaded  = abap_false.
    log_message( |Constructor called with Flight ID: { iv_flight_id }| ).
  ENDMETHOD.

  METHOD get_flight_data.
    IF flight_loaded = abap_false.
      load_flights( ).
    ENDIF.
    RETURN flight.
  ENDMETHOD.

  METHOD get_book_data.
    IF books_loaded = abap_false.
      load_books( ).
    ENDIF.
    RETURN books.
  ENDMETHOD.

  METHOD load_flights.
    SELECT SINGLE *
      FROM zrap110_atrav001
      WHERE travel_id = @flight_id
      INTO @flight.

    IF sy-subrc = 0.
      flight_loaded = abap_true.
      log_message( |Flight data loaded for ID: { flight_id }| ).
    ELSE.
      log_message( |No flight found for ID: { flight_id }| ).
    ENDIF.
  ENDMETHOD.

  METHOD load_books.
    SELECT *
      FROM zrap110_abook001
      WHERE travel_id = @flight_id
      INTO TABLE @books.

    IF sy-subrc = 0.
      books_loaded = abap_true.
      log_message( |{ lines( books ) } bookings loaded for Flight ID: { flight_id }| ).
    ELSE.
      log_message( |No bookings found for Flight ID: { flight_id }| ).
    ENDIF.
  ENDMETHOD.


  METHOD log_message.
    DATA ls_log TYPE ty_log.
    GET TIME STAMP FIELD ls_log-timestamp.
    ls_log-msg_type = iv_type.
    ls_log-message  = iv_text.
    APPEND ls_log TO log_messages.
  ENDMETHOD.


ENDCLASS.

