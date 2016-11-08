" vim:foldmethod=marker
" general settings "{{{
set background=dark
set number
set expandtab       " tabs are spaces
set tabstop=4		" number of spaces for tab
set shiftwidth=4	" change existing tabs if present in file to spaces

"}}}

" vundle settings {{{

set nocompatible              " be iMproved, required
filetype off                  " required
set laststatus=2
"}}}

" vundle plugins {{{ 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" gplugin it wrapper 
Plugin 'tpope/vim-fugitive'	

" plugin vim orgmode
Plugin 'https://github.com/jceb/vim-orgmode.git'

" for vim dates, needed by vim orgmode
Plugin 'https://github.com/tpope/vim-speeddating.git'

" for json files
Plugin 'elzr/vim-json'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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
" Put your non-Plugin stuff after this line
"}}}

" vim-json plugin {{{
let g:vim_json_syntax_conceal = 0
autocmd BufNewFile,BufRead *.gsi setlocal filetype=json
"}}}

" searching "{{{
set wrapscan    " searching continous at the beginning of file after eof has been reached
set hlsearch    " enables highlighted search by default
" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>
"}}}

" vim orgmode settings "{{{
:let g:org_export_verbose=1
"}}}

" Spell Check "{{{

" :setlocal spell spelllang=de_at   " setlocal for local file only
" :setlocal spell spelllang=en_us

let b:myLang=0
let g:myLangList=["nospell","de_at","en_us"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap <silent> <F12> :call ToggleSpell()<CR>
"}}}
