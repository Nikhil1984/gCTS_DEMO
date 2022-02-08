class-pool .
*"* class pool for class CL_QUICKFIX_ADT_HELPER

*"* local type definitions
include CL_QUICKFIX_ADT_HELPER========ccdef.

*"* class CL_QUICKFIX_ADT_HELPER definition
*"* public declarations
  include CL_QUICKFIX_ADT_HELPER========cu.
*"* protected declarations
  include CL_QUICKFIX_ADT_HELPER========co.
*"* private declarations
  include CL_QUICKFIX_ADT_HELPER========ci.
endclass. "CL_QUICKFIX_ADT_HELPER definition

*"* macro definitions
include CL_QUICKFIX_ADT_HELPER========ccmac.
*"* local class implementation
include CL_QUICKFIX_ADT_HELPER========ccimp.

*"* test class
include CL_QUICKFIX_ADT_HELPER========ccau.

class CL_QUICKFIX_ADT_HELPER implementation.
*"* method's implementations
  include methods.
endclass. "CL_QUICKFIX_ADT_HELPER implementation
