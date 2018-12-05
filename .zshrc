# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#export ZSH=/Users/cdunda/.oh-my-zsh
setopt AUTO_CD
cdpath=(/Users/cdunda/Desktop)

source "$HOME/.antigen/antigen.zsh"
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme Granze/G-zsh-theme-2 granze2
#antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Bundles for zsh autocompletions
antigen bundle zsh-users/zsh-completions

##

alias tf="terraform"

export PATH="/Users/cdunda/.rvm/gems/ruby-2.2.5/bin:/Users/cdunda/.rvm/gems/ruby-2.2.5@global/bin:/Users/cdunda/.rvm/rubies/ruby-2.2.5/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/clojure:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Users/cdunda/.rvm/bin"

alias vi='/usr/local/bin/nvim'

# 2u Vault
export VAULT_ADDR=https://vault.prod.2u.com:8200/
export VAULT_CACERT=$HOME/.certs/vault-ca.pem

# GO
export GOPATH=$HOME/Desktop/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN:$GOPATH

# pyenv
export PATH="/Users/cdunda/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#Pyflakes
export PATH=$PATH:$HOME/bin
export PATH="/usr/local/opt/openssl/bin:$PATH:$HOME"

source "$HOME/shell_functions/kc"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}


export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

autoload -U +X bashcompinit && bashcompinit
source /usr/local/bin/aws_zsh_completer.sh
complete -o nospace -C /usr/local/bin/vault vault

# GNU Utils
export PATH="/usr/local/Cellar/findutils/4.6.0/libexec/gnubin:$PATH"

# Support for DevTools
eval "$(devtools config)"
alias dte='eval "$(devtools config)"'
alias config='/usr/bin/git --git-dir=/Users/cdunda/.cfg/ --work-tree=/Users/cdunda'
