local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"mbbill/undotree",
		init = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	{
		"tpope/vim-fugitive",
		init = function()
			vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
		end,
	},
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
			vim.api.nvim_set_keymap("n", "<C-_>", [[:CommentToggle<CR>]], { noremap = true, silent = true })
			vim.api.nvim_set_keymap("x", "<C-_>", [[:CommentToggle<CR>]], { noremap = true, silent = true })
		end,
	},
	{
		"luisiacc/gruvbox-baby",
		branch = "main",
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"VonHeikemen/lsp-zero.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"projekt0n/github-nvim-theme",
	"mhartington/formatter.nvim",
	"nvim-tree/nvim-tree.lua",
}, {})
