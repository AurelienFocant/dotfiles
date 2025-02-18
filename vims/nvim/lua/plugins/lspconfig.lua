return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.diagnostic.enable(true)
			vim.opt.signcolumn = "yes"
		end,
	}
}
