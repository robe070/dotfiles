#
# $Id: .bashrc 25278 2013-09-19 14:32:23Z kelvin $
# $HeadURL: svn://toucan:7790/trunk/proj/dotfiles/.bashrc $
#

### source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f "${HOME}/.bash_login.pathhelp" ]; then
  . "${HOME}/.bash_login.pathhelp"
fi

### basic paths
#if [ -n "$KEEPPATH" ]; then
#  PATH=/usr/local/bin:/usr/bin:/bin:$PATH
#else
  PATH=/usr/local/bin:/usr/bin:/bin
#fi

### check system type
unset is_cygwin
unset is_linux
unset is_freebsd
case `uname -s` in
  [Cc][Yy][Gg][Ww][Ii][Nn]*) is_cygwin=1 ;;
  [Ll][Ii][Nn][Uu][Xx]*) is_linux=1 ;;
  [Ff][Rr][Ee][Ee][Bb][Ss][Dd]*) is_freebsd=1 ;;
esac

if [ -n "$is_cygwin" ]; then
  # /usr/bin is the same as /bin
  PATH=/usr/local/bin:/bin
fi

### add X11 path
if [ -n "$is_freebsd" ]; then
  if [ ! -h '/usr/X11R6' -a -d '/usr/X11R6/bin' ]; then
    _pathappend /usr/X11R6/bin
  fi
fi

### add system specific paths
if [ -n "$is_cygwin" ]; then
  _pathappend /usr/local/sbin /usr/sbin /sbin /tools/bin
else
  _pathappend /usr/local/sbin /usr/sbin /sbin
fi

### add user path
_pathmunge "$HOME/bin"

### cygwin specific settings
if [ -n "$is_cygwin" ]; then

  unset _ARGS_
  unset _RUNSH_
  unset _SHEXE_
  unset _SH_
  unset _TITLE_
  unset PATH_ORG

  #unset KEEPPATH
  unset CYGWIN_ROOT
  unset INCLUDE
  unset LIB
  unset GNUPGHOME

fi

### further local customisation
if [ -f "$HOME/.bashrc.local" ]; then
  source "$HOME/.bashrc.local"
fi

### clean up
unset is_cygwin
unset is_linux
unset is_freebsd

### load .login for interactive but non-login shell
if [ -n "$PS1" -a -f "$HOME/.bash_login" ]; then
  tty -s && source "$HOME/.bash_login"
fi

# vim:sts=2:sw=2:ts=8:et:syntax=sh
