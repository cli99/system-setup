# cache fasd init code
fasd_cache="$HOME/.fasd-init-zsh"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
  echo "Creating a zgen save"

  # specify plugins here
  zgen oh-my-zsh

  # bulk load
  zgen loadall <<EOPLUGINS
      zsh-users/zsh-history-substring-search
      zsh-users/zsh-syntax-highlighting
EOPLUGINS
  # ^ can't indent this EOPLUGINS

  # completions
  zgen load zsh-users/zsh-completions src

  # theme
  zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
  
  # generate the init script from plugins above
  zgen save
fi

#ZSH_THEME="bullet-train"
BULLETTRAIN_TIME_SHOW=false
BULLETTRAIN_GO_SHOW=true
#BULLETTRAIN_NVM_SHOW=true
BULLETTRAIN_RUBY_SHOW=false
BULLETTRAIN_PROMPT_ORDER=(
  dir
  go
  git
  time
)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source $HOME/.aliases

# Env vars shared by Bash and Zsh
source "$HOME/.env"

# swagger auto-completion
# add auto-completion directory to zsh's fpath
fpath=($HOME/.zsh/completion $fpath)
# compsys initiatlization
autoload -U compinit
compinit

[[ -s "/Users/chengli/.gvm/scripts/gvm" ]] && source "/Users/chengli/.gvm/scripts/gvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
