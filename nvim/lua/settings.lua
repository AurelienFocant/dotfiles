-- Source vimrc
--vim.cmd('source ~/.vimrc') 

-- Theme setup
vim.opt.termguicolors = true
vim.g.tokyonight_style = "night"
vim.cmd[[colorscheme tokyonight]]

-- Line Number Colors
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ff038f", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ff038f", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#ff038f", bg = "NONE" })

-- FOLDS
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 0 
vim.opt.foldnestmax = 1
vim.opt.foldcolumn = "1"
vim.api.nvim_set_keymap("n", "z", "za", { noremap = true })
vim.api.nvim_set_hl(0, "Folded", {  bg = "NONE" })
