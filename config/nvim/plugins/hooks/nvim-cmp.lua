-- lua_post_source {{{
local cmp = require('cmp')
local compare = require('cmp.config.compare')
local types = require('cmp.types')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  sorting = {
    comparators = {
      function(a, b)
        if a:get_kind() == b:get_kind() then
          return nil
        end
        if a:get_kind() == types.lsp.CompletionItemKind.Snippet then
          return false
        end
        if b:get_kind() == types.lsp.CompletionItemKind.Snippet then
          return true
        end
      end,
      compare.offset,
      compare.exact,
      compare.score,
      compare.locality,
      compare.kind,
      compare.length,
      compare.order,
    },
  },
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.abort(),
    ['<C-x><C-n>'] = cmp.mapping.complete(),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  }),
  experimental = {
    ghost_text = true,
  },
})
-- }}}
