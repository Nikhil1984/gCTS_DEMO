class cl_quickfix_adt_res_evaluation definition
  public
  inheriting from cl_adt_rest_resource
  final
  create public .

  public section.
    "! Name of the resource controller
    constants co_class_name type seoclsname value 'CL_QUICKFIX_ADT_RES_EVALUATION' ##no_text. "#EC NOTEXT

    methods:
      constructor,
      post redefinition.
