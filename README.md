## [sys-setup](https://cli99.github.io/syssetup/)

### Example .env

```
# programs by Homebrew will be used instead of system-provided ones
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# go
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export GODEBUG=cgocheck=0

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fasd
eval "$(fasd --init posix-alias zsh-hook)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# python
export PATH=/usr/local/opt/python/libexec/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PYTHONPATH=$GOPATH/src/github.com/tensorflow/models

# git
export GIT_AUTHOR_NAME="Cheng Li"
export GIT_AUTHOR_EMAIL="cli99@illinois.edu"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

# cuda
export PATH=/Developer/NVIDIA/CUDA-9.2/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-9.2/lib:/Developer/NVIDIA/CUDA-9.2/extras/CUPTI/lib:$DYLD_LIBRARY_PATH

# ml frameworks
export DYLD_LIBRARY_PATH=/opt/caffe/lib:/opt/libtorch/lib:/opt/mxnet/lib:$DYLD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/opt/tensorflow/lib
export LIBRARY_PATH=$DYLD_LIBRARY_PATH:/opt/tensorflow/lib

# custom
export PATH=$HOME/bin:$PATH
export PATH="/usr/local/opt/jpeg-turbo/bin:$PATH"
```

### Example .aliases

```
# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# go helpers
gocd() { cd `go list -f '{{.Dir}}' $1` }
deps() { go list -f '{{ join .Deps  "\n"}}' $1 }
imports() { go list -f '{{ join .Imports "\n" }}' $1 }

# rmate helper, create an ssh tunnel, e.g. rmate sshcarml
rmate() { ssh -R 52698:127.0.0.1:52698 `which $1 | awk -F " " '{print $NF}'`}

### fzf
# c - browse chrome history
c() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
    open=open
  else
    google_history="$HOME/.config/google-chrome/Default/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]lugin
bup() {
  local upd=$(brew leaves | fzf -m)

  if [[ $upd ]]; then
    for prog in $(echo $upd);
    do; brew upgrade $prog; done;
  fi
}

# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]lugin (e.g. uninstall)
bcp() {
  local uninst=$(brew leaves | fzf -m)

  if [[ $uninst ]]; then
    for prog in $(echo $uninst);
    do; brew uninstall $prog; done;
  fi
}
```
