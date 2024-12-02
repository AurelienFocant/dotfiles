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

-- Remaps for navigating windows with ALT
vim.api.nvim_set_keymap("t", "<A-h>", "<C-\\><C-N><C-w>h", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-j>", "<C-\\><C-N><C-w>j", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-k>", "<C-\\><C-N><C-w>k", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-l>", "<C-\\><C-N><C-w>l", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-h>", "<C-\\><C-N><C-w>h", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<C-\\><C-N><C-w>j", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<C-\\><C-N><C-w>k", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-l>", "<C-\\><C-N><C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", { noremap = true })
