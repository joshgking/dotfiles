ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DEFAULT_USER="$(whoami)"

export EDITOR='mate -w'

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export N_PREFIX="$HOME/.n"
export PATH="$PATH:$N_PREFIX/bin"
