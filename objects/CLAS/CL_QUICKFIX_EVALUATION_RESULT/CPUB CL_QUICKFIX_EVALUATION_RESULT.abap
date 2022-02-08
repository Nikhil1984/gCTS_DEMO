CLASS cl_quickfix_evaluation_result DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_quickfix_evaluation_result.

    METHODS
      constructor
        IMPORTING
          i_uri              TYPE string
          i_display_name     TYPE string optional
          i_description      TYPE string optional
          i_type             TYPE string optional.

    METHODS
      add_affected_object
        IMPORTING
          i_affected_object TYPE REF TO if_quickfix_source_object.

    METHODS
      set_affected_objects
        IMPORTING
          i_affected_objects TYPE if_quickfix_source_object=>tab.

    methods
      set_user_content
        importing
          i_user_content type csequence.
