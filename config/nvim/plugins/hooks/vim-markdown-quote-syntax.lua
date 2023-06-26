-- lua_add {{{
vim.g.is_bash = 1
vim.g.markdown_quote_syntax_on_filetypes = { 'liquid' }
vim.g.markdown_quote_syntax_filetypes = {
  apache = {
    start = [[apacheconf.*]],
  },
  c = {
    start = [[c.*]],
  },
  css = {
    start = [[css.*]],
  },
  diff = {
    start = [[diff.*]],
  },
  dosini = {
    start = [[ini.*]],
  },
  go = {
    start = [[go.*]],
  },
  graphql = {
    start = [[graphql.*]],
  },
  html = {
    start = [[html.*]],
  },
  make = {
    start = [[makefile.*]],
  },
  nginx = {
    start = [[nginx.*]],
  },
  javascript = {
    start = [[javascript.*]],
  },
  json = {
    start = [[json.*]],
  },
  rust = {
    start = [[rust.*]],
  },
  scss = {
    start = [[scss.*]],
  },
  sh = {
    start = [[\%(bash\|console\|sh\|shell\).*]],
  },
  toml = {
    start = [[toml.*]],
  },
  typescript = {
    start = [[typescript.*]],
  },
  xml = {
    start = [[xaml.*]],
  },
  yaml = {
    start = [[yaml.*]],
  },
}
-- }}}
