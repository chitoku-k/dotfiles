vim.filetype.add({
  extension = {
    iuml = 'plantuml',
    j2 = 'jinja',
    plantuml = 'plantuml',
    pu = 'plantuml',
    puml = 'plantuml',
    purs = 'purescript',
    tag = 'html',
    tsx = 'typescript.tsx',
    uml = 'plantuml',
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
