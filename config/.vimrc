" Ali Rizvi's Vim Settings

set number
set shiftwidth=4

set incsearch
set hlsearch
set textwidth=80

" from lindes:
syntax on
hi Comment term=bold ctermfg=Cyan guifg=Cyan
set autoindent

" from benji fisher to turn on the matchit plugin automatically and more
filetype plugin on

" explicity map file extension .t to perl syntax instead of tads
" which is autodetected by filetype plugin on
" This line should always be after filetype plugin
autocmd BufNewFile,BufRead *.t set syntax=perl

" to show real tabs and spaces in file
set list
set listchars=tab:>-,trail:^,eol:$
"set listchars=tab:>-,trail:-

" evil, bad! -- hard tabs should be 8 chars... --lindes
" set tabstop=4
" _but_ we can use this:
set smarttab

"use arrow keys to move to previous and next buffers
nnoremap <s-Right>  :bn<CR>
nnoremap <s-Left>  :bp<CR>

"make the background light
set background=light

"show matching parens
set showmatch

"show row and column number
set ruler

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

filetype plugin indent on

"set shiftwidth to 2 for ruby only
autocmd FileType ruby setlocal  sw=2

"shortcuts inspired by http://weblog.jamisbuck.org/2008/11/17/vim-follow-up
"let mapleader = " "
"map n :execute 'NERDTreeToggle ' . getcwd()

let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70
map ft :FuzzyFinderTextMate
map fb :FuzzyFinderBuffer
map ff :FuzzyFinderFile =fnamemodify('**/x', ':p')
map fm :FuzzyFinderMruFile

command Ped :exec '!p4 edit %'
command Pad :exec '!p4 add %'

set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

colorscheme desert

"to add spaces instead of tabs
set expandtab

set tabstop=2
set shiftwidth=2
