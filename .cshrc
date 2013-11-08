#
# $Id: .cshrc 25280 2013-09-19 14:37:42Z kelvin $
# $HeadURL: svn://toucan:7790/trunk/proj/dotfiles/.cshrc $
#

### basic paths
#if ( $?KEEPPATH ) then
#  set path = ( /usr/local/bin /usr/bin /bin $path )
#else
  set path = ( /usr/local/bin /usr/bin /bin )
#endif

### check system type
unset is_cygwin
unset is_linux
unset is_freebsd
switch ( `uname -s` )
case [Cc][Yy][Gg][Ww][Ii][Nn]*:
  set is_cygwin = 1
  breaksw
case [Ll][Ii][Nn][Uu][Xx]*:
  set is_linux = 1
  breaksw
case [Ff][Rr][Ee][Ee][Bb][Ss][Dd]*:
  set is_freebsd = 1
  breaksw
endsw

if ( $?is_cygwin ) then
  # /usr/bin is the same as /bin
  set path = ( /usr/local/bin /bin )
endif

### add X11 path
if ( $?is_freebsd ) then
  if ( !( -l '/usr/X11R6') && -d '/usr/X11R6/bin' ) then
    set path = ( $path /usr/X11R6/bin )
  endif
endif

### add system specific paths
if ( $?is_cygwin ) then
else
  set path = ( $path /usr/local/sbin /usr/sbin /sbin )
endif

### add user path
set path = ( ~/bin $path )

### cygwin specific settings
if ( $?is_cygwin ) then

  unsetenv _ARGS_
  unsetenv _RUNSH_
  unsetenv _SHEXE_
  unsetenv _SH_
  unsetenv _TITLE_
  unsetenv PATH_ORG

  #unsetenv KEEPPATH
  unsetenv CYGWIN_ROOT
  unsetenv INCLUDE
  unsetenv LIB
  unsetenv GNUPGHOME

endif

### further local customisation
if ( -f ~/.cshrc.local ) then
  source ~/.cshrc.local
endif

### clean up
unset is_cygwin
unset is_linux
unset is_freebsd

### load .login for interactive but non-login shell
if ( ! $?loginsh && $?prompt && -f ~/.login ) then
  tty -s && source ~/.login
endif

# vim:sts=2:sw=2:ts=8:et:syntax=csh
