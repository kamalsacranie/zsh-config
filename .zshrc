# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Making backspace work proper
bindkey "^?" backward-delete-char

# My aliases
alias ranger='ranger --choosedir=$HOME/.config/ranger/.lastdir; LASTDIR=`cat $HOME/.config/ranger/.lastdir`; cd "$LASTDIR";'
alias ls='ls -AF1'
alias bwgen='bw generate -luns 16 | pbcopy; exit'
alias githome='cd $(git rev-parse --show-toplevel)'
# formating our gh repos to be listed normally and then grepped
alias ghrepolist="gh repo list --json url,name --template '{{range .}}{{tablerow .url}}{{end}}'"
# Papis export
alias papisexport="papis export --all --format bibtex > sources.bib"

# Turning off error bells
unsetopt BEEP

# Changing keybindings to vim
# bindkey -v

# ========= Plugins =========
# Powerline
source $ZDOTDIR/themes/powerlevel10k/powerlevel10k.zsh-theme
# Better vi mode
source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# Autocomplete
source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# must be last because reasons
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"


# Keeps our homebrew python in the path so that pyenv can see it
arch_name="$(uname -m)"
if [ "${arch_name}" = "x86_64" ]; then
    if [ "$(sysctl -in sysctl.proc_translated)" = "1" ]; then
        export PATH="/opt/homebrew/bin:$PATH"
        # Assigning our path based on what OS we are running. This was to make our python command run the lates python
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

# rust cargo path
export PATH="$CARGO_HOME/bin:$PATH"
# Adding our local user bin folder for my custom scripts
export PATH="$HOME/bin:$PATH"
# For pipx
export PATH="$HOME/.local/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ./.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


# Sorting out pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv init --path)"
fi

# Sourcing my functions
source $ZDOTDIR/functs.zsh

# registering our completions (no need for compinit because we have zsh autocomplete)
fpath+=/opt/homebrew/share/zsh/site-functions/
eval "$(register-python-argcomplete pipx)"
