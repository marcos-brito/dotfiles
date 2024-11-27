#!/bin/bash

# The Neovim server address (default: /tmp/nvim)
nvim_server="/tmp/nvim"

# Send the command to Neovim to change the colorscheme
nvim --server "$nvim_server" --remote-send ':silent Lazy reload nvim<CR>'
