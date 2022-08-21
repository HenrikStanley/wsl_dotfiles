#!/bin/zsh

# Sourcing applications / scripts into the shell environment

# Loads FZF keybindings, replacing native reverse search etc with FZF
[[ -e "/usr/share/fzf/key-bindings.zsh" ]] \
  && source "/usr/share/fzf/key-bindings.zsh"

# Load Zoxide
eval "$(zoxide init zsh --cmd j --no-aliases)"

# Setup Node Version Manager
export NVM_DIR="$XDG_CONFIG_HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setup thefuck and change alias to fuck
eval $(thefuck --alias fuck)

# Use Starship prompt with znap eval cashing
# znap eval starship 'starship init zsh'
eval "$(starship init zsh)"

# Setup PyEnv
export PYENV_ROOT="$XDG_CONFIG_HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Set up lazy loading for Python-related completions:
## PyEnv
znap function _pyenv pyenv              'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

## pip
znap function _pip_completion pip       'eval "$( pip completion --zsh )"'
compctl -K    _pip_completion pip

## pipx
znap function _python_argcomplete pipx  'eval "$( register-python-argcomplete pipx )"'
complete -o nospace -o default -o bashdefault \
           -F _python_argcomplete pipx