local HOME = os.getenv("HOME")
local TERM = os.getenv("TERM_PROGRAM")

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ff038f", bg = "NONE" })	-- Line Number Colors
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ff038f", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#ff038f", bg = "NONE" })

-- Rules for opening Windows
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.inccommand = "split"	-- Incremental results in Search and Replace
vim.opt.virtualedit = "block"	-- Visual Block can go anywhere

-- Tabs rules
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- FOLDS
vim.opt.foldmethod = "syntax"
--vim.wo.foldmethod = "expr"
--vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevelstart = 0 
vim.opt.foldnestmax = 1
vim.opt.foldcolumn = "1"
vim.api.nvim_set_hl(0, "Folded", {  bg = "NONE" })
vim.api.nvim_set_keymap("n", "<space>", "za", { noremap = true })

-- Add path and tags
vim.opt.tags:append("misc/tags")
vim.opt.path:append("include")

-- Set numbers in Help Pages
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "setlocal number relativenumber"
})

-- Open nvim-tree if no file is opened with vim cmd
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	command = 'if expand("%") == "" | NvimTreeToggle'
})

vim.g.user42 = "afocant"
vim.g.mail42 = "afocant@student.s19.be"