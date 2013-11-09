# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --ignore-backups'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='/bin/ls -alF --color=auto'
alias la='/bin/ls -A --color=auto'
alias l='/bin/ls -CF --color=auto'

# info aliases
#alias info='info --vi-keys'

# python aliases
alias python='ipython'

# ps aliases
alias pss='ps -A | grep'

# interactive aliases
alias mv='mv -i'
alias rm='rm -I'
alias cp='cp -i'

# root-required aliases

# system aliases
alias reboot='sudo reboot'

# apt aliases
alias aptstall='sudo apt-get install --install-recommends'
alias aptremove='sudo apt-get remove'
alias aptsource='sudo apt-get source'
alias aptlog='sudo apt-get changelog'
alias aptgrade='sudo apt-get update && sudo apt-get upgrade'
alias aptsearch='sudo apt-cache search'
alias aptclean='sudo apt-get autoremove && sudo apt-get autoclean'

# user aliases

# screen aliases
alias indep='screen -d -m'

# emacs aliases
alias emacs='indep emacs'
tmacs () {
    emacsclient "$@"
}

# lisp aliases
hyperspec () {
    if [ -e /usr/share/doc/hyperspec/Front/index.htm ]; then
	xdg-open /usr/share/doc/hyperspec/Front/index.htm >&/dev/null
    else
	echo 'Error: The Common Lisp Hyperspec is not installed on this computer!'
    fi
}
lisp () {
    sbcl --noinform --end-runtime-options --no-userinit --no-sysinit \
	 --load "$@" --quit --end-toplevel-options
}


# Raspberry Pi aliases.
raspi-connect () {
    if [ "$#" -eq 0 ]; then
	DEV="/dev/ttyUSB0"
    else
	DEV="$@"
    fi

    echo "Connecting to $DEV."
    sudo screen -e^Uu $DEV 115200
    echo "Disconnected."
}

# cd aliases
pushd() {
    if [ $# -eq 0 ]; then
	DIR="${HOME}"
    else
	DIR="$1"
    fi

    builtin pushd "${DIR}" > /dev/null
}

pushd_builtin() {
    builtin pushd > /dev/null
}

popd() {
    builtin popd > /dev/null
}

alias cd='pushd'
alias back='popd'
alias flip='pushd_builtin'
    
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
