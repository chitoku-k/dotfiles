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

    if vim.lsp.document_color ~= nil then
      vim.lsp.document_color.enable(true, args.buf, { style = '●' })
    end
  end,
})
