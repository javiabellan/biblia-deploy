
"---------------- COLOR THEMES ----------------

" https://sts10.github.io/2016/06/15/true-hex-colors-in-vim-with-iterm2.html
set termguicolors " use gui colors instead of cterm colors

syntax on " Turn on syntax highlighting.

colorscheme javi
" you can preview the with command
"      :so $VIMRUNTIME/syntax/hitest.vim
"      :hi
"--------------------------------------


set nocompatible             " Disable compatibility with vi
set shortmess+=I             " Disable the default Vim startup message.

set mouse=a                  " Enable mouse support.

set cursorline               " Highlight cursor line underneath the cursor horizontally.
"set cursorcolumn            " Highlight cursor line underneath the cursor vertically.

filetype on                  " Enable type file detection.
filetype plugin on           " Enable plugins and load plugin for the detected file type.
filetype indent on           " Load an indent file for the detected file type.

set number                   " Show line numbers.
"set relativenumber          " This enables relative line numbering mode.

set shiftwidth=4             " Set shift width to 4 spaces.
set tabstop=4                " Set tab width to 4 columns.
"set expandtab               " Use space characters instead of tabs.

set nobackup                 " Do not save backup files.
set scrolloff=10             " Do not let cursor scroll below or above N number of lines when scrolling.
set nowrap                   " Do not wrap lines. Allow long lines to extend as far as the line goes.
set incsearch                " Enable searching as you type, rather than waiting till you press enter.

set ignorecase               " Ignore capital letters during search.
set smartcase                " Override the ignorecase option if searching for capital letters.

set showcmd                  " Show partial command you type in the last line of the screen.
set showmode                 " Show the mode you are on the last line.
set showmatch                " Show matching words during a search.

set hlsearch                 " Use highlighting when doing a search.
set history=1000             " Set the commands to save in history default number is 20.


set backspace=indent,eol,start  " makes backspace behave more reasonably

" https://superuser.com/questions/35389/in-vim-how-do-i-make-the-left-and-right-arrow-keys-change-line
set whichwrap+=<,>,[,]       " makes left and right arrow keys change line


" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden


" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=



" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Using iTerm2? Go-to preferences / profile / colors and disable the smart bar
" cursor color. Then pick a cursor and highlight color that matches your theme.
" That will ensure your cursor is always visible within insert mode.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


"------------------- TAB LINE (TOP BAR) -------------------
" set showtabline=0 " Hide
" set showtabline=1 " Show
set showtabline=2   " Always show
"----------------------------------------------------------


"------------------- STATUS LINE (BOTTOM BAR) -------------------
" %F – Display the full path of the current file.
" %M – Modified flag [+] shows if file is unsaved.
" %y – Programming language lowercase (eg python)
" %Y – Programming language uppercase (eg PYTHON)
" %R – Displays the read-only flag.
" %b – Shows the ASCII/Unicode character under cursor.
" 0x%B – Shows the hexadecimal character under cursor.
" %l – Line number.
" %c – Column number.
" %p%% – Show the cursor percentage from the top of the file.
" %n - Window number ???
" %{&fileencoding?&fileencoding:&encoding}   -> utf-8
" %{&fileformat}                             -> unix
" \[   -> "[" character
" \    -> space character



"function! GitBranch()
"  let branch=fugitive#head()
"  if branch != ''
"    return ' ' . branch . ' '
"  else
"    return ''
"  endif
"endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?' '.l:branchname.' ':''
endfunction



function! FileEnc()
  return &fileencoding ? &fileencoding : &encoding
endfunction

" https://vim.fandom.com/wiki/Showing_syntax_highlight_group_in_statusline
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction


let g:modes={
	\ 'n'  : 'NORMAL',
	\ 'v'  : 'VISUAL',
	\ 's'  : 'SELECT',
	\ 'i'  : 'INSERT',
	\ 'R'  : 'REPLACE',
	\ 'Rv' : 'V·REPLACE',
	\ 'c'  : 'COMMAND',
	\}

function! CurrentMode()
  return ' ' . get(g:modes, mode()) . ' '
endfunction



set laststatus=2                      " Show the status on the second to last line.

" LEFT PART
set statusline=                       " Clear
set statusline+=%{CurrentMode()}      " Mode
set statusline+=\ Line:\ %l\ Col:\ %c " Line and column
set statusline+=%#PmenuSel#           " Color for git status
set statusline+=%{StatuslineGit()}    " git status
set statusline+=%#LineNr#             " Color for filename
set statusline+=\ %f                  " filename
set statusline+=%m\                   " Modified file flag [+]

set statusline+=%=                    " Left-right separator

" RIGHT PART
"set statusline+=\ %{FileEnc()}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
set statusline+=%{SyntaxItem()}              " syntax highlight group under cursor
set statusline+=%#CursorColumn#
set statusline+=\ %Y\                  " Programming language (lowercase)
"----------------------------------------------------------------


