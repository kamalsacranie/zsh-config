# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# Importing our plugin for 10k up here before any cosole I/O is performed
source $ZDOTDIR/themes/powerlevel10k/powerlevel10k.zsh-theme
# Configuring instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Configuring our PATH so we use the latest version of vim
export PATH="usr/local/share:$PATH"

# My aliases
alias ranger='ranger --choosedir=$HOME/.config/ranger/.lastdir; LASTDIR=`cat $HOME/.config/ranger/.lastdir`; cd "$LASTDIR";'
alias ls='ls -a'
alias vsc='open -a "Visual Studio Code"'
alias bwgen='bw generate -luns 16 | pbcopy'

# Calling neofetch
# neofetch

# Turning off error bells
unsetopt BEEP


# Environemntal variables
export VIMINIT="source $HOME/.config/vim/.vimrc"


# Changing keybindings to vim
bindkey -v

# ========= Plugins =========
source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# must be last because reasons
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh


# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
