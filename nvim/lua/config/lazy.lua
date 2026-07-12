-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "williamboman/mason.nvim",          build = ":MasonUpdate" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
		{ "stevearc/conform.nvim" },
		{ "lewis6991/gitsigns.nvim" },
		{ "stevearc/dressing.nvim",           opts = {} },
		-- Navigation & UI
		{ "nvim-telescope/telescope.nvim",    dependencies = { "nvim-lua/plenary.nvim" } },
		{ 'vim-airline/vim-airline' },
		{ 'tpope/vim-fugitive' },
		{ 'github/copilot.vim' },
		{ 'bkad/CamelCaseMotion' },
		{ 'paulo-granthon/hyper.nvim' },
		{ 'duane9/nvim-rg' },
		-- AI Code Assistant
		{
			"coder/claudecode.nvim",
			dependencies = { "folke/snacks.nvim" },
			lazy = false,
			config = true,
			keys = {
				{ "<leader>a",  nil,                              desc = "AI/Claude Code" },
				{ "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
				{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
				{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
				{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
				{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
				{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
				{ "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
				{
					"<leader>as",
					"<cmd>ClaudeCodeTreeAdd<cr>",
					desc = "Add file",
					ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
				},
				-- Diff management
				{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
				{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
			},
		}
	},
	-- automatically check for plugin updates, and disable prompting to run on startup
	checker = { enabled = true },
})
