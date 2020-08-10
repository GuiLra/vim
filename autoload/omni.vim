" Palette: {{{

let g:omni#palette           = {}
let g:omni#palette.fg        = ['#E1E1E6', 253]

let g:omni#palette.bglighter = ['#252131', 238]
let g:omni#palette.bglight   = ['#201B2D', 230]
let g:omni#palette.bg        = ['#191622', 236]
let g:omni#palette.bgdark    = ['#13111B', 234]
let g:omni#palette.bgdarker  = ['#15121E', 234]

let g:omni#palette.comment   = ['#5A4B81',  61]
let g:omni#palette.selection = ['#41414D', 239]
let g:omni#palette.subtle    = ['#201B2D', 238]

let g:omni#palette.cyan      = ['#988bc7', 117]
let g:omni#palette.green     = ['#67e480',  84]
let g:omni#palette.orange    = ['#E89E64', 215]
let g:omni#palette.pink      = ['#FF79C6', 212]
let g:omni#palette.purple    = ['#78D1E1', 141]
let g:omni#palette.red       = ['#E96379', 203]
let g:omni#palette.yellow    = ['#e7de79', 228]

"
" ANSI
"
let g:omni#palette.color_0  = '#201B2D'
let g:omni#palette.color_1  = '#FF79C6'
let g:omni#palette.color_2  = '#67e480'
let g:omni#palette.color_3  = '#e7de79'
let g:omni#palette.color_4  = '#78D1E1'
let g:omni#palette.color_5  = '#988bc7'
let g:omni#palette.color_6  = '#A1EFE4'
let g:omni#palette.color_7  = '#E1E1E6'
let g:omni#palette.color_8  = '#626483'
let g:omni#palette.color_9  = '#ed4556'
let g:omni#palette.color_10 = '#00F769'
let g:omni#palette.color_11 = '#e7de79'
let g:omni#palette.color_12 = '#78D1E1'
let g:omni#palette.color_13 = '#988bc7'
let g:omni#palette.color_14 = '#A4FFFF'
let g:omni#palette.color_15 = '#F7F7FB'

" }}}

" Helper function that takes a variadic list of filetypes as args and returns
" whether or not the execution of the ftplugin should be aborted.
func! omni#should_abort(...)
    if ! exists('g:colors_name') || g:colors_name !=# 'omni'
        return 1
    elseif a:0 > 0 && (! exists('b:current_syntax') || index(a:000, b:current_syntax) == -1)
        return 1
    endif
    return 0
endfunction

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
