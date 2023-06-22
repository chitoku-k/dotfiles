set linespace=4
set guifont=Consolas:h10
set guifontwide=Meiryo:h10,MS_Gothic:h10

if executable('pwsh')
  let &shell = substitute(expand('$USERPROFILE'), '\', '/', 'g') . '/scoop/apps/powershell/current/pwsh.exe -NoLogo'
  let &shellcmdflag = '-NoProfile -NoLogo -NonInteractive -Command'
  let &shellquote = ''
  let &shellxquote = ''
endif
