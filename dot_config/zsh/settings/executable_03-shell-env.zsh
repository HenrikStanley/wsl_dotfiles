#!/bin/zsh

# Setup the shell environment variables, paths etc.

# -U ensures each entry in these is Unique (that is, discards duplicates).
export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath  # -T creates a "tied" pair; see below.

# $PATH and $path (and also $FPATH and $fpath, etc.) are "tied" to each other.
# Modifying one will also modify the other.
# Note that each value in an array is expanded separately. Thus, we can use ~
# for $HOME in each $path entry.
path=(
    $path
    ~/.local/bin
)

# Add your functions to your $fpath, so you can autoload them.
fpath=(
    $ZDOTDIR/functions
    $fpath
    ~/.local/share/zsh/site-functions
)

# Set certificate path for AWS tools
export AWS_CA_BUNDLE=$HOME/certs/cacert.pem

# Set default editors
export KUBE_EDITOR="nvim"
export EDITOR="nvim"
export VISUAL="code"
export BROWSER="wslview"

# FZF settings
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# XDG Basedir settings
## Base dir settings for applications to use.
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

## PyEnv
export PYENV_ROOT=$XDG_DATA_HOME/pyenv

## Rust cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo

## Go
export GOPATH="$XDG_DATA_HOME"/go