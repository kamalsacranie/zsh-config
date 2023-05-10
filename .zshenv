# === General shell environment variables and settings ===
export ZDOTDIR="$HOME/.config/zsh"
# Directory for my trash folder
export TRASHDIR=$HOME/.Trash
# Posix general directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
# Adding our local user bin folder for my custom scripts
export PATH="$HOME/bin:$PATH"

# Setting coloured list output
export CLICOLOR=1
# Specifying our default editors
export EDITOR=nvim
export VISUAL=nvim
# ===

# === Rust ===
export RUSTUP_HOME=/opt/rustup
export CARGO_HOME=/opt/cargo
# rust cargo path
export PATH=$CARGO_HOME/bin:$PATH
# ===

# === Homebrew ===
# Remove annoying homebrew notices
export HOMEBREW_NO_ENV_HINTS=true
# ===

# === Pyenv config to allow for switching versions ===
export PYENV_ROOT="/opt/pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
# Pipenv options
export PIPENV_VENV_IN_PROJECT=1
# For pipx
export PATH="$HOME/.local/bin:$PATH"
# ===

# === REPLS etc. ===
export PYTHONSTARTUP=$XDG_CONFIG_HOME/.pythonrc
export PTPYTHON_CONFIG_HOME=$XDG_CONFIG_HOME/ptpython/
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/.npmrc
# ===

# === Docker ===
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export MACHINE_STORAGE_PATH=$XDG_DATA_HOME/docker
export LIMA_HOME=$XDG_CONFIG_HOME/lima
export COLIMA_HOME=$XDG_CONFIG_HOME/colima
export DOCKER_HOST=unix:///$HOME/.colima/docker.sock
# ===

# === Flutter/dart ===
export PUB_CACHE=$XDG_CACHE_HOME
export ANALYZER_STATE_LOCATION_OVERRIDE="$XDG_DATA_HOME/dartServer"
# ===

# === Cocoapods ===
export CP_HOME_DIR=$XDG_CACHE_HOME/cocoapods

# CPP compilation flags
# export LDFLAGS="-L/opt/homebrew/opt/libxml2/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/libxml2/include"
