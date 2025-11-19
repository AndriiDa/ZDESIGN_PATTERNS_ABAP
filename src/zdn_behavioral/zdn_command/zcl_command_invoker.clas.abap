CLASS zcl_command_invoker DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES tt_results TYPE STANDARD TABLE OF string WITH DEFAULT KEY.

    METHODS add_command  IMPORTING io_command        TYPE REF TO zif_command.
    METHODS run_commands RETURNING VALUE(rt_results) TYPE tt_results.

  PRIVATE SECTION.
    DATA mt_commands TYPE STANDARD TABLE OF REF TO zif_command WITH DEFAULT KEY.

ENDCLASS.


CLASS zcl_command_invoker IMPLEMENTATION.
  METHOD add_command.
    APPEND io_command TO mt_commands.
  ENDMETHOD.

  METHOD run_commands.
    LOOP AT mt_commands INTO DATA(lo_cmd).
      APPEND lo_cmd->execute( ) TO rt_results.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
