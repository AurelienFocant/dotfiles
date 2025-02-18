return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			vim.opt.termguicolors = true
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
					group_empty = true,
				},
				filters = {
					dotfiles = true,
					git_ignored = false,
				},
			})
		end
	}
}
