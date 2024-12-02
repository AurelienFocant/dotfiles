local HOME = os.getenv("HOME")

os.execute('mkdir -p "misc"')
vim.g.gutentags_ctags_tagfile = "misc/tags"

vim.g.gutentags_exclude_project_root = {'/usr/local', '/opt/homebrew', '/home/linuxbrew/.linuxbrew', HOME .. '/dotfiles'}
