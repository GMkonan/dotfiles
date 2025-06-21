return {
  "olimorris/codecompanion.nvim",
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
        -- adapter = "copilot",
        model = "claude-3-7-sonnet",
        start_in_insert_mode = true,
      },
    },
    opts = {
      log_level = "DEBUG",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",              -- Optional: for completion
    "nvim-telescope/telescope.nvim", -- Optional: for actions
    "stevearc/dressing.nvim"         -- Optional: for UI improvements
  },
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionActions<cr>",     desc = "CodeCompanion Actions" },
    { "<leader>ct", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion" },
    -- { "<leader>cc", "<cmd>CodeCompanionAdd<cr>",     desc = "Add CodeCompanion" },
  },

  -- consider https://modelcontextprotocol.io/introduction
  -- https://codecompanion.olimorris.dev/
}
