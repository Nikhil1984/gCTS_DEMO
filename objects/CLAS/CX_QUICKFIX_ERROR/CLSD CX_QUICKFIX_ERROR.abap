class-pool .
*"* class pool for class CX_QUICKFIX_ERROR

*"* local type definitions
include CX_QUICKFIX_ERROR=============ccdef.

*"* class CX_QUICKFIX_ERROR definition
*"* public declarations
  include CX_QUICKFIX_ERROR=============cu.
*"* protected declarations
  include CX_QUICKFIX_ERROR=============co.
*"* private declarations
  include CX_QUICKFIX_ERROR=============ci.
endclass. "CX_QUICKFIX_ERROR definition

*"* macro definitions
include CX_QUICKFIX_ERROR=============ccmac.
*"* local class implementation
include CX_QUICKFIX_ERROR=============ccimp.

*"* test class
include CX_QUICKFIX_ERROR=============ccau.

class CX_QUICKFIX_ERROR implementation.
*"* method's implementations
  include methods.
endclass. "CX_QUICKFIX_ERROR implementation
