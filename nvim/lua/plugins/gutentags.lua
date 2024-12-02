local HOME = os.getenv("HOME")

local PWD = os.getenv("PWD")

-- WRITE a bash script to check if not in the list of forbidden directories or a subdirectory
--os.execute(
--'if [ -d .git ] && mkdir -p "misc"'
--)


vim.g.gutentags_ctags_tagfile = "misc/tags"

vim.g.gutentags_exclude_project_root = {'/usr/local', '/opt/homebrew', '/home/linuxbrew/.linuxbrew', HOME .. '/dotfiles'}
