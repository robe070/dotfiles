#
# $Id: .bash_logout 25278 2013-09-19 14:32:23Z kelvin $
# $HeadURL: svn://toucan:7790/trunk/proj/dotfiles/.bash_logout $
#

# invalidate the gpm selection buffer if logging out from a
# virtual terminal
if test -x /sbin/consoletype && /sbin/consoletype fg
then if test -r /var/run/gpm.pid && test -d "/proc/$(/bin/cat /var/run/gpm.pid)"
     then kill -USR2 "$(/bin/cat /var/run/gpm.pid)"
     fi
fi

clear

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

# vim:sts=2:sw=2:ts=8:et:syntax=sh
