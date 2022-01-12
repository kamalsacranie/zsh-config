# Making backspace work proper
bindkey "^?" backward-delete-char

# My aliases
alias ranger='ranger --choosedir=$HOME/.config/ranger/.lastdir; LASTDIR=`cat $HOME/.config/ranger/.lastdir`; cd "$LASTDIR";'
alias ls='ls -A'
alias bwgen='bw generate -luns 16 | pbcopy'
alias githome='cd $(git rev-parse --show-toplevel)'

# Turning off error bells
unsetopt BEEP

# Changing keybindings to vim
# bindkey -v

# ========= Plugins =========
# Theme
fpath+=$ZDOTDIR/themes/pure
autoload -U promptinit; promptinit
prompt pure
# Better vi mode
source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# Autocomplete
source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# must be last because reasons
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

# Assigning our path based on what OS we are running
arch_name="$(uname -m)"
if [ "${arch_name}" = "x86_64" ]; then
    if [ "$(sysctl -in sysctl.proc_translated)" = "1" ]; then
        export PATH="/opt/homebrew/bin:$PATH"
        export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"
    else
        export PATH="/usr/local/share:$PATH"
    fi 
elif [ "${arch_name}" = "arm64" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"
else
    echo "Unknown architecture: ${arch_name}"
fi

export PATH="$HOME/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ./.fzf.zsh
