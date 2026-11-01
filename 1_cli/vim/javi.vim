set background=dark " Appropiate colors for light or dark 

highlight clear " Resets the highlighting the user added.

if exists("syntax_on")
  syntax reset  " gets the colors back to default ones.
endif

let g:colors_name = "javi" " naming our color scheme:



"---------------------------------------- COLORS

" Properly designed "256color" colorschemes only use colors in the 16-255 range
" so they are immune to any change to your terminal emulator's palette.

"                       ____________256 colors____________  ____________RGB colors____________

hi Black                cterm=NONE ctermfg=235 ctermbg=235  guifg=#272822 guibg=#272822 gui=NONE
hi DGrey                cterm=NONE ctermfg=240 ctermbg=235  guifg=#49483e guibg=#272822 gui=NONE
hi Grey                 cterm=NONE ctermfg=245 ctermbg=235  guifg=#75715e guibg=#272822 gui=NONE
hi LGrey                cterm=NONE ctermfg=250 ctermbg=235  guifg=#BCBCBC guibg=#272822 gui=NONE
hi White                cterm=NONE ctermfg=255 ctermbg=235  guifg=#f8f8f0 guibg=#272822 gui=NONE

hi Normal               cterm=NONE ctermfg=255 ctermbg=235  guifg=#f8f8f0 guibg=#272822 gui=NONE

hi Red                  cterm=NONE ctermfg=197 ctermbg=235  guifg=#F92672 guibg=#272822 gui=NONE
hi Orange               cterm=NONE ctermfg=208 ctermbg=235  guifg=#FD971F guibg=#272822 gui=NONE
hi Yellow               cterm=NONE ctermfg=228 ctermbg=235  guifg=#E6DB74 guibg=#272822 gui=NONE
hi Green                cterm=NONE ctermfg=77  ctermbg=235  guifg=#A6E22E guibg=#272822 gui=NONE
hi Blue                 cterm=NONE ctermfg=39  ctermbg=235  guifg=#66D9EF guibg=#272822 gui=NONE
hi Purple               cterm=NONE ctermfg=135 ctermbg=235  guifg=#AE81FF guibg=#272822 gui=NONE


"            256 colors   RGB colors
" hi Black   ctermfg=0    guifg=#000000
" hi Grey    ctermfg=8    guifg=#888888
" hi White   ctermfg=15   guifg=#FFFFFF
" hi Red     ctermfg=196  guifg=#ff0000
" hi Orange  ctermfg=208  guifg=#ff8700
" hi Yellow  ctermfg=226  guifg=#ffff00
" hi Green   ctermfg=46   guifg=#00ff00
" hi Blue    ctermfg=33   guifg=#0087ff
" hi Purple  ctermfg=135  guifg=#af5fff


" Random
" 80a0ff

" Pallete simple
" let White  = '#FFFFFF'
" let Grey   = '#888888'
" let Black  = '#000000'
" let Red    = '#FF0000'
" let Red    = '#F00000'
" let Yellow = '#F0F000'
" let Yellow = '#F0F070'
" let Purple = '#7070F0'
" let Blue   = '#70F0F0'
" let Green  = '#70F070'
" let Green  = '#70F000'
" let Green  = '#00F070'


" let Black  = '#2e2e2e'
" let Grey   = '#797979'
" let White  = '#d6d6d6'
" let Red    = '#b05279'
" let Orange = '#e87d3e'
" let Yellow = '#e5b567'
" let Green  = '#b4d273'
" let Blue   = '#6c99bb'
" let Purple = '#9e86c8'


"---------------------------------------- LINKS


