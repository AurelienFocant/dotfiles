-- Source vimrc
vim.cmd('source ~/.vimrc') 

-- Theme setup
vim.opt.termguicolors = true
vim.g.tokyonight_style = "night"
vim.cmd[[colorscheme tokyonight]]

-- Line Number Colors
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ff038f", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ff038f", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#ff038f", bg = "NONE" })

vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.number = true         -- Show the current line number
