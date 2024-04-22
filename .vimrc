"""""""""""""""""""""""""
set number
set relativenumber
"""""""""""""""""""""""""

"""""""""""""""""""""""""
syntax on
set hlsearch
set smartindent
"""""""""""""""""""""""""

"""""""""""""""""""""""""
set mouse=a
"""""""""""""""""""""""""

"""""""""""""""""""""""""
set laststatus=2
set statusline=%F
"""""""""""""""""""""""""
"modifies color of matching brackets"
hi MatchParen cterm=bold ctermbg=none ctermfg=red
"""""""""""""""""""""""""

"""""""""""""""""""""""""
" modifies default settings of netrw "
let g:netrw_bufsettings = "noma nomod nu rnu nowrap ro nobl"
"""""""""""""""""""""""""

"""""""""""""""""""""""""
" set number for help files "
autocmd FileType help  setlocal number
autocmd FileType help  setlocal relativenumber
"""""""""""""""""""""""""
