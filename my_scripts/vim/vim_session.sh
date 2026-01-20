#! /bin/bash

# [ -d misc ] && dir="misc" || dir="."
# vim -S $dir/Session.vim -c 'Le | Le'

[ -d ./misc/ ] && misc="./misc/"
nvim -S ${misc}Session.vim -c "NvimTreeToggle"
