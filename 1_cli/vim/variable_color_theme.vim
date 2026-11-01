"------------------------ COLOR PALLETES ------------------------

" you can preview the with command
"      :so $VIMRUNTIME/syntax/hitest.vim
"      :hi



" https://stackoverflow.com/questions/44164518/themes-in-iterm-change-colours-in-vim
" https://sts10.github.io/2016/06/15/true-hex-colors-in-vim-with-iterm2.html
set termguicolors
" set t_Co=256

" let Black  = '#2e2e2e'
" let Grey   = '#797979'
" let White  = '#d6d6d6'
" let Red    = '#b05279'
" let Orange = '#e87d3e'
" let Yellow = '#e5b567'
" let Green  = '#b4d273'
" let Blue   = '#6c99bb'
" let Purple = '#9e86c8'


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


" Pallete monokai
let White  = '#f8f8f0' " F8F8F2
let LGrey  = '#BCBCBC'
let LGrey  = '#90908a'
let Grey   = '#75715e'
let DGrey  = '#64645e'
let DGrey  = '#49483e'
let DGrey  = '#3c3d37'
let Black  = '#272822'
let Red    = '#F92672'
let Orange = '#FD971F'
let Yellow = '#E6DB74'
let Green  = '#A6E22E'
let Blue   = '#66D9EF'
let Purple = '#AE81FF'


"------------------------ HIGHLIGHT GROUPS ------------------------



syntax on " Turn on syntax highlighting.
syntax reset                             

let Parts = {}

" Top tabs
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


let Parts['Function']     = {"FG": Green} " Function name (also: methods for classes)

" Normal text
let Parts['Normal']       = {"FG": White, "BG": Black}
let Parts['Comment']      = {"FG": Grey} " any comment

" Types
let Parts['Type']         = {"FG": Blue} " int, long, char, ...
let Parts['StorageClass'] = {"FG": Red}  " static, register, volatile, ...
let Parts['Structure']    = {"FG": Blue} " struct, union, enum, ...
let Parts['Typedef']      = {"FG": Blue} " A typedef

" Values
let Parts['Constant']     = {"FG": Purple, "GUI": "Bold"}  " any constant
let Parts['Boolean']      = {"FG": Purple}                 " a boolean: TRUE, false
let Parts['Number']       = {"FG": Purple}                 " a number: 234, 0xff
let Parts['Float']        = {"FG": Purple}                 " a floating point: 2.3e10
let Parts['Character']    = {"FG": Yellow}                 " a character: 'c', '\n'
let Parts['String']       = {"FG": Yellow}                 " a string: (double quotes)

" Statement (Reserved words)
let Parts['Statement']    = {"FG": Red}    " Any statement
let Parts['Conditional']  = {"FG": Red}    " if, then, else, endif, switch, ...
let Parts['Repeat']       = {"FG": Red}    " for, do, while, ...
let Parts['Label']        = {"FG": Red}    " case, default, ...
let Parts['Operator']     = {"FG": Purple} " +, *, sizeof, ...
let Parts['Keyword']      = {"FG": Orange} " any other keyword
let Parts['Exception']    = {"FG": Red}    " try, catch, throw



highlight clear " Reset
" For loop inspired in
" https://stackoverflow.com/questions/2444072/defining-a-color-variable-in-vim
" https://github.com/vim-scripts/bandit.vim/blob/master/colors/bandit.vim
for key in keys(Parts)
    let s:colours = Parts[key]
    
    let fg  = has_key(s:colours, 'FG')  ? s:colours['FG']  : 'NONE'
    let bg  = has_key(s:colours, 'BG')  ? s:colours['BG']  : 'NONE'
    let gui = has_key(s:colours, 'GUI') ? s:colours['GUI'] : 'NONE'
    
    execute "highlight ".key." guifg=".fg." guibg=".bg." gui=".gui." term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE"
    " guisp=
endfor



