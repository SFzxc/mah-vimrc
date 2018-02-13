set shell=/bin/bash

syntax on

set number
set backspace=indent,eol,start                 " delete by backspace
set tabstop=2                                  " number of visual spaces per TAB
set tags=./tags;                               " Set tags directory
set autoindent                                 " Auto indention should be on
set nowrap
set wildmenu                                   " visual autocomplete for command menu
set lazyredraw

" Ruby hash syntax conversion
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-fugitive'
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-rails.git'
Plugin 'tomtom/tcomment_vim'
Plugin 'tomasr/molokai'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'janko-m/vim-test'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-dispatch'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()
filetype plugin indent on

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show trailing whitespace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Auto remove trailing whitespace and spaces when save
autocmd BufWritePre *.rb %s/\s\+$//e

" My leader key
let mapleader=","

" Searching
set hlsearch

set incsearch

set smartcase

set laststatus=2

" Tap completion
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
map <leader>p :bp<CR> " ,p previous buffer
map <leader>n :bn<CR> " ,n next buffer
map <leader>d :bd<CR> " ,d delete buffer
map <Leader>c :call <CR>
nmap <silent> <leader>c :TestFile<CR>
nmap <silent> <leader>s :TestNearest<CR>
map <leader>t :A<CR> " \t to jump to test file
map <leader>r :r<cr> " \t to jump to related file

" Don't be a noob, join the no arrows key movement
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Removing escape
ino jj <esc>
cno jj <c-c>
vno v <esc>

" Opens and closes Nerdtree with ,q
map <leader>q :NERDTreeToggle<CR>

" Every copy and paste will interact with system cliboard
set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif
