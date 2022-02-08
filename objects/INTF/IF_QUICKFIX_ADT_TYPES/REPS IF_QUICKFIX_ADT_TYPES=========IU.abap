*"* components of interface IF_QUICKFIX_ADT_CH
INTERFACE if_quickfix_adt_types
  PUBLIC .


  TYPES:
    ty_marker_ids TYPE STANDARD TABLE OF string WITH DEFAULT KEY .

  TYPES:
    BEGIN OF ty_quickfix_proposal_delta,
        affected_object TYPE if_adt_object_reference_ch=>ty_object_reference,
        content         TYPE string,
        links           TYPE if_atom_types=>link_t,
      END OF ty_quickfix_proposal_delta .
  TYPES:
    ty_quickfix_proposal_deltas TYPE STANDARD TABLE OF ty_quickfix_proposal_delta WITH DEFAULT KEY .

  types: begin of ty_quickfix_eval_affected_objs,
    affected_objects type ty_quickfix_proposal_deltas,
  end of ty_quickfix_eval_affected_objs.

  TYPES:
    BEGIN OF ty_quickfix_evaluation_request,
      uri                 TYPE        string,
      marker_id_is_filter TYPE        abap_bool,
      marker_ids          TYPE        ty_marker_ids,
      affected_objects    type        ty_quickfix_proposal_deltas,
*      source              TYPE        sadt_srl_plain_text,
      END OF ty_quickfix_evaluation_request .


  TYPES:
    BEGIN OF ty_quickfix_evaluation_result,
        object_reference TYPE if_adt_object_reference_ch=>ty_object_reference,  " uri of quickfix
        user_content     TYPE string,                                           " user defined content
        affected_objects TYPE if_adt_object_reference_ch=>ty_object_references, " uris of affected resources
      END OF ty_quickfix_evaluation_result .
  TYPES:
    ty_quickfix_evaluation_results TYPE STANDARD TABLE OF ty_quickfix_evaluation_result WITH DEFAULT KEY .

  TYPES:
    BEGIN OF ty_quickfix_proposal_request,
        input             TYPE ty_quickfix_proposal_delta, " delta is affected object + source code
        affected_objects  TYPE ty_quickfix_proposal_deltas, " delta is affected object + source code
        user_content      TYPE string, " user defined content
      END OF ty_quickfix_proposal_request .

  TYPES:
    ty_variable_source_states TYPE STANDARD TABLE OF if_adt_object_reference_ch=>ty_object_references WITH DEFAULT KEY .


  TYPES:
    BEGIN OF ty_quickfix_proposal_result,
        deltas                 TYPE ty_quickfix_proposal_deltas,
        selection              TYPE if_adt_object_reference_ch=>ty_object_reference,
        variable_source_states TYPE ty_variable_source_states,
        keep_cursor            TYPE abap_bool,
        status_messages        TYPE if_quickfix_result=>ty_status_messages,
      END OF ty_quickfix_proposal_result .

ENDINTERFACE.