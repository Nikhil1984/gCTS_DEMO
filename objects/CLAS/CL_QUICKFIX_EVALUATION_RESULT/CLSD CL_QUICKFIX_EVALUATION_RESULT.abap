class-pool .
*"* class pool for class CL_QUICKFIX_EVALUATION_RESULT

*"* local type definitions
include CL_QUICKFIX_EVALUATION_RESULT=ccdef.

*"* class CL_QUICKFIX_EVALUATION_RESULT definition
*"* public declarations
  include CL_QUICKFIX_EVALUATION_RESULT=cu.
*"* protected declarations
  include CL_QUICKFIX_EVALUATION_RESULT=co.
*"* private declarations
  include CL_QUICKFIX_EVALUATION_RESULT=ci.
endclass. "CL_QUICKFIX_EVALUATION_RESULT definition

*"* macro definitions
include CL_QUICKFIX_EVALUATION_RESULT=ccmac.
*"* local class implementation
include CL_QUICKFIX_EVALUATION_RESULT=ccimp.

*"* test class
include CL_QUICKFIX_EVALUATION_RESULT=ccau.

class CL_QUICKFIX_EVALUATION_RESULT implementation.
*"* method's implementations
  include methods.
endclass. "CL_QUICKFIX_EVALUATION_RESULT implementation
