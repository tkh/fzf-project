function! fzfproject#autoroot#switchroot()
  if get(g:, "fzfSwitchProjectGitAutoRoot", 0) != 0
    if getbufinfo('%')[0]['listed'] && filereadable(@%)
      call fzfproject#autoroot#doroot()
    endif
  endif
endfunction

function! fzfproject#autoroot#doroot()
  let l:root = fnamemodify(FugitiveGitDir(), ":h")
  if isdirectory(l:root)
    execute 'lcd ' . l:root
  endif
endfunction
