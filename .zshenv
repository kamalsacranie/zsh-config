# === General shell environment variables and settings ===
export ZDOTDIR="$HOME/.config/zsh"
# Directory for my trash folder
export TRASHDIR=$HOME/.Trash
# Posix general directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_BIN_HOME=$HOME/.local/bin

# Setting coloured list output
export CLICOLOR=1
# Specifying our default editors
export EDITOR=nvim
export VISUAL=nvim
export PAGER=bat
# ===

# === Rust ===
export RUSTUP_HOME=/opt/rustup
export CARGO_HOME=/opt/cargo
# rust cargo path
export PATH=$CARGO_HOME/bin:$PATH
# ===

# === Haskell ===
export GHCUP_INSTALL_BASE_PREFIX=/opt/haskell
# Adding the latest haskell to our path so we can use ghc and ghci straight -- maybe look into using asdf for this but think it's unnecessary
export PATH=$GHCUP_INSTALL_BASE_PREFIX/.ghcup/ghc/$(/bin/ls -1v $GHCUP_INSTALL_BASE_PREFIX/.ghcup/ghc | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' | tail -n 1)/bin:$PATH
# Adding the executables for all the other versions
export PATH=$GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin:$PATH
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
export COLIMA_HOME=$XDG_CONFIG_HOME/colima
export DOCKER_HOST=unix:///$HOME/.colima/docker.sock
# ===

# === Flutter/dart ===
export PUB_CACHE=$XDG_CACHE_HOME
export ANALYZER_STATE_LOCATION_OVERRIDE="$XDG_DATA_HOME/dartServer"
# ===

# === Cocoapods ===
export CP_HOME_DIR=$XDG_CACHE_HOME/cocoapods

# === asdf: general purpose version manager ===
export ASDF_DIR=/opt/homebrew/opt/asdf/libexec
export ASDF_CONFIG_FILE=/Users/kamalsacranie/.config/asdf/.asdfrc
export ASDF_DATA_DIR=/Users/kamalsacranie/.local/share/asdf

# CPP compilation flags
# export LDFLAGS="-L/opt/homebrew/opt/libxml2/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/libxml2/include"

# MATLAB setup
export PATH=/Applications/MATLAB_R2023b.app/bin:$PATH

# === TeXLive Installation ===
# I keep this here for when we need to upgrade once a year
# The main TeXLive directory
# export TEXDIR=/opt/texlive/2024
# Directory for site-wide local files
export TEXMFLOCAL=/opt/texlive/2024/texmf-local
# Directory for variable and automatically generated data
export TEXMFSYSVAR=/opt/texlive/2024/texmf-var
# Directory for local config
export TEXMFSYSCONFIG=/opt/texlive/2024/texmf-config
# Directory for user-specific files
export TEXMFVAR=$XDG_DATA_HOME/texlive/texmf-var
# Directory for user-specific config files
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive
# Directory for user-specific files
export TEXMFHOME=/Users/kamalsacranie/.local/share/texlive/texmf
# === TeXLive ===
export MANPATH="/opt/texlive/2024/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/opt/texlive/2024/texmf-dist/doc/info:$INFOPATH"
export PATH="/opt/texlive/2024/bin/universal-darwin:$PATH"

# C Static location
export LIBRARY_PATH="/usr/lib"
export LIBRARY_PATH="/opt/personal/lib:$LIBRARY_PATH"
export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"

export PATH="/opt/personal/bin:$PATH"

# === Opam ===
export OPAMROOT=/opt/opam
