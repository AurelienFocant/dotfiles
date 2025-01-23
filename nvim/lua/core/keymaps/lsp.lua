-- Toggle diagnostics
vim.keymap.set("n", "<leader>dw", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)

local virt_txt = false
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "lua vim.diagnostic.config({ virtual_text = false, underline = false })"
})
vim.keymap.set("n", "<leader>de", function()
	if (virt_txt) then
		virt_txt = false
		vim.diagnostic.config({ virtual_text = false, underline = false })
	else
		virt_txt = true
		vim.diagnostic.config({ virtual_text = true, underline = true })
	end
end)
