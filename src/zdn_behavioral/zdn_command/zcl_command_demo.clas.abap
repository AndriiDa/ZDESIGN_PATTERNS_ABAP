CLASS zcl_command_demo DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_command_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_service) = NEW zcl_inventory_service( ).
    DATA(lo_invoker) = NEW zcl_command_invoker( ).

    lo_invoker->add_command( NEW zcl_add_stock_cmd( io_service  = lo_service
                                                    iv_material = 'MAT-100'
                                                    iv_qty      = 50 ) ).
    lo_invoker->add_command( NEW zcl_remove_stock_cmd( io_service  = lo_service
                                                       iv_material = 'MAT-100'
                                                       iv_qty      = 10 ) ).
    lo_invoker->add_command( NEW zcl_transfer_stock_cmd( io_service  = lo_service
                                                         iv_material = 'MAT-100'
                                                         iv_qty      = 20
                                                         iv_target   = 'WH-02' ) ).

    DATA(lt_results) = lo_invoker->run_commands( ).
    LOOP AT lt_results INTO DATA(lv_msg).
      out->write( lv_msg ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

*What is the Command Pattern?

*Imagine you have different actions (like Add Stock, Remove Stock, Transfer Stock)
*that need to be executed on your system.
*Instead of calling these actions directly, you wrap each action inside an object called a Command
*You separate the "what to do" from "how to do it".

*flow: Client → Invoker → Command → Receiver

*Interface: zif_command with execute(), can undo().
*Concrete Commands: AddStockCommand, RemoveStockCommand.
*Receiver: InventoryService (knows how to add/remove stock).
*Invoker: CommandInvoker (executes commands, can undo).


