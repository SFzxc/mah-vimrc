set shell=/bin/bash

syntax on

set number
set backspace=indent,eol,start          " delete by backspace
set tags=./tags;                        " Set tags directory

set autoread

" Show cmd normal
set showcmd

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" by default, the indent is 2 spaces.
set tabstop=2
set expandtab

" for html/rb files, 2 spaces
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" for go/js files, 4 spaces
" autocmd Filetype javascript ts=4 sw=4 sts=0 expandtab
autocmd BufNewFile,BufRead *.go setlocal expandtab tabstop=4 shiftwidth=4

" Display dot files
let NERDTreeShowHidden=1

set autoindent                          " Auto indention should be on
set nowrap
set wildmenu                            " visual autocomplete for command menu
set lazyredraw
set incsearch
set smartcase
set laststatus=2
set noshowmatch
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/* " Tap completion

" Toggle relative line number
nmap <C-L><C-L> :set invrelativenumber<CR>

" Off shit bell
set belloff=all

" Setting search
hi Search cterm=NONE
hi Search ctermbg=Grey
hi Search ctermfg=NONE
nnoremap <cr> :noh<CR><CR>:<backspace>
set hlsearch                            " Searching

" avoid mistyping commands
command! Bd bd
command! W w
command! Wq wq

let loaded_matchparen = 1

let Tlist_Ctags_Cmd='/location/ctags'
" Ruby hash syntax conversion
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'chr4/nginx.vim'
Plugin 'christoomey/vim-sort-motion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'garbas/vim-snipmate'
Plugin 'gmarik/vundle'
Plugin 'honza/vim-snippets'
Plugin 'janko-m/vim-test'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'tomlion/vim-solidity'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'christoomey/vim-system-copy'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'

call vundle#end()

filetype plugin indent on

" open NERDTree automatically when vim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeNodeDelimiter = "\u00a0"

" Auto remove trailing whitespace and spaces when save ruby files
autocmd BufWritePre *.rb %s/\s\+$//e 

" Leader key
let mapleader=","

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
map <Leader>c :call <CR>
map <leader>d :bd<CR> " ,d delete buffer
map <leader>n :bn<CR> " ,n next buffer
map <leader>p :bp<CR> " ,p previous buffer
map <leader>r :r<cr> " \t to jump to related file
map <leader>t :A<CR> " \t to jump to test file
nmap <silent> <leader>c :TestFile<CR>
nmap <silent> <leader>s :TestNearest<CR>

" Ctags
nnoremap <leader>. :CtrlPTag<cr>

" Don't be a noob, join the no arrows key movement
" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
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

" Close QuickFix Files List after selecting
autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>

" noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Removing escape
ino jj <esc>
cno jj <c-c>
vno v <esc>

" Opens and closes Nerdtree with ,q
map <leader>q :NERDTreeToggle<CR>

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
