" Omni Theme: {{{
"
" Copyright 2016, All rights reserved
"
" Code licensed under the MIT license
" http://zenorocha.mit-license.org
"
scriptencoding utf8
" }}}

" Configuration: {{{

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'omni'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" Palette: {{{2

let s:fg        = g:omni#palette.fg

let s:bglighter = g:omni#palette.bglighter
let s:bglight   = g:omni#palette.bglight
let s:bg        = g:omni#palette.bg
let s:bgdark    = g:omni#palette.bgdark
let s:bgdarker  = g:omni#palette.bgdarker

let s:comment   = g:omni#palette.comment
let s:selection = g:omni#palette.selection
let s:subtle    = g:omni#palette.subtle

let s:cyan      = g:omni#palette.cyan
let s:green     = g:omni#palette.green
let s:orange    = g:omni#palette.orange
let s:pink      = g:omni#palette.pink
let s:purple    = g:omni#palette.purple
let s:red       = g:omni#palette.red
let s:yellow    = g:omni#palette.yellow

let s:none      = ['NONE', 'NONE']

if has('terminal')
  let g:terminal_ansi_colors = []
  for s:i in range(16)
    call add(g:terminal_ansi_colors, g:omni#palette['color_' . s:i])
  endfor
endif

" }}}2
" User Configuration: {{{2

if !exists('g:omni_bold')
  let g:omni_bold = 1
endif

if !exists('g:omni_italic')
  let g:omni_italic = 1
endif

if !exists('g:omni_underline')
  let g:omni_underline = 1
endif

if !exists('g:omni_undercurl') && g:omni_underline != 0
  let g:omni_undercurl = 1
endif

if !exists('g:omni_inverse')
  let g:omni_inverse = 1
endif

if !exists('g:omni_colorterm')
  let g:omni_colorterm = 1
endif

"}}}2
" Script Helpers: {{{2

let s:attrs = {
      \ 'bold': g:omni_bold == 1 ? 'bold' : 0,
      \ 'italic': g:omni_italic == 1 ? 'italic' : 0,
      \ 'underline': g:omni_underline == 1 ? 'underline' : 0,
      \ 'undercurl': g:omni_undercurl == 1 ? 'undercurl' : 0,
      \ 'inverse': g:omni_inverse == 1 ? 'inverse' : 0,
      \}

function! s:h(scope, fg, ...) " bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  " Falls back to coloring foreground group on terminals because
  " nearly all do not support undercurl
  let l:special = get(a:, 3, ['NONE', 'NONE'])
  if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !has('gui_running')
    let l:fg[0] = l:special[0]
    let l:fg[1] = l:special[1]
  endif

  let l:hl_string = [
        \ 'highlight', a:scope,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
        \ 'guisp=' . l:special[0],
        \]

  execute join(l:hl_string, ' ')
endfunction

"}}}2
" Omni Highlight Groups: {{{2

call s:h('OmniBgLight', s:none, s:bglight)
call s:h('OmniBgLighter', s:none, s:bglighter)
call s:h('OmniBgDark', s:none, s:bgdark)
call s:h('OmniBgDarker', s:none, s:bgdarker)

call s:h('OmniFg', s:fg)
call s:h('OmniFgUnderline', s:fg, s:none, [s:attrs.underline])
call s:h('OmniFgBold', s:fg, s:none, [s:attrs.bold])

call s:h('OmniComment', s:comment)
call s:h('OmniCommentBold', s:comment, s:none, [s:attrs.bold])

call s:h('OmniSelection', s:none, s:selection)

call s:h('OmniSubtle', s:subtle)

call s:h('OmniCyan', s:cyan)
call s:h('OmniCyanItalic', s:cyan, s:none, [s:attrs.italic])

call s:h('OmniGreen', s:green)
call s:h('OmniGreenBold', s:green, s:none, [s:attrs.bold])
call s:h('OmniGreenItalic', s:green, s:none, [s:attrs.italic])
call s:h('OmniGreenItalicUnderline', s:green, s:none, [s:attrs.italic, s:attrs.underline])

call s:h('OmniOrange', s:orange)
call s:h('OmniOrangeBold', s:orange, s:none, [s:attrs.bold])
call s:h('OmniOrangeItalic', s:orange, s:none, [s:attrs.italic])
call s:h('OmniOrangeBoldItalic', s:orange, s:none, [s:attrs.bold, s:attrs.italic])
call s:h('OmniOrangeInverse', s:bg, s:orange)

call s:h('OmniPink', s:pink)
call s:h('OmniPinkItalic', s:pink, s:none, [s:attrs.italic])

call s:h('OmniPurple', s:purple)
call s:h('OmniPurpleBold', s:purple, s:none, [s:attrs.bold])
call s:h('OmniPurpleItalic', s:purple, s:none, [s:attrs.italic])

call s:h('OmniRed', s:red)
call s:h('OmniRedInverse', s:fg, s:red)

call s:h('OmniYellow', s:yellow)
call s:h('OmniYellowItalic', s:yellow, s:none, [s:attrs.italic])

call s:h('OmniError', s:red, s:none, [], s:red)

call s:h('OmniErrorLine', s:none, s:none, [s:attrs.undercurl], s:red)
call s:h('OmniWarnLine', s:none, s:none, [s:attrs.undercurl], s:orange)
call s:h('OmniInfoLine', s:none, s:none, [s:attrs.undercurl], s:cyan)

call s:h('OmniTodo', s:cyan, s:none, [s:attrs.bold, s:attrs.inverse])
call s:h('OmniSearch', s:green, s:none, [s:attrs.inverse])
call s:h('OmniBoundary', s:comment, s:bgdark)
call s:h('OmniLink', s:cyan, s:none, [s:attrs.underline])

call s:h('OmniDiffChange', s:orange, s:none)
call s:h('OmniDiffText', s:bg, s:orange)
call s:h('OmniDiffDelete', s:red, s:bgdark)

" }}}2

" }}}
" User Interface: {{{

set background=dark

" Required as some plugins will overwrite
call s:h('Normal', s:fg, g:omni_colorterm || has('gui_running') ? s:bg : s:none )
call s:h('StatusLine', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineNC', s:none, s:bglight)
call s:h('StatusLineTerm', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineTermNC', s:none, s:bglight)
call s:h('WildMenu', s:bg, s:purple, [s:attrs.bold])
call s:h('CursorLine', s:none, s:subtle)

hi! link ColorColumn  OmniBgDark
hi! link CursorColumn CursorLine
hi! link CursorLineNr OmniYellow
hi! link DiffAdd      OmniGreen
hi! link DiffAdded    DiffAdd
hi! link DiffChange   OmniDiffChange
hi! link DiffDelete   OmniDiffDelete
hi! link DiffRemoved  DiffDelete
hi! link DiffText     OmniDiffText
hi! link Directory    OmniPurpleBold
hi! link ErrorMsg     OmniRedInverse
hi! link FoldColumn   OmniSubtle
hi! link Folded       OmniBoundary
hi! link IncSearch    OmniOrangeInverse
call s:h('LineNr', s:comment)
hi! link MoreMsg      OmniFgBold
hi! link NonText      OmniSubtle
hi! link Pmenu        OmniBgDark
hi! link PmenuSbar    OmniBgDark
hi! link PmenuSel     OmniSelection
hi! link PmenuThumb   OmniSelection
hi! link Question     OmniFgBold
hi! link Search       OmniSearch
call s:h('SignColumn', s:comment)
hi! link TabLine      OmniBoundary
hi! link TabLineFill  OmniBgDarker
hi! link TabLineSel   Normal
hi! link Title        OmniGreenBold
hi! link VertSplit    OmniBoundary
hi! link Visual       OmniSelection
hi! link VisualNOS    Visual
hi! link WarningMsg   OmniOrangeInverse

" }}}
" Syntax: {{{

" Required as some plugins will overwrite
call s:h('MatchParen', s:green, s:none, [s:attrs.underline])
call s:h('Conceal', s:cyan, s:none)

" Neovim uses SpecialKey for escape characters only. Vim uses it for that, plus whitespace.
if has('nvim')
  hi! link SpecialKey OmniRed
  hi! link LspDiagnosticsUnderline OmniFgUnderline
  hi! link LspDiagnosticsInformation OmniCyan
  hi! link LspDiagnosticsHint OmniCyan
  hi! link LspDiagnosticsError OmniError
  hi! link LspDiagnosticsWarning OmniOrange
  hi! link LspDiagnosticsUnderlineError OmniErrorLine
  hi! link LspDiagnosticsUnderlineHint OmniInfoLine
  hi! link LspDiagnosticsUnderlineInformation OmniInfoLine
  hi! link LspDiagnosticsUnderlineWarning OmniWarnLine
else
  hi! link SpecialKey OmniSubtle
endif

hi! link Comment OmniComment
hi! link Underlined OmniFgUnderline
hi! link Todo OmniTodo

hi! link Error OmniError
hi! link SpellBad OmniErrorLine
hi! link SpellLocal OmniWarnLine
hi! link SpellCap OmniInfoLine
hi! link SpellRare OmniInfoLine

hi! link Constant OmniPurple
hi! link String OmniYellow
hi! link Character OmniPink
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

hi! link Identifier OmniFg
hi! link Function OmniGreen

hi! link Statement OmniPink
hi! link Conditional OmniPink
hi! link Repeat OmniPink
hi! link Label OmniPink
hi! link Operator OmniPink
hi! link Keyword OmniPink
hi! link Exception OmniPink

hi! link PreProc OmniPink
hi! link Include OmniPink
hi! link Define OmniPink
hi! link Macro OmniPink
hi! link PreCondit OmniPink
hi! link StorageClass OmniPink
hi! link Structure OmniPink
hi! link Typedef OmniPink

hi! link Type OmniCyanItalic

hi! link Delimiter OmniFg

hi! link Special OmniPink
hi! link SpecialComment OmniCyanItalic
hi! link Tag OmniCyan
hi! link helpHyperTextJump OmniLink
hi! link helpCommand OmniPurple
hi! link helpExample OmniGreen
hi! link helpBacktick Special

"}}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0 et:
