bindkey -v # Set vim-style mappings `viins`

bindkey "^?" backward-delete-char
bindkey "^P" up-line-or-beginning-search # up history search
bindkey "^N" down-line-or-beginning-search
bindkey -M vicmd v edit-command-line
bindkey -M vicmd -r :
