#
# $Id: .login 30495 2014-12-08 03:43:29Z kelvin $
# $HeadURL: svn://toucan:7790/trunk/proj/dotfiles/.login $
#

### basic options
#umask 022
unset autologout

### path should be set up properly by .cshrc

### save current path
set path_org = ( $path )

### set 'lcase'
set _lcase_ = 'tr "[:upper:]" "[:lower:]"'

### check system type
unset is_cygwin
unset is_linux
unset is_sunos
unset is_openbsd
switch ( `uname -s` )
case [Cc][Yy][Gg][Ww][Ii][Nn]*:
  set is_cygwin = 1
  breaksw
case [Ll][Ii][Nn][Uu][Xx]*:
  set is_linux = 1
  breaksw
case [Ss][Uu][Nn][Oo][Ss]*:
  set is_sunos = 1
  breaksw
case [Oo][Pp][Ee][Nn][Bb][Ss][Dd]*:
  set is_openbsd = 1
  breaksw
endsw

### check root user
unset is_root
if ( ! $?is_sunos ) then
  if ( `id -u` == 0 ) then
    set is_root = 1
  endif
endif

### locate 'which'
unalias which
foreach _w ( ~/bin /usr/gnu/bin /usr/local/bin /usr/bin /bin )
  if ( -x "$_w/which" ) then
    set _which_ = "$_w/which"
    break
  endif
end
unset _w
if ( ! $?_which_ || $?is_sunos ) then
  if ( $?tcsh ) then
    set _which_ = 'which'
  else
    set _which_ = 'echo'
  endif
else
  ( dd if="$_which_" bs=1 count=2 | grep -q '#!' ) >& /dev/null && set _which_ = 'echo'
endif

### set shell
set shell_basename = `echo $0 | sed -e 's/^[ 	]*-*//'`
set shell_basename = `basename "$shell_basename"`
switch ( $shell_basename )
case tcsh*:
  # as 'which' itself may be a shell script on some systems,
  # so DO NOT call 'which' for interactive shell
  if ( ( $?prompt && "$_which_" != "echo" ) || $?is_cygwin ) then
    set shell = "`$_which_ tcsh`"
    setenv SHELL $shell
  endif
  breaksw
endsw
unset shell_basename

