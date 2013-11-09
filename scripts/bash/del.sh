#! /bin/bash
# This program moves files to the trash, as opposed to using rm to permanently
# remove them and never get them back.

#options = getopt 

# default trash folder for gnome-based desktops.
default_trash=~/.local/share/Trash/files/

# if TRASH variable isn't set, set it equal to default_trash.
if [[ -n "$TRASH" ]]; then
    TRASH=default_trash
fi

# if TRASH directory doesn't exist, make it.
if [[ ! -d $TRASH ]]; then
    mkdir -p $TRASH
fi

mv -it $TRASH "$@"
