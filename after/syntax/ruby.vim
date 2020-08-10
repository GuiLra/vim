if omni#should_abort('ruby')
    finish
endif

if ! exists('g:ruby_operators')
    let g:ruby_operators=1
endif

hi! link rubyBlockArgument          OmniOrangeItalic
hi! link rubyBlockParameter         OmniOrangeItalic
hi! link rubyCurlyBlock             OmniPink
hi! link rubyGlobalVariable         OmniPurple
hi! link rubyInstanceVariable       OmniPurpleItalic
hi! link rubyInterpolationDelimiter OmniPink
hi! link rubyRegexpDelimiter        OmniRed
hi! link rubyStringDelimiter        OmniYellow