"        Scheme      Color
hi! link NonText       White_on_Transparent " https://stackoverflow.com/questions/61847325/how-to-change-the-entire-background-of-vim
hi! link Comment       Grey      " Comments
hi! link Type          Blue      " Datatypes:    int, float,...
hi! link Constant      Purple    " Values:    Numbers, quoted strings, or true/false
hi! link   Boolean     Purple    "   a boolean: TRUE, false
hi! link   Number      Purple    "   a number: 234, 0xff
hi! link   Float       Purple    "   a floating point: 2.3e10
hi! link   Character   Yellow    "   a character: 'c', '\n'
hi! link   String      Yellow    "   a string: (double quotes)
hi! link Identifier    White     " Variable names
hi! link   Function    Green     "     Function name (also: methods for classes)
hi! link Statement     Blue      " Keywords: class, def, return ...
hi! link   Conditional Red       "   if, then, else, endif, switch, ...
hi! link   Repeat      Red       "   for, do, while, ...
hi! link   Label       Red       "   case, default, ...
hi! link   Operator    Purple    "   +, *, sizeof, ...
hi! link   Keyword     Orange    "   any other keyword
hi! link   Exception   Red       "   try, catch, throw
hi! link PreProc       Red       " Preprocessor: #include, ..


let Parts['Exception']    = {"FG": Red}    " try, catch, throw


let Parts['Type']         = {"FG": Blue} " int, long, char, ...
let Parts['StorageClass'] = {"FG": Red}  " static, register, volatile, ...
let Parts['Structure']    = {"FG": Blue} " struct, union, enum, ...
let Parts['Typedef']      = {"FG": Blue} " A typedef





" hi! link Special        A special symbol, usually used for special characters like "\n" in strings
" hi! link Underlined     Text that should be underlined
" hi! link Error          Text which contains a programming language error



" Markdown
" hi markdownCode 
" hi markdownH1   
" hi markdownH2   
" hi markdownH3  
" hi markdownH4 
" hi markdownH5 
" hi markdownH6 
" hi markdownListMarker
" hi markdownOrderedListMarker
" hi markdownUrl
" hi markdownItalic
" hi markdownBold
" hi markdownBoldItalic














" Normal text
let Parts['Normal']       = {"FG": White, "BG": Black}
let Parts['Comment']      = {"FG": Grey} " any comment

" Types




hi link String      Yellow
hi link Character   Yellow


hi link Float     Number


hi link IncSearch   Visual

hi link Number      Constant
hi link Boolean     Constant

hi link Function    Identifier
hi link Conditional   Statement
hi link Repeat      Statement
hi link Label     Statement
hi link Operator    Statement
hi link Keyword     Statement
hi link Exception   Statement
hi link Include     PreProc
hi link Define      PreProc
hi link Macro       PreProc
hi link PreCondit   PreProc
hi link StorageClass  Type
hi link Structure   Type
hi link Typedef     Type
hi link Tag       Special
hi link SpecialChar   Special
hi link Delimiter   Special
hi link SpecialComment  Special
hi link Debug     Special

let Parts['TabLineSel']  = {"FG": White,  "BG": Black}  " Selected tab
let Parts['TabLine']     = {"FG": White,  "BG": Grey}   " Non selected tab
let Parts['TabLineFill'] = {"FG": Grey,   "BG": Orange} " Empty space


let Parts['LineNr']       = {"FG": Grey}
let Parts['CursorLineNr'] = {"FG": White, "BG": Grey  } " Left numbers
let Parts['CursorLine']   = {             "BG": DGrey }
let Parts['CursorColumn'] = {             "BG": DGrey }
let Parts['ColorColumn']  = {             "BG": DGrey }
let Parts['NonText']      = {"FG": LGrey}
let Parts['SpecialKey']   = {"FG": LGrey}









" Statement (Reserved words)
let Parts['Statement']    = {"FG": Blue}    " Any other statement: class, def
let Parts['Conditional']  = {"FG": Red}    " if, then, else, endif, switch, ...
let Parts['Repeat']       = {"FG": Red}    " for, do, while, ...
let Parts['Label']        = {"FG": Red}    " case, default, ...
let Parts['Operator']     = {"FG": Purple} " +, *, sizeof, ...
let Parts['Keyword']      = {"FG": Orange} " any other keyword
let Parts['Exception']    = {"FG": Red}    " try, catch, throw