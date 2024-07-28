# vim-ollama

Run Ollama on Vim with `:Ollama`.

# Installation

Install Ollama and pull the model which you want to use.

https://github.com/ollama/ollama

For linux,

```sh
$ curl -fsSL https://ollama.com/install.sh | sh
$ ollama pull gemma:2b
```

Add the following to your `~/.vimrc` or `~/.config/nvim/init.vim`.

```vim
" for vim-plug
Plug 'ryicoh/vim-ollama'
```

# Usage

```vim
:Ollama What is Vim?
> Vim is a powerful command-line editor (IDE) for Unix and Windows operating systems. It is commonly used by developers, programmers, and
 system administrators for editing and manipulating code, scripts, and text files.
```

In insert mode, the output is written to the current buffer.

```vim
<C-r>=ollama#run("Explain about Ollama")
```

# Configuration

Change a model.

```vim
let g:ollama_model = "mistral:7b"
```
