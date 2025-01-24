return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.diagnostic.enable(false)
			vim.opt.signcolumn = "yes"
		end,
	}
}
