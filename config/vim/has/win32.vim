if executable('pwsh')
  let &shell = substitute(expand('$USERPROFILE'), '\', '/', 'g') . '/scoop/apps/powershell/current/pwsh.exe -NoLogo'
  let &shellcmdflag = '-NoProfile -NoLogo -NonInteractive -Command'
  let &shellquote = ''
  let &shellxquote = ''
endif
