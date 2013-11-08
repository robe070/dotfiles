#!/bin/sh
#
# $Id: mktar.sh 25594 2013-11-08 02:06:04Z kelvin $
#

cd `dirname "$0"`
find . ! -type d \
    -a ! -name `basename "$0"` \
    -a ! -name dotfiles.tbz \
    -a ! -name '*~' \
    -a ! -name .svn \
    -a ! -regex '.*\/\.svn\/.*' \
    -a ! -name .git \
    -a ! -regex '.*\/\.git\/.*' \
    -a ! -name .gitignore \
  | env LC_ALL=C sort | tar cvjf dotfiles.tbz -T -

# vim:sts=2:sw=2:ts=8:et:syntax=sh
