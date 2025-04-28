return {
  {
    'folke/zen-mode.nvim',
    dependencies = {
      'folke/twilight.nvim',
      'iamcco/markdown-preview.nvim',
      'preservim/vim-markdown',
      'godlygeek/tabular',
      'stephpy/vim-yaml',
      'jbyuki/nabla.nvim',
    },
    config = function()
      -- Configure zen-mode
      require("zen-mode").setup({
        window = {
          backdrop = 1,
          width = 80,
          options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false,
            foldcolumn = "0",
            list = false,
          },
        },
        plugins = {
          options = {
            enabled = true,
            ruler = false,
            showcmd = false,
          },
          twilight = { enabled = false },
          gitsigns = { enabled = false },
        },
      })

      -- Markdown Preview configuration
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_browser = ""
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = { fleqn = false },
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = 'middle',
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
        toc = {}
      }

      -- Markdown configuration
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_strikethrough = 1
      vim.g.vim_markdown_new_list_item_indent = 2

      -- Create markdown settings group
      local markdown_group = vim.api.nvim_create_augroup("MarkdownSettings", { clear = true })

      -- Add markdown-specific settings
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        group = markdown_group,
        callback = function()
          -- Check if we're in the notes directory
          local current_file = vim.fn.expand('%:p')
          local in_notes = string.match(current_file, ".*notes/.*")

          -- Enable spell checking
          vim.opt_local.spell = true
          vim.opt_local.spelllang = "en_us"

          -- Set wrap and linebreak
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true

          -- Enable concealment
          vim.opt_local.conceallevel = 2

          -- Set textwidth
          vim.opt_local.textwidth = 80

          -- Automatically enter zen mode if in notes directory
          if in_notes then
            vim.cmd("ZenMode")
          end
        end,
      })

      -- Create NewNote command
      vim.api.nvim_create_user_command('NewNote', function(opts)
        local title = opts.args
        local filename = string.lower(title:gsub(" ", "-"))
        local path = "~/notes/" .. filename .. ".md"

        vim.cmd('edit ' .. path)

        local lines = {
          "---",
          "created: " .. os.date("%Y-%m-%d"),
          "type: zettel",
          "aliases: ",
          "tags:",
          "  - ",
          "status: draft",
          "references: ",
          "links: ",
          "---",
          "",
          "# " .. title,
          "",
          "## Main Idea",
          "",
          "## Context",
          "",
          "## Key Points",
          "",
          "## Related Concepts",
          "",
        }
        vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
      end, { nargs = '+' })

      -- Set up keymaps
      local keymap_opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>z', ':ZenMode<CR>', keymap_opts)
      vim.keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', keymap_opts)
      vim.keymap.set('n', '<leader>ms', ':MarkdownPreviewStop<CR>', keymap_opts)
      vim.keymap.set('n', '<leader>ml', 'o- [ ] ', keymap_opts)
      vim.keymap.set('n', '<leader>mk', 'o## ', keymap_opts)
      vim.keymap.set('n', '<leader>p', ':lua require("nabla").popup()<CR>', keymap_opts)

      -- Set up markdown highlighting
      vim.cmd([[
                highlight markdownBold gui=bold
                highlight markdownItalic gui=italic
                highlight markdownCode guifg=#89b4fa
                highlight markdownCodeBlock guifg=#89b4fa
            ]])
    end,
  }
}
