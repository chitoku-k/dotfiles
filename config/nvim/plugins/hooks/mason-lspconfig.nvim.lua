-- lua_post_source {{{
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
local ensure_installed = {}
for k, v in pairs(clients) do
  if executable[v.install_if] == nil then
    executable[v.install_if] = vim.fn.executable(v.install_if) == 1
  end

  if executable[v.install_if] then
    table.insert(ensure_installed, k)
  end
end

require('mason-lspconfig').setup({
  ensure_installed = ensure_installed,
})
-- }}}
