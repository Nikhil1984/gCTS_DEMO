"! This interface is obsolete.
"! It should be deleted if we have managed to remove all usages of the types declared here.
INTERFACE if_quickfix_source_state
  PUBLIC .

  TYPES:

    BEGIN OF ty_source_unit,
      main_program TYPE programm,
      include      TYPE programm,
    END OF ty_source_unit,

    BEGIN OF ty_position,
      line        TYPE i,
      line_offset TYPE i,
    END OF ty_position,

    BEGIN OF ty_source_unit_position,
      source_unit TYPE ty_source_unit,
      position    TYPE ty_position,
    END OF ty_source_unit_position.

ENDINTERFACE.