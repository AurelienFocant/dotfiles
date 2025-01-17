-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local terminal = os.getenv("TERM_PROGRAM")

require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		config = function()
			if (terminal == "iTerm.app") then
				vim.cmd.colorscheme("tokyonight-night")
			end
		end

	},
	{ 
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			if (terminal == "WezTerm") then
				vim.cmd.colorscheme("catppuccin-latte")
			end
		end
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	{
		"ludovicchabant/vim-gutentags",
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{
		"42Paris/42header",
	},
})
