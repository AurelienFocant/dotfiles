-- Custom command for nvim-tree
vim.api.nvim_create_user_command(
  'L',
  "NvimTreeToggle",
  {bang = false}
)

-- Custom command for prototypes
vim.api.nvim_create_user_command(
  'P',
  "! ~/my_scripts/my_prototypes.sh",
  {bang = false}
)

---------------------------------------------------
-- TERMINAL Commands
-- Remap to escape terminal mode
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-N>", { noremap = true })

-- T command for vertical terminal
vim.api.nvim_create_user_command(
  'T',
  "botright vsplit term://zsh",
  {bang = false}
)

-- R command for horizontal terminal
vim.api.nvim_create_user_command(
  'R',
  "split term://zsh",
  {bang = false}
)

-- Automatic insert mode when entering a terminal
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "if &buftype == 'terminal' | :startinsert | endif"
})

-- Or only on new terminal:
--vim.api.nvim_create_autocmd("TermOpen", {
--	pattern = "*",
--	command = "startinsert"
--})
---------------------------------------------------

-- Set keymaps for Windows Navigation
function set_keymaps_all(new, old, noremap)
	vim.api.nvim_set_keymap("t", new, "<C-\\><C-N>" .. old, { noremap = noremap })
	vim.api.nvim_set_keymap("i", new, "<C-\\><C-N>" .. old, { noremap = noremap })
	vim.api.nvim_set_keymap("n", new, old, { noremap = noremap })
end

set_keymaps_all("<A-c>", "<C-w>c", true) -- Close
set_keymaps_all("<A-t>", "<C-w>t", true) -- Top
set_keymaps_all("<A-b>", "<C-w>b", true) -- Bottom
set_keymaps_all("<A-h>", "<C-w>h", true) -- Left
set_keymaps_all("<A-j>", "<C-w>j", true) -- Down
set_keymaps_all("<A-k>", "<C-w>k", true) -- Up
set_keymaps_all("<A-l>", "<C-w>l", true) -- Right
set_keymaps_all("<A-s>", "<C-w>s", true) -- Split
set_keymaps_all("<A-v>", "<C-w>v", true) -- Vertical Split
