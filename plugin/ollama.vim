if exists("loaded_vim_ollama")
    finish
endif

let loaded_vim_ollama = 1

command! -nargs=1 Ollama echo ollama#run(<q-args>)
