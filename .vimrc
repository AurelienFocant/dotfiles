"""""""""""""""""""""""""
set number
set relativenumber
"""""""""""""""""""""""""

"""""""""""""""""""""""""
syntax on
set hlsearch
set smartindent
"""""""""""""""""""""""""
set foldmethod=syntax
set foldlevelstart=1 foldnestmax=1
highlight Folded ctermbg=none ctermfg=white
set foldcolumn=1
highlight FoldColumn ctermbg=none ctermfg=white
"""""""""""""""""""""""""

"""""""""""""""""""""""""
set mouse=a
"""""""""""""""""""""""""

"""""""""""""""""""""""""
set laststatus=2
set statusline=%F
"""""""""""""""""""""""""
"modifies color of matching brackets"
hi MatchParen cterm=bold ctermbg=none ctermfg=darkmagenta
"""""""""""""""""""""""""

"""""""""""""""""""""""""
" modifies default settings of netrw "
let g:netrw_bufsettings = "noma nomod nu rnu nowrap ro nobl"
let g:netrw_winsize = 35
"""""""""""""""""""""""""

"""""""""""""""""""""""""
" set number for help files "
autocmd FileType help  setlocal number
autocmd FileType help  setlocal relativenumber
"""""""""""""""""""""""""
