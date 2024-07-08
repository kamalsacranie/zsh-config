export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.local/share/zsh/history"
export HISTDUP=erase
setopt SHARE_HISTORY            # Share history across all sessions
setopt INC_APPEND_HISTORY       # Add commands to the history file immediately
setopt HIST_IGNORE_DUPS         # Ignore duplicate commands in the history
setopt HIST_FIND_NO_DUPS        # Do not display duplicates in the history search
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY
