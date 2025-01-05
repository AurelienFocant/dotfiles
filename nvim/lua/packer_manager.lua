local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	

	use 'folke/tokyonight.nvim' -- Tokoynight theme

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}

	use 'ludovicchabant/vim-gutentags' -- Tags

	use { "catppuccin/nvim", as = "catppuccin" }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use { 
		'nvim-treesitter/nvim-treesitter', -- TreeSitter
		run = ':TSUpdate'
	}

	use {
		"42Paris/42header"
	}

	use {
		"OXY2DEV/markview.nvim",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}

	-- use {
	-- 	"neovim/nvim-lspconfig"
	-- }
	--
	-- use {
	-- 	"williamboman/mason.nvim",
	-- 	requires = {
	-- 		"williamboman/mason-lspconfig.nvim"
	-- 	}
	-- }


	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
