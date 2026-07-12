require("config.lazy")

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.textwidth = 100
opt.colorcolumn = "100"
opt.mouse = "a"
opt.termguicolors = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.ignorecase = true
opt.smartcase = true
opt.clipboard = "unnamedplus"
opt.updatetime = 300
opt.signcolumn = "yes"
opt.undofile = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true
  end,
})

vim.cmd('colorscheme hyper')
vim.cmd('colorscheme hyper')

-- Keymaps
local map = vim.keymap.set
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gr', vim.lsp.buf.references)
map('n', 'K', vim.lsp.buf.hover)
map('n', '<leader>ca', vim.lsp.buf.code_action)
map('n', '<C-p>', ':Telescope find_files<CR>')
map('n', '<leader>rn', vim.lsp.buf.rename)

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "eslint", "lua_ls" },
})

if vim.lsp.config then
  vim.lsp.config("*", {
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  })
  -- Explicitly enable servers
  for _, server in ipairs({ "ts_ls", "eslint", "lua_ls" }) do
    pcall(vim.lsp.enable, server)
  end
else
  -- Fallback for older 0.10 versions
  local lspconfig = require('lspconfig')
  local caps = require('cmp_nvim_lsp').default_capabilities()
  lspconfig.ts_ls.setup({ capabilities = caps })
  lspconfig.eslint.setup({ capabilities = caps })
  lspconfig.lua_ls.setup({ capabilities = caps })
end

-- nvim-cmp Setup
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'buffer' } })
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }

    -- Get diagnostics for the current line
    local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })

    if #diagnostics > 0 then
      -- Display the first error message in the echo area (bottom bar)
      vim.api.nvim_echo({ { diagnostics[1].message, "ErrorMsg" } }, false, {})
    end
  end,
})

-- Treesitter Setup (Fixed Module path)
-- Note: Recent Treesitter uses 'nvim-treesitter.configs'
-- but if it's missing, we wrap it in a pcall to prevent startup crash
local status, ts = pcall(require, "nvim-treesitter.configs")
if status then
  ts.setup({
    ensure_installed = { "javascript", "typescript", "lua" },
    highlight = { enable = true },
  })
end

-- Conform (Formatting)
require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
  },
  format_on_save = { lsp_fallback = true },
})
