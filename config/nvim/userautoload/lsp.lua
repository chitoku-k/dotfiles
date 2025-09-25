local clients = {
  bashls = {
    install_if = 'bash',
  },
  clangd = {
    install_if = 'clangd',
  },
  cssls = {
    install_if = 'node',
  },
  gopls = {
    install_if = 'go',
  },
  graphql = {
    install_if = 'node',
  },
  intelephense = {
    install_if = 'php',
  },
  java_language_server = {
    install_if = 'mvn',
  },
  jsonls = {
    install_if = 'node',
  },
  powershell_es = {
    install_if = 'pwsh',
  },
  purescriptls = {
    install_if = 'node',
  },
  rust_analyzer = {
    install_if = 'rustc',
  },
  ts_ls = {
    install_if = 'node',
  },
  vuels = {
    install_if = 'node',
  },
  yamlls = {
    install_if = 'node',
  },
}

local executable = {}
for k, v in pairs(clients) do
  if executable[v.install_if] == nil then
    executable[v.install_if] = vim.fn.executable(v.install_if) == 1
  end

  if executable[v.install_if] then
    vim.lsp.enable(k)
  end
end

local lsp_id = vim.api.nvim_create_augroup('lsp', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_id,
  callback = function(args)
    local opts = {
      buffer = args.buf,
    }
    vim.keymap.set('n', '<F1>', function()
      vim.lsp.buf.hover()
      vim.lsp.buf.document_highlight()
    end, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<F3>', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<F5>', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<F6>', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<F7>', vim.cmd.Inspect, opts)

    local lsp_id = vim.api.nvim_create_augroup('lsp-buf', { clear = false })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = lsp_id,
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
    vim.api.nvim_create_autocmd('DiagnosticChanged', {
      group = lsp_id,
      buffer = args.buf,
      callback = function()
        vim.diagnostic.setloclist({ open = false })
      end,
    })

    vim.lsp.document_color.enable(true, args.buf, { style = '●' })
  end,
})
