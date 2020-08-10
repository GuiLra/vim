if omni#should_abort('gitcommit')
    finish
endif

" The following two are misnomers. Colors are correct.
hi! link diffFile    OmniGreen
hi! link diffNewFile OmniRed

hi! link diffAdded   OmniGreen
hi! link diffLine    OmniCyanItalic
hi! link diffRemoved OmniRed

