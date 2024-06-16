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
  formatting = {
    format = function(entry, vim_item)
      local detail = entry.completion_item.labelDetails and entry.completion_item.labelDetails.detail
      local description = entry.completion_item.labelDetails and entry.completion_item.labelDetails.description

      local menu = ''
      if detail then
        menu = menu .. detail
        if description then
          menu = menu .. ' ' .. description
        end
      elseif description then
        menu = menu .. description
      end

      vim_item.menu = menu:sub(1, vim.api.nvim_win_get_width(0) / 4)
      return vim_item
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
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  }),
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