### settings for interactive shell
if ( $?prompt ) then

  setenv BLOCKSIZE K

  setenv EXINIT 'set showmode'
  setenv EDITOR "`$_which_ vim`"
  setenv VISUAL "$EDITOR"
  #setenv VIM '/usr/share/vim'
  unsetenv VIM

  setenv PAGER "`$_which_ less`"
  if ( ! $?is_sunos ) then
    setenv LESS '-i -X -d --shift=10'
  else
    setenv LESS '-i -X -d'
  endif

  alias Which \""$_which_"\"
  #alias which_ \""$_which_"\"
  alias whichx \""$_which_"\"" -a"

  alias Ls \""`$_which_ ls`"\"" -a"
  alias Lf 'Ls -FC'
  alias L 'Ls -l'

  if ( $?is_cygwin || $?is_linux ) then
    alias ls \""`$_which_ ls`"\"" --color=auto -a"
  else
    if ( -x "`$_which_ gnuls`" ) then
      alias ls \""`$_which_ gnuls`"\"" --color=auto -a"
    else if ( -x "`$_which_ colorls`" ) then
      alias ls \""`$_which_ colorls`"\"" -G -a"
    else if ( -x "`$_which_ ls`" ) then
      alias ls \""`$_which_ ls`"\"" -a"
    else
      alias ls 'ls -a'
    endif
  endif

  alias lf 'ls -FC'
  alias l 'ls -l'

  alias ldpath '( echo "LD_LIBRARY_PATH:-" && ( echo "$LD_LIBRARY_PATH" | tr '\'':'\'' '\''\n'\'' | sed -e '\''s/^/  /'\'' ) )'
  alias path '( echo "PATH:-" && ( echo "$PATH" | tr '\'':'\'' '\''\n'\'' | sed -e '\''s/^/  /'\'' ) )'

  alias cp 'cp -ip'
  alias mv 'mv -i'

  if ( ! $?is_sunos ) then
    alias ln 'ln -i'
  endif

  alias copy 'cp'
  alias move 'mv'
  alias ren 'mv'
  alias del 'rm'
  #alias type 'cat'
  alias cls 'clear'

  alias vi 'vim -X'
  alias vi0 'vi -c "normal '\''0"'

  if ( $?is_cygwin && -x "`$_which_ procps`" ) then
    alias Ps \""`$_which_ ps`"\"
    #alias ps_ \""`$_which_ ps`"\"
    alias ps 'procps'
  endif

  alias psl 'ps auxww | sort -n +1 | less -SF'

  set history = 5000
  set savehist = ( $history merge )
  set histdup = erase

  set filec
  set ignoreeof
  set fignore = ( \~ .swp )

  #stty erase ^H

  ### change command prompt
  set prompt = '% '
  if ( $?shell ) then
    if ( $?tcsh ) then
      # plain text prompt
      set prompt = '%n@%m:%~:%h %# '
      # mono highlight prompt
      #set prompt = '%U%n@%m%u:%S%~%s:%B%h%b %# '
      if ( $?term ) then
        switch ( $term )
        case xterm*:
        case rxvt:
        case screen:
          # colored prompt for xterm
          set PScolor = 106
          if ( $?is_root ) then
            set PScolor = 102
          endif
          set prompt = '%{^[['$PScolor'm%}%n@%m%{^[[m%}:%{^[[103m%}%~%{^[[m%}:%h %# '
          unset PScolor
          breaksw
        case cons25:
        case cygwin:
        case linux:
          set PScolor = 36
          if ( $?is_root ) then
            set PScolor = 32
          endif
          set prompt = '%{^[[01;'$PScolor'm%}%n@%m%{^[[0m%}:%{^[[01;33m%}%~%{^[[0m%}:%{^[[01;41m%}%h%{^[[0m%} %# '
          unset PScolor
          breaksw
        endsw
      endif
    endif
  endif

  set _dircolors_ =
  foreach _d ( dircolors gdircolors )
    foreach _p ( ~/bin /usr/gnu/bin /usr/local/bin /usr/bin /bin )
      if ( -x "$_p/$_d" ) then
        set _dircolors_ = "$_p/$_d"
        break
      endif
    end
    if ( "$_dircolors_" != "" ) then
      break
    endif
  end
  if ( -x "$_dircolors_" ) then
    set DIRCOLORS_CONF =
    if ( $?term ) then
      switch ( $term )
      case xterm*:
        set DIRCOLORS_CONF = "$HOME/.dircolors.d/dircolors.xterm"
        breaksw
      case screen*:
        set DIRCOLORS_CONF = "$HOME/.dircolors.d/dircolors.screen"
        breaksw
      default:
        if ( "$term" != "" ) then
          set DIRCOLORS_CONF = "$HOME/.dircolors.d/dircolors.$term"
        endif
        breaksw
      endsw
    endif
    if ( -f "$DIRCOLORS_CONF" ) then
      eval `"$_dircolors_" -c "$DIRCOLORS_CONF"`
    else
      eval `"$_dircolors_" -c`
    endif
    unset DIRCOLORS_CONF
  endif
  unset _dircolors_

  if ( $?shell ) then
    if ( $?tcsh && -f ~/.tcsh.bindkey ) then
      source ~/.tcsh.bindkey
    endif
  endif

  if ( $?is_cygwin ) then
    setenv MAKE_MODE UNIX
  endif

  ### setup XFree86

  #setenv desktop openbox

  alias xclock \""`$_which_ xclock`"\"" -geometry 100x100-0+0 \!* &"
  alias dclock \""`$_which_ xclock`"\"" -geometry +0-0 -digital -update 1 -strftime '["`hostname`"] %Y-%m-%d %H:%M:%S' \!* &"

  if ( $?is_cygwin ) then
    alias xmanx \""`$_which_ xman`"\"" -geometry -110+0 \!* &"
  else
    alias xmanx "env MANPATH="\"'`manpath`'\"" "\""`$_which_ xman`"\"" -geometry -110+0 \!* &"
  endif

  alias gv 'gvim'
  alias gv0 'gv -c "normal '\''0"'
  alias gvx 'gv -geometry 200x80+0+0'
  alias gvx0 'gv0 -geometry 200x80+0+0'

endif

### cygwin host information
if ( $?is_cygwin ) then
  if ( $?HOST ) then
    setenv HOST "`echo $HOST | $_lcase_`"
  endif
  if ( $?USER ) then
    setenv USER "`echo $USER | $_lcase_`"
  endif
  if ( $?USERNAME ) then
    setenv USERNAME "`echo $USERNAME | $_lcase_`"
  endif
endif

### further local customisation
if ( -f ~/.login.local ) then
  source ~/.login.local
endif

### tell your fortune
if ( $?is_cygwin ) then
  set _fortune_ = '/usr/bin/fortune'
else
  set _fortune_ = '/usr/games/fortune'
endif
if ( -x "$_fortune_" ) then
  ( echo ''; "$_fortune_"; echo '' )
endif
unset _fortune_

### clean up
unset _which_
unset _lcase_
unset is_cygwin
unset is_linux
unset is_sunos
unset is_openbsd
unset is_root

# vim:sts=2:sw=2:ts=8:et:syntax=csh
