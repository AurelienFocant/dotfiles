"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber
set smartindent
syntax on
set mouse=a
set hlsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax
set foldlevelstart=0 foldnestmax=1
highlight Folded ctermbg=none ctermfg=white
highlight FoldColumn ctermbg=none ctermfg=white
set foldcolumn=1
nnoremap <space> za
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags+=misc/tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=
set statusline+=\ %F
set statusline+=\ %m
set statusline+=\ %n
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"modifies color of matching brackets"
hi MatchParen cterm=bold ctermbg=none ctermfg=darkmagenta
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" modifies default settings of netrw "
let g:netrw_bufsettings = "noma nomod nu rnu nowrap ro nobl"
let g:netrw_winsize = 15
let g:netrw_liststyle= 3
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set number for help files "
autocmd FileType help  setlocal number
autocmd FileType help  setlocal relativenumber
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
