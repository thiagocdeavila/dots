-- Config inspired by LazyVim source code
-- https://github.com/LazyVim/LazyVim

return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPost',
    dependencies = {
      {
        'folke/neoconf.nvim',
        cmd = 'Neoconf',
        config = false,
        dependencies = { 'nvim-lspconfig' },
      },
      { 'folke/neodev.nvim', opts = {} },
      'mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      },
      setup = {},
    },
    config = function(_, opts)
      require('neoconf').setup({})

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(args)
          local buffer = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          require('plugins.lsp.keymaps').on_attach(client, buffer)
        end,
      })

      local servers = opts.servers
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend(
          'force',
          { capabilities = vim.deepcopy(capabilities) },
          servers[server] or {}
        )

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup['*'] then
          if opts.setup['*'](server, server_opts) then
            return
          end
        end
        require('lspconfig')[server].setup(server_opts)
      end

      local mason = require('mason-lspconfig')
      local all_mason_servers = vim.tbl_keys(require('mason-lspconfig.mappings.server').lspconfig_to_package)

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.mason == false or not vim.tbl_contains(all_mason_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      mason.setup({ ensure_installed = ensure_installed, handlers = { setup } })
    end
  },

  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
    build = ':MasonUpdate',
    opts = {
      ensure_installed = {
        'stylua',
      },
    },
    config = function(_, opts)
      require('mason').setup(opts)
      local mr = require('mason-registry')

      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local package = mr.get_package(tool)
          if not package:is_installed() then
            package:install()
          end
        end
      end

      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
