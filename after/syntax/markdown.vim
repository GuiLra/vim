if omni#should_abort('markdown', 'mkd')
    finish
endif

if b:current_syntax ==# 'mkd'
" plasticboy/vim-markdown {{{1
  hi! link htmlBold       OmniOrangeBold
  hi! link htmlBoldItalic OmniOrangeBoldItalic
  hi! link htmlH1         OmniPurpleBold
  hi! link htmlItalic     OmniYellowItalic
  hi! link mkdBlockquote  OmniYellowItalic
  hi! link mkdBold        OmniOrangeBold
  hi! link mkdBoldItalic  OmniOrangeBoldItalic
  hi! link mkdCode        OmniGreen
  hi! link mkdCodeEnd     OmniGreen
  hi! link mkdCodeStart   OmniGreen
  hi! link mkdHeading     OmniPurpleBold
  hi! link mkdInlineUrl   OmniLink
  hi! link mkdItalic      OmniYellowItalic
  hi! link mkdLink        OmniPink
  hi! link mkdListItem    OmniCyan
  hi! link mkdRule        OmniComment
  hi! link mkdUrl         OmniLink
"}}}1
elseif b:current_syntax ==# 'markdown'
" Builtin: {{{1
  hi! link markdownBlockquote        OmniCyan
  hi! link markdownBold              OmniOrangeBold
  hi! link markdownBoldItalic        OmniOrangeBoldItalic
  hi! link markdownCodeBlock         OmniGreen
  hi! link markdownCode              OmniGreen
  hi! link markdownCodeDelimiter     OmniGreen
  hi! link markdownH1                OmniPurpleBold
  hi! link markdownH2                markdownH1
  hi! link markdownH3                markdownH1
  hi! link markdownH4                markdownH1
  hi! link markdownH5                markdownH1
  hi! link markdownH6                markdownH1
  hi! link markdownHeadingDelimiter  markdownH1
  hi! link markdownHeadingRule       markdownH1
  hi! link markdownItalic            OmniYellowItalic
  hi! link markdownLinkText          OmniPink
  hi! link markdownListMarker        OmniCyan
  hi! link markdownOrderedListMarker OmniCyan
  hi! link markdownRule              OmniComment
  hi! link markdownUrl               OmniLink
"}}}
endif

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
