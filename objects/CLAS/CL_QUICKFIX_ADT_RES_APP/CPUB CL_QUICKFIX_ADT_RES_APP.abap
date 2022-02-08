class CL_QUICKFIX_ADT_RES_APP definition
  public
  inheriting from CL_ADT_DISC_RES_APP_BASE
  final
  create public .

public section.

  constants CO_SCHEME type STRING value 'http://www.sap.com/adt/categories/quickfixes' ##NO_TEXT.
  constants CO_CONTENT_TYPE_V1 type STRING value 'application/vnd.sap.adt.quickfixes.evaluation+xml;version=1.0.0' ##NO_TEXT.
