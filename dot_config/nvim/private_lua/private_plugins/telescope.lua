return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-telescope/telescope-file-browser.nvim',
    },
    keys = {
      {
        ';f',
        function() require('telescope.builtin').find_files({}) end,
        desc = 'Lists files in current directory',
      },
      {
        ';r',
        function() require('telescope.builtin').live_grep({}) end,
        desc = 'Search for a text in current directory',
      },
      {
        '\\\\',
        function() require('telescope.builtin').buffers({}) end,
        desc = 'Lists open buffers',
      },
      {
        ';t',
        function()
          local builtin = require('telescope.builtin')
          builtin.help_tags()
        end,
        desc = 'Lists available help tags',
      },
      {
        ';;',
        function()
          local builtin = require('telescope.builtin')
          builtin.resume()
        end,
        desc = 'Resume the previous telescope picker',
      },
      {
        ';e',
        function()
          local builtin = require('telescope.builtin')
          builtin.diagnostics()
        end,
        desc = 'Lists diagnostics for all open buffers or a specific buffer'
      },
      {
        ';s',
        function()
          local builtin = require('telescope.builtin')
          builtin.treesitter()
        end,
        desc = 'Lists function names, variables from Treesitter',
      },
      {
        'sf',
        function()
          local telescope = require('telescope')

          local function telescope_buffer_dir()
            return vim.fn.expand('%:p:h')
          end

          telescope.extensions.file_browser.file_browser({
            path = '%:p:h',
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = 'normal',
          })
        end,
        desc = 'Open File Browser',
      },
    },
    config = function(_, opts)
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local fb_actions = require('telescope').extensions.file_browser.actions

      opts.defaults = {
        wrap_results = true,
        prompt_prefix = '',
        layout_strategy = 'horizontal',
        layout_config = {
          prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
        winblend = 0,
        mappings = {
          n = {},
        },
      }

      opts.pickers = {
        diagnostics = {
          theme = 'ivy',
          initial_mode = 'normal',
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }

      opts.extensions = {
        file_browser = {
          theme = 'dropdown',
          hijack_netrw = true,
          mappings = {
            ['n'] = {
              ['c'] = fb_actions.create,
              ['h'] = fb_actions.goto_parent_dir,
              ['<PageUp>'] = actions.preview_scrolling_up,
              ['<PageDown>'] = actions.preview_scrolling_down,
            },
          },
        },
      }

      telescope.setup(opts)
      telescope.load_extension('file_browser')
    end,
  },
}
