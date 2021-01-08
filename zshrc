test -f "$HOME/.env" && . "$HOME/.env"
test -f "$HOME/.aliases" && . "$HOME/.aliases"

## Load NVM
#export NVM_DIR="$(realpath $HOME/.nvm)"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Linux antigen file
source $HOME/scripts/antigen.zsh

# Load the oh-my-zsh's library.
DISABLE_MAGIC_FUNCTIONS=true
antigen use oh-my-zsh
ZSH_TMUX_AUTOSTART=true

# Load the theme
THEME=denysdovhan/spaceship-prompt 
antigen list | grep $THEME; if [ $? -ne 0 ]; then antigen theme $THEME; fi
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle tmux
antigen bundle colored-man-pages
antigen bundle git
#antigen bundle heroku
antigen bundle pip
#antigen bundle lein
antigen bundle command-not-found
#antigen bundle autojump
#antigen bundle common-aliases
antigen bundle compleat
antigen bundle git-extras
#antigen bundle git-flow
antigen bundle paulirish/git-open
antigen bundle nvm
antigen bundle npm
antigen bundle web-search
#antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle safe-paste

# NVM bundle
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm
antigen bundle Sparragus/zsh-auto-nvm-use


# Tell Antigen that you're done.
antigen apply

# Remove underline from zsh-users/zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Setup zsh-autosuggestions
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Load custom aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

#Kubernetes Tools zsh completion start
autoload -U compaudit compinit bashcompinit
compaudit && compinit && bashcompinit
source /home/karlton/src/github.com/kubernetes-tools/completion/__completion
#Kubernetes Tools zsh completion end

