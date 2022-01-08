" Copied from the following:
" (1) “How to get group name of highlighting under cursor in vim?”
" See: https://stackoverflow.com/a/37040415
" (2) “`synstack()` equivalent for extmarks-based highlighting?”
" See: https://neovim.discourse.group/t/synstack-equivalent-for-extmarks-based-highlighting/1373
function! SynGroup()
  let l:hl_groups = []
  let l:row = line('.')
  let l:col = col('.')

  let l:s = synID(l:row, l:col, 1)
  if l:s != 0
    let l:hl_groups += [synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')]
  endif

  if exists('*nvim_buf_get_extmarks')
    let l:namespaces = nvim_get_namespaces()
    for l:ns_id in values(l:namespaces)
      for l:extmark in nvim_buf_get_extmarks(0, l:ns_id, [l:row-1, l:col-1], [l:row-1, l:col-1], {'details': 1})
        let l:hl_groups += [l:extmark[3]['hl_group']]
      endfor
    endfor
  endif

  return l:hl_groups
endfun
