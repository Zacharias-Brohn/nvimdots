function! neoformat#formatters#qml#enabled() abort
    return ['qmlformat']
endfunction

function! neoformat#formatters#qml#qmlformat() abort
    return {
        \ 'exe': '/usr/lib/qt6/bin/qmlformat',
		\ 'args': ['-t', '-n', '--objects-spacing', '--functions-spacing', '-i'],
		\ 'replace': 1,
        \ 'stderr': 1,
        \ 'stdin': 0
        \ }
endfunction
