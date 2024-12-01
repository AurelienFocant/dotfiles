-- Custom command for nvim-tree
vim.api.nvim_create_user_command(
  'L',
  "NvimTreeToggle",
  {bang = false}
)
