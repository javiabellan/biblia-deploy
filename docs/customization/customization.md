# 🎨 Customization (dotfiles)

- bash: `~/.bashrc`, `~/.bash_profile`
- zsh `~/.zshrc`
- git: `~/.gitconfig`
- vim: `~/.vimrc` and the `~/.vim` folder
- ssh: `~/.ssh/config`
- tmux: `~/.tmux.conf`
- nano: `~/.nanorc`









## ZSH `~/.zshrc`

Change to zsh: `sudo chsh -s /usr/bin/zsh javi`
curl -L http://install.ohmyz.sh | sh

### Change Bash to ZSH

```bash
$ sudo pacman -S zsh                # Install ZSH (and extras)
$ zsh                               # Make sure that ZSH has been installed correctly
$ chsh -l                           # List all installed shells
$ chsh -s /usr/bin/zsh              # WAY 1) Set new default shell (zsh) for your user
$ usermod --shell /usr/bin/zsh javi # WAY 2) Set new default shell (zsh) for a user (S4vitar lo hizo asi)
$ nano /etc/passwd                  # WAY 3) Set new default shell (zsh) for a user
$ echo $SHELL                       # Comprobar la nueva shell
```

> - https://wiki.archlinux.org/title/zsh#Installation
> - https://wiki.archlinux.org/title/Command-line_shell#Changing_your_default_shell
> - [3 Ways to Change a Users Default Shell](https://www.tecmint.com/change-a-users-default-shell-in-linux/)


### Better prompt -> `zsh-theme-powerlevel10k`

```bash
$ sudo pacman -S zsh-theme-powerlevel10k
$ echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
$ source ~/.zshrc
$ p10k configure
```
- https://github.com/ahillio/powerlevel10k/blob/master/README.md#arch-linux

### Colors on terminal outout

```bash
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
```
Pacman has a color option. Uncomment the `Color` line in `/etc/pacman.conf`.

https://wiki.archlinux.org/title/Color_output_in_console

Other way is to install `grml-zsh-config`

### Colors on terminal commands -> `zsh-syntax-highlighting`

```bash
$ sudo pacman -S zsh-syntax-highlighting
$ echo 'source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
```

### Sugerir comandos del pasado -> `zsh-autosuggestions`

```bash
$ sudo pacman -S zsh-autosuggestions
$ echo 'source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
```

### ZSH: Other plugins

- zsh-completions
- zsh-sudo   -> con esc esc  te pone sudo al principio (source /usr/share/zsh-sudo/sudo.plugin.zsh
)
- zsh-suggestions
- fzf -> con ctrl + T busca

```bash
# ZSH pluggins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# General
alias l='lsd'
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias tree='lsd --tree'

# Jupyter notebook
alias jn="jupyter notebook"

# Pacman
alias i="sudo pacman -S"        # install a package
alias s="pacman -Ss"            # search for a package
alias u="sudo pacman -Syu"      # update the packages
alias r="sudo pacman -Rns"      # remove a package

alias install="sudo pacman -S"  # install a package
alias search="pacman -Ss"       # search for a package
alias update="sudo pacman -Syu" # update the packages
alias remove="sudo pacman -Rns" # remove a package

# Others
alias title="figlet"

# Git
function commit() {
    git add .
    msg=$@ # Every argument
    git commit -m "$msg"
    git push
}

# Open vim in "insert mode"
alias vim="vim -c 'startinsert'"
```






## Nano: `~/.nanorc`

```bash
set mouse
set autoindent  # Tthe newly created line will contain the same indent as the preceding line
set tabsize 4   # Use a tab size of number columns. The default value is 8.
set softwrap    # Enable soft line wrapping for easier viewing of very long lines
set nowrap      # Don’t hard-wrap text at all
# set nohelp    # Don’t display the two help lines at the bottom of the screen.
set linenumbers # Display of line numbers in front of the text.

include "/usr/share/nano/*.nanorc" # Default Syntax highlighting
include "/usr/share/nano-syntax-highlighting/*.nanorc" #  syntax highlighting enhancements*
```

> sudo pacman -S nano-syntax-highlighting


## TMUX `~/.tmux.conf`

```bash
####### SAME PROMT
set -g default-terminal "screen-256color"
if 'infocmp -x tmux-256color > /dev/null 2>&1' 'set -g default-terminal "tmux-256color"'

####### MOUSE (enable scroll, resize and clicks)
set -g mouse on                 # For tmux version 2.1 and above
# set -g mouse-resize-pane on   # Deprecated on version 2.1
# set -g mouse-select-pane on   # Deprecated on version 2.1
# set -g mouse-select-window on # Deprecated on version 2.1
# set -g mode-mouse on          # Deprecated on version 2.1
# set -g terminal-overrides 'xterm*:smcup@:rmcup@' # Sane scrolling (instead of mimic arrrow keys)

####### Number windows and panes start at 1 instead of 0
set -g base-index 1
set -g pane-base-index 1
```

- [Oh my tmux!](https://github.com/gpakosz/.tmux): Self-contained, pretty & versatile tmux configuration
- [Practical Tmux](https://mutelight.org/practical-tmux)




## VIM: 

```bash
touch ~/.vimrc
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged
curl https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -o ~/.vim/colors/molokai.vim
```

```
~
├─.vimrc
└─.vim/
    ├─ autoload/
    ├─ backup/
    ├─ plugged/
    ├─ syntax/
       └─ python.vim
    └─ colors/
       └─ molokai.vim
```

### `~/.vimrc`

```vim
set nocompatible             " Disable compatibility with vi
set shortmess+=I             " Disable the default Vim startup message.

set mouse+=a                 " Enable mouse support.

syntax on                    " Turn on syntax highlighting.
colorscheme molokai          " SublimeText syntax color. (~/.vim/colors/molokai.vim)
                             " Other colors in /usr/share/vim/vim*/colors/

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



highlight VertSplit    guibg=#181818   guifg=#996228
highlight SLBackground guibg=#181818   guifg=#996228
highlight SLFileType   guibg=indianred guifg=#663333
highlight SLBufNumber  guibg=SeaGreen  guifg=#003333
highlight SLLineNumber guibg=#80a0ff   guifg=#003366



"------------------- TAB LINE (TOP BAR) -------------------
" set showtabline=0 " Hide
" set showtabline=1 " Show
set showtabline=2   " Always show

" :hi TabLineSel  ctermfg=Red        ctermbg=Yellow     " Selected tab
" :hi TabLine     ctermfg=Blue       ctermbg=Yellow     " Non selected tab
" :hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen  " Empty space

:hi TabLineSel  ctermbg=#111111    ctermfg=#CCCCCC  " Selected tab
:hi TabLine     ctermbg=#333333    ctermfg=#CCCCCC  " Non selected tab
:hi TabLineFill ctermbg=LightGreen ctermfg=#CCCCCC  " Empty space

"----------------------------------------------------------------


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


function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

function! FileEnc()
  return &fileencoding ? &fileencoding : &encoding
endfunction


set laststatus=2                      " Show the status on the second to last line.

" LEFT PART
set statusline=                       " Clear
set statusline+=\ Line:\ %l\ Col:\ %c " Line and column
"set statusline+=\ %l:%c              " Line and column (compacted)
set statusline+=%#PmenuSel#           " Color for git status
set statusline+=%{StatuslineGit()}    " git status"
set statusline+=%#LineNr#             " Color for filename
set statusline+=\ %f                  " filename
set statusline+=%m\                   " Modified file flag [+]

set statusline+=%=                    " Left-right separator

" RIGHT PART
"set statusline+=\ %{FileEnc()}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
set statusline+=%#CursorColumn#
set statusline+=\ %Y\                  " Programming language (lowercase)
"----------------------------------------------------------------
```

https://shapeshed.com/vim-statuslines/
https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

## NeoVIM: `~/.vimrc`


```bash
sudo pacman -S neovim
```








# Set NTP time

```bash
sudo pacman -S ntp
sudo timedatectl set-ntp true
```


# Comunity configs/dotfiles

- [ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles)
- Savitar
  - https://www.youtube.com/watch?v=fshLf6u8B-w&t=3276s
  - https://s4vitar.github.io/bspwm-configuration-files/#
- Josean Martinez
  - Terminal https://www.youtube.com/watch?v=CF1tMjvHDRA

- https://github.com/rxyhn/dotfiles