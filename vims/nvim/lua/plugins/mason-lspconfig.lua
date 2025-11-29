return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"mason.nvim",
		},
		config = function()
			-- require("mason-lspconfig").setup()
			require("mason-lspconfig").setup({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function (server_name) -- default handler (optional)
					local capabilities = require("blink.cmp").get_lsp_capabilities()
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				-- == overrides defaults
				["rust_analyzer"] = function()
					require("rust-tools").setup({})
				end,
			})
		end,
	}
}
