-- Custom command for nvim-tree
vim.api.nvim_create_user_command(
  'L',
  "NvimTreeToggle",
  {bang = false}
)

-- Remap to escape terminal mode
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-N>", { noremap = true })
