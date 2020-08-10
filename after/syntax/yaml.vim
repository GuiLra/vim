if omni#should_abort('yaml')
    finish
endif

hi! link yamlAlias           OmniGreenItalicUnderline
hi! link yamlAnchor          OmniPinkItalic
hi! link yamlBlockMappingKey OmniCyan
hi! link yamlFlowCollection  OmniPink
hi! link yamlFlowIndicator   Delimiter
hi! link yamlNodeTag         OmniPink
hi! link yamlPlainScalar     OmniYellow

