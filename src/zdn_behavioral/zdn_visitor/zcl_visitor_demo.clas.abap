CLASS zcl_visitor_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_visitor_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(product_mouse)    = NEW zcl_el_product( name = 'Mouse' price = '50' ).
    DATA(product_keyboard) = NEW zcl_el_product( name = 'Keyboard' price = '100' ).
    DATA(customer)         = NEW zcl_el_customer( id = 'C-100' tier = 'gold' ).
    DATA(order)            = NEW zcl_el_order( ).

    order->add_item( io_product = product_mouse qty = 2 ).
    order->add_item( io_product = product_keyboard qty = 1 ).

    DATA(visitor) = NEW zcl_visitor_pricing( ).
    customer->zif_visitor_target~accept( visitor ).
    order->zif_visitor_target~accept( visitor ).

    out->write( |Customer: { customer->get_id( ) } Tier: { customer->get_tier( ) }| ).
    out->write( |Order total after discount: { visitor->get_total( ) }| ).
  ENDMETHOD.

ENDCLASS.


*          +--------------------+         +--------------------+
*          |    zif_visitable   |         |     zif_visitor    |
*          |  accept(visitor)   |<------->| visit_product(...) |
*          +--------------------+         | visit_order(...)   |
*                   ^                     | visit_customer(...)|
*                   |                     +---------------------+
*    +--------------+--------------+
*    |              |              |
*+-----------+  +-----------+  +-------------+
*| zcl_product| | zcl_order  | | zcl_customer|
*| accept(...)| | accept(...)| | accept(...) |
*+-----------+  +-----------+  +-------------+

* What is the Visitor Pattern?

*The Visitor pattern is a way to add new actions to existing classes without changing those classes
*You have objects like Product, Order, Customer.
*Each object has a method called accept(visitor).
*A Visitor is an object that knows how to do something with these objects (like calculate price, export to JSON).
*When you call object->accept(visitor), the object calls the right method on the visitor (for example, visit_product).

*If you need to add a new operation (e.g., “calculate tax” or “export to XML”), you create a new Visitor class
*instead of changing all your existing classes.

*This keeps code clean and easy to extend.
