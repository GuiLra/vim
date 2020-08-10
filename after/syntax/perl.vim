if omni#should_abort('perl')
    finish
endif

" Regex
hi! link perlMatchStartEnd       OmniRed

" Builtin functions
hi! link perlOperator            OmniCyan
hi! link perlStatementFiledesc   OmniCyan
hi! link perlStatementFiles      OmniCyan
hi! link perlStatementFlow       OmniCyan
hi! link perlStatementHash       OmniCyan
hi! link perlStatementIOfunc     OmniCyan
hi! link perlStatementIPC        OmniCyan
hi! link perlStatementList       OmniCyan
hi! link perlStatementMisc       OmniCyan
hi! link perlStatementNetwork    OmniCyan
hi! link perlStatementNumeric    OmniCyan
hi! link perlStatementProc       OmniCyan
hi! link perlStatementPword      OmniCyan
hi! link perlStatementRegexp     OmniCyan
hi! link perlStatementScalar     OmniCyan
hi! link perlStatementSocket     OmniCyan
hi! link perlStatementTime       OmniCyan
hi! link perlStatementVector     OmniCyan

" Highlighting for quoting constructs, tied to existing option in vim-perl
if get(g:, 'perl_string_as_statement', 0)
  hi! link perlStringStartEnd OmniRed
endif

" Signatures
hi! link perlSignature           OmniOrangeItalic
hi! link perlSubPrototype        OmniOrangeItalic

" Hash keys
hi! link perlVarSimpleMemberName OmniPurple
