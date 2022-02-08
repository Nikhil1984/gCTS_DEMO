class-pool .
*"* class pool for class CL_QUICKFIX_SOURCE_OBJECT

*"* local type definitions
include CL_QUICKFIX_SOURCE_OBJECT=====ccdef.

*"* class CL_QUICKFIX_SOURCE_OBJECT definition
*"* public declarations
  include CL_QUICKFIX_SOURCE_OBJECT=====cu.
*"* protected declarations
  include CL_QUICKFIX_SOURCE_OBJECT=====co.
*"* private declarations
  include CL_QUICKFIX_SOURCE_OBJECT=====ci.
endclass. "CL_QUICKFIX_SOURCE_OBJECT definition

*"* macro definitions
include CL_QUICKFIX_SOURCE_OBJECT=====ccmac.
*"* local class implementation
include CL_QUICKFIX_SOURCE_OBJECT=====ccimp.

*"* test class
include CL_QUICKFIX_SOURCE_OBJECT=====ccau.

class CL_QUICKFIX_SOURCE_OBJECT implementation.
*"* method's implementations
  include methods.
endclass. "CL_QUICKFIX_SOURCE_OBJECT implementation
