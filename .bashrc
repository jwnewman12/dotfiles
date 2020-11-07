# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

export EDITOR="/usr/bin/vim"
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

# TODO: fix bashcomp with these (I had it before somewhere)
alias g="git"
alias v="vim"
alias y="yarn"
alias b="bazel"

alias virsh="virsh -c qemu:///system"

alias jsgrep="find . -not -path \".*/node_modules/*\" -not -path \"./.git/*\" -not -name \"yarn.lock\" -type f | xargs grep "
alias jssed="find . -not -path \".*/node_modules/*\" -not -path \"./.git/*\" -not -name \"yarn.lock\" -type f | xargs sed -i -e"

function commitsize() {
  total=0
  for blob in `git diff-tree -r -c -M -C --no-commit-id $1 | cut -d " " -f 4` ; do
    let total+=$(git cat-file -s $blob)
  done
  echo $total
}

function filesize() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh;
  else
    local arg=-sh;
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@";
  else
    du $arg .[^.]* ./*;
  fi;
}

function dataurl() {
  local mimeType=$(file -b --mime-type "$1");
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8";
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

function gzipratio() {
  local origsize=$(wc -c < "$1");
  local gzipsize=$(gzip -c "$1" | wc -c);
  local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
  printf "orig: %d bytes\n" "$origsize";
  printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
HISTSIZE=1000
HISTFILESIZE=2000

if [[ $- != *i* ]] ; then
  # Shell is non-interactive.  Be done now!
  return
fi

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
