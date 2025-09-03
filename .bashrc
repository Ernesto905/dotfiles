#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# =================================
# bashrc++ 
# =================================
if [[ -r ~/.bashrc_local ]]; then
  . ~/.bashrc_local
fi

if [[ -r ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

# =================================
# quality of life
# =================================
PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

set -o vi
export EDITOR=nvim 
export VISUAL=nvim

# =================================
# fzf
# =================================
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# fuzzy vim
fv() {
  local files
  mapfile -t files < <(locate -Ai -0 "$@" | grep -z -vE '~$' | fzf --read0 -0 -1 -m | tr '\0' '\n')

  if [[ ${#files[@]} -gt 0 ]]; then
    vim -- "${files[@]}"
    printf '%s\n' "${files[0]}"
  fi
}

# fuzzy cd 
fd() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# fuzzy manslaughter
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

