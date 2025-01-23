-- Toggle diagnostics
vim.keymap.set("n", "<leader>de", function()
	if vim.diagnostic.is_enabled(nil) then
		vim.diagnostic.enable(false)
	else
		vim.diagnostic.enable(true)
	end
end)
