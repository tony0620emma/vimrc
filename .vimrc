"====================================================================
" Start vundle
"====================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"===============================================================
" Write your plugins here
"===============================================================
Plugin 'vim-scripts/taglist.vim'

"====================================================================
" Run vundle
"====================================================================
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" minimal vimrc for new vim users to start with.
" Put your non-Plugin stuff after this line
"
" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
"
" Original Author:	     Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Modified by :          Ben McCormick
" Last change:	         2014 June 8
"
" To use it, copy it to
"  for Unix based systems (including OSX and Linux):  ~/.vimrc
"  for Windows :  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Set the color scheme as desert
color ron

" Set tab spaces
set tabstop=8

" hilight searched item
set hlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csto=1
  set cst
  set nocsverb
    
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  endif

set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>

" Map F2 to yank inner word into clipboard
" If the vim isn't support clipboard, install
" vim-gtk to patch it.
" To check if it's supported, using vim version 
" and grep clipboard
:map <F2> "+yiw 

" To copy/paste cross terminals
:set clipboard^=unnamed

" screen title
if &term == "screen"
	let &titlestring = "vim(" . expand("%:t") . ")"
	set t_ts=^[k
	set t_fs=^[\
	"set title
endif
autocmd TabEnter,WinEnter,BufReadPost,FileReadPost,BufNewFile * let &titlestring = 'vim(' . expand("%:t") . ')'

" Highlight column 80 to check for linux coding style
:set colorcolumn=80

" ============================================================
" TlistToggle settings
" ============================================================
" modify the default window size
let Tlist_WinWidth=40
