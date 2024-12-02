-- OPTIONS FOR Nvimtree --

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
		folders_first = false,
	},
	view = {
		width = 25,
		number = true,
		relativenumber = true,
	},
	renderer = {
		hidden_display = "simple",
	},
	filters = {
		dotfiles = true,
	},
})
