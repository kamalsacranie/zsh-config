# Configuring our PATH so we use the latest version of vim
export PATH="usr/local/share:$PATH"

# My aliases
alias ranger='ranger --choosedir=$HOME/.config/ranger/.lastdir; LASTDIR=`cat $HOME/.config/ranger/.lastdir`; cd "$LASTDIR";'
alias ls='ls -a'
alias bwgen='bw generate -luns 16 | pbcopy'


# Environemntal variables
export VIMINIT="source $HOME/.config/vim/.vimrc"


# Calling neofetch
neofetch

# Turning off error bells
unsetopt BEEP


# Changing keybindings to vim
bindkey -v


# ========= Plugins =========
# Starship config
fpath=( "$ZDOTDIR" $fpath )
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true

source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# must be last because reasons
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
