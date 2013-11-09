#! /usr/bin/python

"""Replace the default dotfiles in the home directory with symlinks
pointing to the ones found in ~/.system/dotfiles/ .  This may be used,
for example, to quickly install your prefered .bashrc, .profile,
.emacs.d/ or .emacs, .ssh, etc.  Thus, the only thing you have to
"remember" to bring with you to a new environment is .system.

"""

# Created September 17, 2012
# Author: Matt Walker
# License: GNU GPL v2 as published by the Free Software Foundation
# Version: 0.1
# 
# Should work with versions 2.7-3.2 of python, I believe.
#
# THIS FUCKING NEEDS TO BE TESTED!!!!!!!!

import subprocess
import shutil
import os
import filecmp
import importlib
#pydel = importlib.import_module("del")

HOME_DIRECTORY = os.path.expanduser("~/")
SYSTEM_DIRECTORY = os.path.join(HOME_DIRECTORY, ".system/")
DOTFILES_DIRECTORY = os.path.join(SYSTEM_DIRECTORY, "dotfiles/")

def list_files_in_dotfile_directory ():
    # Tested and seems to work
    """Return a list of the files in the ~/.system/dotfiles/
    directory, excluding files which end with the character "~" (emacs
    automatic backups) and those sandwiched by "#" characters (emacs
    autosaves).

    """

    return filter(lambda x: ((x[-1] != "~") and ((x[0] != "#") and
                                                 (x[-1] != "#"))),
                  os.listdir(DOTFILES_DIRECTORY))

def del_dotfile (dotfile_canonical_pathname):
    """Use del.py to delete the dotfile_canonical_pathname."""
    
    del_script_pathname = os.path.join(SYSTEM_DIRECTORY,
                                       "scripts/python/del.py")
    return_code = subprocess.call([del_script_pathname,
                                   dotfile_canonical_pathname])
    return return_code

def get_dotfile_canonical_basename (dotfile_basename):
    """Give a dotfile_basename an actual "." in front of it, if it
    needs it, and return it.

    """

    if (dotfile_basename[0] == "."):
        return dotfile_basename
    else:
        return ("." + dotfile_basename)
    
def main ():
    """Do all the work!"""
    
    for dotfile_basename in list_files_in_dotfile_directory():
        dotfile_canonical_basename = get_dotfile_canonical_basename(dotfile_basename)
        dotfile_system_pathname = os.path.join(DOTFILES_DIRECTORY, dotfile_basename)
        dotfile_canonical_pathname = os.path.join(HOME_DIRECTORY, dotfile_canonical_basename)
        if os.path.exists(dotfile_canonical_pathname):
            del_dotfile(dotfile_canonical_pathname)
        os.symlink(dotfile_system_pathname, dotfile_canonical_pathname)

if __name__ == "__main__":
    main()
