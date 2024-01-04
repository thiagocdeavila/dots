return {
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        theme = 'kanagawa',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
    },
  },
}
