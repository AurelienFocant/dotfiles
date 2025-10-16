local HOME = os.getenv("HOME")
local TERM = os.getenv("TERM_PROGRAM")

local vim = vim

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if (TERM == "WezTerm") then
	local status, err = pcall(vim.cmd, "colorscheme catpuccin-latte")
	if not status then
		print(err)
	end
else
	local status, err = pcall(vim.cmd, "colorscheme tokyonight-night")
	if not status then
		print(err)
	end
end

vim.opt.termguicolors = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ff038f", bg = "NONE" })	-- Line Number Colors
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ff038f", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#ff038f", bg = "NONE" })

-- Can lines wrap ?
vim.opt.wrap = false
-- Can undo with U live past file closing ?
vim.opt.undofile = false

-- Disable new lines under comment being commented as well
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ 'r', 'o' })
	end,
})

-- Rules for opening Windows
vim.opt.splitbelow = false
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
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = 'v:lua.vim.lsp.foldexpr()'
vim.opt.foldlevelstart = 0
vim.opt.foldcolumn = "1"
vim.api.nvim_set_hl(0, "Folded", {  bg = "NONE" })
vim.api.nvim_set_keymap("n", "<space>", "za", { noremap = true })
vim.wo.foldnestmax = 1

function closeOnlyLevel1Folds()
	vim.cmd("normal! gg")		-- go to top of file
	vim.cmd("normal! zR")      	-- open all folds
	while vim.fn.line('.') < vim.fn.line('$') do	-- while current line is not last line
		vim.cmd("normal! ]]")	-- go to next section
		vim.cmd("foldclose")	-- close that fold
	end							-- repeat
	vim.cmd("normal! gg")		-- go to top of file
end

-- Create autocmd with augroup to avoid duplicates
vim.api.nvim_create_augroup("MyFoldSettings", { clear = true })

-- Folding for OOP languages to be able to close Classes that are inside Classes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "java", "cpp" },
	group = "MyFoldSettings",
	callback = function()
		vim.wo.foldnestmax = 2
		vim.wo.foldlevel = 1         -- window-local foldlevel
		vim.opt.foldlevelstart = 1   -- global foldlevelstart

		vim.schedule(function()
			closeOnlyLevel1Folds()
		end)

		vim.keymap.set('n', 'zM', function()
			vim.cmd("normal! mf")
			closeOnlyLevel1Folds()
			vim.cmd("normal! 'f")
		end, { noremap = true, silent = true })
end,
})

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
