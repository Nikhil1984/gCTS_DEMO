*"* components of interface IF_QUICKFIX_EVALUATION_RESULT
INTERFACE if_quickfix_evaluation_result
  PUBLIC .

  TYPES: tab TYPE STANDARD TABLE OF REF TO if_quickfix_evaluation_result WITH DEFAULT KEY.

  METHODS get_uri
    RETURNING
      VALUE(result) TYPE string .

  METHODS get_affected_objects
    RETURNING
      VALUE(result) TYPE if_quickfix_source_object=>tab .

  METHODS get_user_content
    RETURNING
      VALUE(result) TYPE string .

  METHODS get_display_name
    RETURNING
      VALUE(result) TYPE string .

  METHODS get_description
    RETURNING
      VALUE(result) TYPE string .

  METHODS get_type
    RETURNING
      VALUE(result) TYPE string .

ENDINTERFACE.