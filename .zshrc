# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# === Searching previous command based on current typed command ===
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# ===

# === Enables editing command in an editor
autoload -z edit-command-line
zle -N edit-command-line
# ===

source "$ZDOTDIR/src/history.sh"
source $ZDOTDIR/src/mappings.sh

autoload -U compinit; compinit

# === Plugins ===
source $ZDOTDIR/themes/powerlevel10k/powerlevel10k.zsh-theme
# source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-t:toggle'
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# My aliases
alias ranger='ranger --choosedir=$HOME/.config/ranger/.lastdir; LASTDIR=`cat $HOME/.config/ranger/.lastdir`; cd "$LASTDIR";'
alias vi=nvim
alias ls='ls -AF1'
alias bwgen='bw generate -luns 16 | pbcopy; exit'
alias githome='cd $(git rev-parse --show-toplevel)'
# formating our gh repos to be listed normally and then grepped
alias ghrepolist="gh repo list --json url,name --template '{{range .}}{{tablerow .url}}{{end}}'"
# Papis export
alias papisexport="papis export --all --format bibtex > sources.bib"

# Turning off error bells
unsetopt BEEP

# Homebrew completions
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
# homebrew completions (connement out because done automatically by our zsh autocomplete???)
# if type brew &>/dev/null
# then
fpath+=/opt/homebrew/share/zsh/site-functions/
# fi
# pipx completions
if type pipx &>/dev/null
then
    eval "$(register-python-argcomplete pipx)"
fi

# === Ruby === for some reason this needs to be in RC and not zshenv?? so weird
export RBENV_ROOT=/opt/rbenv
export PATH=$RBENV_ROOT/shims:$PATH

export PATH=$VIRTUAL_ENV/bin:$PATH

eval "$(zoxide init --cmd cd zsh)"

# opam configuration
[[ ! -r /opt/opam/opam-init/init.zsh ]] || source /opt/opam/opam-init/init.zsh  > /dev/null 2> /dev/null
