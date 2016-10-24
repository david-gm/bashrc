set background=dark
set number

" searching
set wrapscan    " searching continous at the beginning of file after eof has been reached
set hlsearch    " enables highlighted search by default
" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>
