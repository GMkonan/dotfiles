-- Autoformat
-- conform

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    default_format_opts = { async = true, lsp_format = 'fallback' },
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },

      python = { 'isort', 'black' },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { 'rustfmt', lsp_format = 'fallback' },
      -- Conform will run the first available formatter
      -- javascript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
      typescript = { 'biome', 'ts_ls', 'prettierd', 'prettier', stop_after_first = true },
      -- javascriptreact = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { 'biome', 'ts_ls', 'prettierd', 'prettier', stop_after_first = true },
      html = { { 'biome', 'ts_ls', 'prettierd' } },
      javascript = { { 'biome', 'ts_ls', 'prettierd' } },
      javascriptreact = { { 'biome', 'ts_ls', 'prettierd' } },
      markdown = { { 'biome', 'ts_ls', 'prettierd' } },
      -- typescript = { { 'biome', 'ts_ls', 'prettierd' } },
      -- typescriptreact = { { 'biome', 'ts_ls', 'prettierd' } },
    },
    formatters = {
      biome = {
        command = 'biome',
      },
      -- prettierd = {
      --   condition = function()
      --     return vim.loop.fs_realpath '.prettierrc.js' ~= nil or vim.loop.fs_realpath '.prettierrc.mjs' ~= nil
      --   end,
      -- },
    },
  },
}
