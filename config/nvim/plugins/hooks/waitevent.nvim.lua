-- lua_post_source {{{
vim.env.GIT_EDITOR = require('waitevent').editor({
  open = function(ctx, path)
    vim.cmd.split(path)
    ctx.lcd()
    vim.bo.bufhidden = 'wipe'
  end,
})

vim.env.EDITOR = require('waitevent').editor({
  done_events = {},
  cancel_events = {},
})
-- }}}
