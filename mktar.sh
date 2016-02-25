#!/bin/sh
#
# $Id: mktar.sh 35878 2016-02-24 00:47:05Z kelvin $
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
  | env LC_ALL=C sort | tar cvjf dotfiles.tbz -T -

# vim:sts=2:sw=2:ts=8:et:syntax=sh
