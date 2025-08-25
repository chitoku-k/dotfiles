-- lua_post_source {{{
local lspconfigs = {
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
    settings = {
      gopls = {
        ['ui.semanticTokens'] = true,
      },
    },
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
    settings = {
      yaml = {
        ['format.singleQuote'] = true,
        schemas = {
          ['http://json.schemastore.org/kustomization'] = {
            'kustomization.yaml',
          },
          ['https://raw.githubusercontent.com/cappyzawa/concourse-pipeline-jsonschema/master/concourse_jsonschema.json'] = {
            'pipeline.yml',
            'pipeline.yaml',
          },
          kubernetes = {
            '/*manifests*/**/*.yml',
            '/*manifests*/**/*.yaml',
            'kubectl-edit-*.yaml',
            '!kustomization.yaml',
          },
        },
      },
    },
  },
}

local function ensure_installed()
  local executable = {}
  local lspconfig = {}

  for k, v in pairs(lspconfigs) do
    if executable[v.install_if] == nil then
      executable[v.install_if] = vim.fn.executable(v.install_if) == 1
    end

    if executable[v.install_if] then
      table.insert(lspconfig, k)
    end
  end

  return lspconfig
end

local function on_attach(client, bufnr)
  local opts = {
    buffer = bufnr,
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

  local lsp_id = vim.api.nvim_create_augroup('lsp', { clear = false })
  vim.api.nvim_create_autocmd('CursorMoved', {
    group = lsp_id,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.clear_references()
    end,
  })
  vim.api.nvim_create_autocmd('DiagnosticChanged', {
    group = lsp_id,
    buffer = bufnr,
    callback = function()
      require('lualine').refresh()
      vim.diagnostic.setloclist({ open = false })
    end,
  })

  vim.lsp.document_color.enable(true, bufnr, { style = '●' })
end

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = ensure_installed(),
  handlers = {
    function(server)
      require('lspconfig')[server].setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = on_attach,
        settings = lspconfigs[server].settings,
      })
    end,
  },
})
-- }}}
