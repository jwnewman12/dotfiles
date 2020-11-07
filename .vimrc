set ffs=unix
set nocompatible
set nobackup
set noswapfile

colorscheme darkblue
syntax on

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set number
set ruler
set cursorline

set colorcolumn=101
highlight ColorColumn ctermbg=cyan

set list listchars=eol:¬,space:·,tab:»·

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

if &diff
  colorscheme evening
endif

map q <Nop>
nmap <F1> <Esc>
imap <F1> <Esc>

