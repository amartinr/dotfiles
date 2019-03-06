" Python specific settings (PEP8)
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

" run python scripts" run python scripts
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

let python_highlight_all=1
