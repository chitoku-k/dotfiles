vim.filetype.add({
  extension = {
    tag = 'html',
    tsx = 'typescript.tsx',
    xxhc = 'yaml',
    zunit = 'zsh',
  },
  filename = {
    monit = 'monitrc',
    spec = 'yaml',
  },
  pattern = {
    ['.*%.js%.snap'] = 'javascript',
    ['.*/%.bp/config.*'] = 'yaml',
    ['.*/%.kube/config'] = 'yaml',
    ['.*/jobs/.*/bin/.*'] = 'eruby.sh',
    ['.*/jobs/.*/templates/.*%.yml'] = 'eruby.yaml',
  },
})
