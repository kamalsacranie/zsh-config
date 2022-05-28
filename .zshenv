export ZDOTDIR="$HOME/.config/zsh"
export EDITOR=nvim
export VISUAL=nvim
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/.npmrc
export PYTHONSTARTUP=$XDG_CONFIG_HOME/.pythonrc
export TRASHDIR=$HOME/.Trash
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
# =====Environemntal variables
# Setting vimrc directory
# export VIMINIT="source $HOME/.config/vim/.vimrc"
# Setting coloured list output
export CLICOLOR=1
# Rust varaibles (I use the homebrew dir because NPM does too)
export RUSTUP_HOME=/opt/rustup
export CARGO_HOME=/opt/cargo
# Remove annoying homebrew notices
export HOMEBREW_NO_ENV_HINTS=true
# Set default destination for Rprofile
# export R_PROFILE_USER="$XDG_CONFIG_HOME/r/.Rprofile"

# Pyenv config to allow for switching versions
export PYENV_ROOT="/opt/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# Pipenv options
export PIPENV_VENV_IN_PROJECT=1 # can be any value
