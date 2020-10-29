" Author: David Qian <dqian96@gmail.com>
" Description: Integration of pyfmt with ALE.

call ale#Set('python_pyfmt_executable', 'pyfmt')
call ale#Set('python_pyfmt_options', '')

function! ale#fixers#pyfmt#Fix(buffer) abort
    let l:executable = ale#Var(a:buffer, 'python_pyfmt_executable')
    let l:options = ale#Var(a:buffer, 'python_pyfmt_options')
    return {
    \   'command': ale#Escape(l:executable)
    \       . (empty(l:options) ? '' : ' ' . l:options)
    \       . ' %t',
    \   'read_temporary_file': 1,
    \}
endfunction
