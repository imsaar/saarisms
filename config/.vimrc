" Ali Rizvi's Vim Settings

set number
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'rails.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()

set shiftwidth=2

set incsearch
set hlsearch
set textwidth=80

" from lindes:
syntax on
hi Comment term=bold ctermfg=Cyan guifg=Cyan
set autoindent

" from benji fisher to turn on the matchit plugin automatically and more
filetype plugin on
filetype plugin indent on

" explicity map file extension .t to perl syntax instead of tads
" which is autodetected by filetype plugin on
" This line should always be after filetype plugin
autocmd BufNewFile,BufRead *.t set syntax=perl

" to show real tabs and spaces in file
set list
set listchars=tab:>-,trail:^,eol:$
"set listchars=tab:>-,trail:-

"to add spaces instead of tabs
set expandtab

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

"use mouse
set mouse=a

"highlight the line with the cursors
set cursorline

" clipboard https://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
vnoremap <C-c> "*y

" https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
" set clipboard=unnamed

" https://www.sitepoint.com/effective-rails-development-vim/
" set tags=~/code/tags;
