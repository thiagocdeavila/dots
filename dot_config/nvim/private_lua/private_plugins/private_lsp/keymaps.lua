local M = {}

function M.on_attach(_, bufnr)
  local function map(keys, func, opts)
    if opts.desc then
      opts.desc = '(LSP) ' .. opts.desc
    end

    vim.keymap.set(opts.mode or 'n', keys, func, { buffer = bufnr, desc = opts.desc })
  end

  -- Mappings
  map('<leader>cl', '<cmd>LspInfo<cr>', { desc = 'Info' })
  map('gd', function() require('telescope.builtin').lsp_definitions({ reuse_win = true }) end, { desc = 'Goto Definition' })
  map('gr', '<cmd>Telescope lsp_references<cr>', { desc = 'References' })
  map('gD', vim.lsp.buf.declaration, { desc = 'Goto Declaration' })
  map('gI', function() require('telescope.builtin').lsp_implementations({ reuse_win = true }) end, { desc = 'Goto Implementation' })
  map('gy', function() require('telescope.builtin').lsp_type_definitions({ reuse_win = true }) end, { desc = 'Goto Type Definition' })
  map('K', vim.lsp.buf.hover, { desc = 'Hover' })
  map('gK', vim.lsp.buf.signature_help, { desc = 'Signature Help' })
  map('<c-k>', vim.lsp.buf.signature_help, { mode = 'i', desc = 'Signature Help' })
  map('<leader>ca', vim.lsp.buf.code_action, { mode = { 'n', 'v' }, desc = 'Code Action' })
end

return M
