CLASS cl_quickfix_adt_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.

    CONSTANTS co_provider_id TYPE string VALUE 'provider_id'. "#EC NOTEXT
    CONSTANTS co_quickfix_id TYPE string VALUE 'quickfix_id'. "#EC NOTEXT

    CLASS-METHODS get_or_create_instance
      RETURNING
        VALUE(result) TYPE REF TO cl_quickfix_adt_helper .

    METHODS create_quickfix_source_object
      IMPORTING
        !uri                          TYPE csequence
        !source                       TYPE sadt_srl_plain_text
      RETURNING
        VALUE(quickfix_source_object) TYPE REF TO if_quickfix_source_object
      RAISING
        cx_adt_rest .

    METHODS create_evaluation_result
      IMPORTING
        !adt_rest_request        TYPE REF TO if_adt_rest_request
        !adt_proposal_request    TYPE if_quickfix_adt_types=>ty_quickfix_proposal_request
      RETURNING
        VALUE(evaluation_result) TYPE REF TO if_quickfix_evaluation_result
      RAISING
        cx_adt_rest.

    METHODS create_adt_evaluation_results
      IMPORTING
        !evaluation_results           TYPE if_quickfix_evaluation_result=>tab
      RETURNING
        VALUE(adt_evaluation_results) TYPE if_quickfix_adt_types=>ty_quickfix_evaluation_results
      RAISING
        cx_adt_rest .

    METHODS create_adt_proposal_result
      IMPORTING
        proposal_result            TYPE REF TO if_quickfix_result
      RETURNING
        VALUE(adt_proposal_result) TYPE if_quickfix_adt_types=>ty_quickfix_proposal_result
      RAISING
        cx_adt_uri_mapping .
    METHODS create_affected_objects
      IMPORTING
        affected_objects TYPE if_quickfix_adt_types=>ty_quickfix_proposal_deltas
      RETURNING
        VALUE(result)    TYPE if_quickfix_source_object=>tab
      RAISING
        cx_adt_uri_mapping .
    METHODS create_affected_object
      IMPORTING
        i_adt_object_reference TYPE if_adt_object_reference_ch=>ty_object_reference
        i_content         TYPE string
      RETURNING
        VALUE(r_result)   TYPE REF TO if_quickfix_source_object
      RAISING cx_adt_uri_mapping .
