#! /usr/bin/python

# This script assumes that del.py is in
# $HOME/.system/scripts/python/del.py and has its executable bit set.

# TODO: [ ] logging
#       [ ] write a wrapper for os.listdir that includes in it's return
#           values the whole relative path goddamn it

#import logging
import os
#import shutil
import subprocess
import sys

version = "0.8"
DEFAULT_SCRIPTS_DIR = os.path.expanduser("~/.system/scripts")
DEFAULT_BIN_DIR = os.path.expanduser("~/.system/bin")

class Relinker(object):

    def __init__(self, scripts_dir=DEFAULT_SCRIPTS_DIR, \
                 bin_dir=DEFAULT_BIN_DIR):
        self.scripts_dir = scripts_dir
        self.bin_dir = bin_dir
        self.del_path = os.path.join(self.scripts_dir, "python/del.py")

    def delpy(self, filepath):
        """Use del.py on the file specified by filepath."""
        # TODO: [ ] handle exit status
        #       [ ] import del.py instead, and use it straight from python

        exit_status = subprocess.call([self.del_path, filepath])

    def clean_bin_dir(self):
        """Deletes all the symbolic links in self.bin_dir."""
        # TODO: [x] Make this safer [DONE]
        #             -- Made it only remove the symbolic links in self.bin_dir
        #       [x] Test this method [DONE]
        #             -- Seems to work fine
        
        old_links = [os.path.join(self.bin_dir, link) \
                     for link in os.listdir(self.bin_dir) \
                     if os.path.islink(os.path.join(self.bin_dir, link))]
        for link in old_links:
            self.delpy(link)
        
    def relink(self):
        # TODO: [ ] Error checking: check to make sure thing with same
        #           name doesn't exist in self.bin_dir already
        #       [x] Add flag for self.clean_bin_dir call [DONE]
        #             -- Removed the call completely.  Do it in main instead
        #       [ ] See if there is a prettier way of doing this without the
        #           twice nest for loops with extraneous filters and ifs
        
        # Don't include ${self.script_dir}/tests
        script_language_dirs = filter(lambda s: s != "tests", \
                                      os.listdir(self.scripts_dir))
        for script_language_dir in script_language_dirs:
            # Don't include Emacs' backup files, starting in "#" or "~"
            # TODO: [ ] FUCKING FIX THIS RETARDED LINE
            scripts = filter(lambda s: (s[-1] != "~") and (s[0] != "#"), \
                             os.listdir(os.path.join(self.scripts_dir, \
                                                     script_language_dir)))
            for script in scripts:
                script_path = os.path.join(self.scripts_dir, \
                                           script_language_dir, script)
                # Don't include filename extension in the bin name
                bin_path = os.path.join(self.bin_dir, \
                                        os.path.splitext(script)[0])
                # if script is executable...
                if os.access(script_path, os.X_OK):
                    os.symlink(script_path, bin_path)
            
if __name__ == "__main__":

    if "--version" in sys.argv:
        version_info = "relink.py version %s\Lovingly crafted in 2012 by Matt Walker <matt.g.d.walker@gmail.com>\nLicensed under the GNU GPLv2 as publish by the Free Software Foundation." % (version)
        print (version_info)
        exit (0)

    relinker = Relinker()
    relinker.clean_bin_dir()
    relinker.relink()
