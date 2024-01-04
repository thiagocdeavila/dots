return {
  {
    'rebelot/kanagawa.nvim',
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
              bg_pi = 'none',
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme

        return {
          NormalFloat = { bg = theme.ui.bg_p1 },
          FloatBorder = { bg = theme.ui.bg_p1 },
          FloatTitle = { bg = theme.ui.bg_p1 },

          CursorLineNr = { fg = colors.palette.sakuraPink },
          CursorLine = { bg = theme.ui.bg_p1 },

          Visual = { bg = theme.ui.bg_p2 },

          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          LazyNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          MasonNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Telescope
          TelescopeMatching = { fg = theme.ui.special },
          TelescopeSelection = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1, bold = true },
          TelescopeSelectionCaret = { fg = theme.ui.fg },
          TelescopePromptPrefix = { bg = theme.ui.bg },
          TelescopePromptNormal = { bg = theme.ui.bg },
          TelescopeResultsNormal = { bg = theme.ui.p1 },
          TelescopePreviewNormal = { bg = theme.ui.p1 },
          TelescopePromptBorder = { bg = 'none', fg = theme.ui.bg_p1 },
          TelescopeResultsBorder = { bg = 'none', fg = theme.ui.bg_p1 },
          TelescopePreviewBorder = { bg = 'none', fg = theme.ui.bg_p1},
          TelescopePromptTitle = { bg = theme.ui.special, fg = theme.ui.bg_p1 },
          TelescopeResultsTitle = { fg = theme.ui.special },
          TelescopePreviewTitle = { bg = theme.ui.bg_visual, fg = theme.ui.bg_m3 },

          -- Popup
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = 'none', bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end
    },
    config = function(_, opts)
      require('kanagawa').setup(opts)

      vim.cmd([[colorscheme kanagawa-dragon]])
    end,
  },
}

