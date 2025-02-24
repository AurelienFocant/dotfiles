vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	command = "set wrap"
})

-- Set keymaps for Quickfix List
vim.api.nvim_set_keymap("n", "[n", ":cnext <CR>", { noremap = noremap })
vim.api.nvim_set_keymap("n", "[o", ":cnext <CR>", { noremap = noremap })
vim.api.nvim_set_keymap("n", "[p", ":cprev <CR>", { noremap = noremap })

-- Toggle QFL
local function is_qf_window_open()
    return vim.iter(vim.api.nvim_list_wins()):any(function(winid)
        return vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(winid), "buftype") == "quickfix"
    end)
end

vim.keymap.set("n", "[w", function()
    vim.cmd(is_qf_window_open() and "cclose" or "copen | wincmd L")
end, { noremap = true, silent = true })
