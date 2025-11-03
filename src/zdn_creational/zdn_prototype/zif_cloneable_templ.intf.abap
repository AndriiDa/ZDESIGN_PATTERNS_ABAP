INTERFACE zif_cloneable_templ
  PUBLIC .

  METHODS:
    clone RETURNING VALUE(ro_clone) TYPE REF TO zif_cloneable_templ.

ENDINTERFACE.
