-- lua_post_source {{{
local theme = require('lualine.themes.base16')
theme.command.b.fg = vim.g.base16_gui04
theme.command.c.fg = vim.g.base16_gui03
theme.insert.b.fg = vim.g.base16_gui04
theme.replace.b.fg = vim.g.base16_gui04
theme.visual.b.fg = vim.g.base16_gui04

local function bufnr(tabnr)
  local buflist = vim.fn.tabpagebuflist(tabnr)
  local winnr = vim.fn.tabpagewinnr(tabnr)
  return buflist[winnr]
end

local function quickfix_title()
  local wininfo = vim.fn.getwininfo(vim.fn.win_getid())
  return wininfo[1].variables.quickfix_title
end

local function fugitive()
  if not vim.fn.expand('%'):match('^fugitive://') then
    return nil, nil
  end

  local result = vim.fn.FugitiveParse(vim.fn.expand('%'))
  local object, git_dir = result[1], result[2]
  if object == ':' then
    return nil, nil
  end

  return object:match(':?(.+):(.+)')
end

local function filename()
  if vim.bo.filetype == 'dirvish' then
    return vim.fn.expand('%:~:h:t') .. '/'
  end

  if vim.bo.filetype == 'qf' then
    local title = quickfix_title()
    if title:sub(1, 1) ~= ':' then
      return title
    end
  end

  local commit, filename = fugitive()
  if commit and filename then
    return vim.fn.fnamemodify(filename, ':t') .. ' | ' .. commit:sub(1, 8)
  end

  local readonly = vim.bo.readonly and vim.bo.filetype ~= 'help' and 'RO ' or ''
  local filename = vim.fn.expand('%:t')
  if filename == '' then
    filename = '[No Name]'
  end

  return readonly .. filename
end

local function fileencoding()
  return vim.bo.fileencoding or vim.bo.encoding
end

local function fileformat()
  local fileformats = vim.opt.fileformats:get()
  return vim.bo.fileformat ~= fileformats[1] and vim.bo.fileformat or ''
end

local function filetype()
  return vim.bo.filetype ~= '' and vim.bo.filetype or 'no ft'
end

local function charcode()
  local hex = vim.fn.strgetchar(vim.fn.getline('.'):sub(vim.fn.col('.')), 0)
  if hex < 0 then
    return ''
  end

  if hex < 0x10000 then
    return string.format('U+%X', hex)
  else
    local hi = (hex - 0x10000) / 0x400 + 0xd800
    local lo = (hex - 0x10000) % 0x400 + 0xdc00
    return string.format('U+%X (U+%X U+%X)', hex, hi, lo)
  end
end

local function path()
  if vim.bo.filetype == 'dirvish' then
    return vim.fn.expand('%:~:h')
  end

  if vim.bo.filetype == 'qf' then
    local title = quickfix_title()
    if title:sub(1, 1) == ':' then
      return title:sub(2)
    end
  end

  local commit, filename = fugitive()
  if commit and filename then
    return vim.fn.fnamemodify(filename, ':~:h')
  end

  return vim.fn.expand('%:~:h')
end

local function modified()
  return vim.bo.modified and '+' or ''
end

local function noterminal()
  return vim.bo.buftype ~= 'terminal'
end

require('lualine').setup({
  options = {
    theme = theme,
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_a = {
      {
        'mode',
        cond = noterminal,
      },
      {
        'CapsLockStatusline',
        fmt = function(s)
          return s == '' and '' or 'CAPS'
        end,
      },
    },
    lualine_b = {
      {
        filename,
        cond = noterminal,
      },
      modified,
    },
    lualine_c = {
      {
        'diagnostics',
        sections = {
          'error',
          'warn',
          'info',
        },
        diagnostics_color = {
          error = 'DiagnosticSignError',
          warn = 'DiagnosticSignWarn',
          info = 'DiagnosticSignInfo',
        },
        symbols = {
          error = '✖  ',
          warn = '⚠  ',
          info = '⚑  ',
        },
        color = { bg = vim.g.base16_gui00 },
        update_in_insert = true,
      },
      path,
    },
    lualine_x = {
      {
        charcode,
        cond = noterminal,
      },
    },
    lualine_y = {
      fileencoding,
      fileformat,
    },
    lualine_z = {
      {
        filetype,
        cond = noterminal,
      },
    },
  },
  inactive_sections = {
    lualine_a = {
      {
        filename,
        cond = noterminal,
      },
      modified,
      {
        'diagnostics',
        sections = {
          'error',
          'warn',
          'info',
        },
        symbols = {
          error = '✖  ',
          warn = '⚠  ',
          info = '⚑  ',
        },
        colored = false,
      },
    },
    lualine_b = {
      path,
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
        mode = 2,
        max_length = vim.o.columns,
        fmt = function(name, context)
          local bufnr = bufnr(context.tabnr)

          if vim.bo[bufnr].filetype == 'dirvish' then
            return vim.fn.fnamemodify(vim.fn.bufname(bufnr), ':~:h:t') .. '/'
          end

          local modified = vim.bo[bufnr].modified and ' +' or ''
          return name .. modified
        end,
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
-- }}}
