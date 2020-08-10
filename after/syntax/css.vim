if omni#should_abort('css')
    finish
endif

hi! link cssAttrComma         Delimiter
hi! link cssAttrRegion        OmniPink
hi! link cssAttributeSelector OmniGreenItalic
hi! link cssBraces            Delimiter
hi! link cssFunctionComma     Delimiter
hi! link cssNoise             OmniPink
hi! link cssProp              OmniCyan
hi! link cssPseudoClass       OmniPink
hi! link cssPseudoClassId     OmniGreenItalic
hi! link cssUnitDecorators    OmniPink
hi! link cssVendor            OmniGreenItalic
