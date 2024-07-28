let s:cpo_save = &cpo
set cpo&vim

let s:cmd = {
\   'cmdPath': get(g:, 'ollama_cmd_path', 'ollama'),
\   'cmdArgs': get(g:, 'ollama_cmd_args', []),
\   'model': get(g:, 'ollama_model', 'gemma:2b'),
\ }

function! ollama#run(input) abort
  let l:input = [s:cmd.cmdPath]
  call extend(l:input, s:cmd.cmdArgs)

  let l:input += [
  \   'run',
  \   s:cmd.model,
  \   shellescape(a:input),
  \ ]

  let l:output = system(join(l:input, ' '))

  return s:skip_terminal_code(l:output)
endfunction

function! s:skip_terminal_code(input) abort
  let l:output = ''

  let l:skip = 0
  for l:char in split(a:input, '\zs')
    if l:char ==# "⠙"
      let l:skip = 2
      continue
    endif

    if l:char ==# ""
      let l:skip = 5
      continue
    endif

    if l:skip
      let l:skip -= 1
      continue
    endif

    let l:output .= l:char
  endfor

  return l:output
endfunction

