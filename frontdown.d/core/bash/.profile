# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes the users more awesome System/bin if it exists
if [ -d "$HOME/.system/bin" ] ; then
    PATH="$HOME/.system/bin:$PATH"
fi

# set PATH so it includes /sbin, so I can use initctl(8)
if [ -d "/sbin" ] ; then
    PATH="/sbin:$PATH"
fi

# set PATH so it includes Oracle Java for Minecraft
if [ -d "$HOME/Downloads/jre1.7.0_11/bin" ] ; then
    PATH="$HOME/Downloads/jre1.7.0_11/bin:$PATH"
fi

# set GOPATH and PATH for go binaries, if it exists.
if [ -d "$HOME/Documents/src/matt/go" ] ; then
    export GOPATH="$HOME/Documents/src/matt/go:$GOPATH"
    PATH="$GOPATH/bin:$PATH"
fi

# set PYTHONPATH so that it includes my site-packages.
if [ -d "$HOME/src/site-packages/" ] ; then
    export PYTHONPATH="$HOME/src/site-packages:$PYTHONPATH"
fi

# my personal variables
export TRASH=$HOME/.local/share/Trash/files/
export EDITOR=emacsclient

# this is for building Android
export USE_CCACHE=1

# lzz options
export LZZ_OPTIONS='-I /usr/include'

export LANGUAGE="en_CA:en"
export LC_MESSAGES="en_CA.UTF-8"
export LC_CTYPE="en_CA.UTF-8"
export LC_COLLATE="en_CA.UTF-8"
