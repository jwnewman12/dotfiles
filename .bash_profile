# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.

tabs -4

export EDITOR=/usr/bin/vim

export ANDROID_HOME=~/work/android-sdk
export ANDROID_SDK=$ANDROID_HOME
export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"

export PATH="$PATH:~/bin:$PYTHON_BIN_PATH:$ANDROID_HOME/platform-tools:~/.npm-global/bin:~/.yarn/bin:~/.config/yarn/global/node_modules/.bin"

[[ -f ~/.bashrc ]] && . ~/.bashrc

#if [ -z "${DISPLAY}" ] && [ $(tty) == /dev/tty6 ] ; then
#  startx &
#fi
