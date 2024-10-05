"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber
set smartindent
syntax on
set mouse=a
set hlsearch
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
"	Custom commands to open terminals above or or the right
command R term
command T rightb vert ter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Look for tags file inm misc dir
set tags+=misc/tags
"Add include dir to path to jump to header files with gf
set path+=include
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Set tab sizes, expand or not to spaces
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set noexpandtab     " Don't expand tabs to spaces --> bloody norm!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Custom commands for refreshing Le
command K Le | Le

command L call OpenNetrw()
function! OpenNetrw()
	execute 'Le | vertical resize 23'
endfunction

"Custom command for mksession
command Q call SaveSession()
function! SaveSession()
    if isdirectory('misc')
        execute 'mksession! misc/Session.vim'
    else
        execute 'mksession! Session.vim'
    endif
    execute 'qa'
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=
set statusline+=\ %F
set statusline+=\ %m
set statusline+=\ %n
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Modifies color of matching brackets"
hi MatchParen cterm=bold ctermbg=none ctermfg=darkmagenta
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Modifies default settings of netrw "
let g:netrw_bufsettings = "noma nomod nu rnu nowrap ro nobl"
let g:netrw_winsize = 20
let g:netrw_liststyle= 3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Checks if there is a file open after Vim starts up,
" and if not, open Netrw as :Le
augroup InitNetrw
  autocmd!
  autocmd VimEnter * if expand("%") == "" | Le | vertical resize 22 | endif
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set numbers for help files
autocmd FileType help  setlocal number
autocmd FileType help  setlocal relativenumber
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
