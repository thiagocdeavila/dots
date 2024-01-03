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
    },
    config = function(_, opts)
      require('kanagawa').setup(opts)

      vim.cmd([[colorscheme kanagawa-dragon]])
    end,
  },
}

