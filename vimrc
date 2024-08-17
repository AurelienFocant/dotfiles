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
"remaps to manage windows with ALT key on macOS"
nnoremap è <C-w>h
nnoremap È <C-w>H
nnoremap ê <C-w>j
nnoremap Ê <C-w>J
nnoremap ë <C-w>k
nnoremap Ë <C-w>K
nnoremap ì <C-w>l
nnoremap Ì <C-w>L
nnoremap ÷ <C-w>w
nnoremap × <C-w>W
nnoremap ó <C-w>s
nnoremap ö <C-w>v
nnoremap ã <C-w>c
nnoremap ô <C-w>t
nnoremap â <C-w>b
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Custom commands for mksession and refreshing Le"
command Q mksession!|qa
command L 15Le
command K Le|Le
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Checks if there is a file open after Vim starts up,
" and if not, open Netrw as :Le
augroup InitNetrw
  autocmd!
  autocmd VimEnter * if expand("%") == "" | Le | endif
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set number for help files "
autocmd FileType help  setlocal number
autocmd FileType help  setlocal relativenumber
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
