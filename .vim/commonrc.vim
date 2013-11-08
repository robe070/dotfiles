"
" $Id: commonrc.vim 25282 2013-09-19 14:44:20Z kelvin $
" $HeadURL: svn://toucan:7790/trunk/proj/dotfiles/.vim/commonrc.vim $
"

set nocompatible

"if has("win32")
"  lang en
"endif

behave xterm
"set selectmode=mouse

set noignorecase
set nowrap
set vb t_vb=
set bs=2
set ai
set nu

set softtabstop=4
set shiftwidth=4
set noexpandtab

set viminfo='20,\"50
set history=500
set ruler

set titlestring=%t\ -\ %{expand(\"%:h\")}\ -\ VIM

set tags=./__tags__,__tags__,../__tags__,../../__tags__,../../../__tags__

if !has("gui_running")
  if &term == "cygwin"
    set background=dark
  elseif &term == "xterm" || &term == "xterm-color" || &term == "xterm-debian"
    syntax on
    "set t_Co=16
    "set t_AB=[4%dm
    "set t_AF=[3%dm
  elseif &term == "xterm-256color"
    syntax on
    "set t_Co=256
    "set t_AB=[48;5;%dm
    "set t_AF=[38;5;%dm
  endif
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("vms")
  set nobackup
else
  set backup
endif

"set showcmd

map <C-Tab> <C-W>w
map <C-Up> <C-W>W
map <C-Down> <C-W>w

map <C-S-Up> 2<C-W>+
map <C-S-Down> 2<C-W>-
map <C-S-Left> 2<C-W><
map <C-S-Right> 2<C-W>>

if has("gui_running") && has("gui_win32")
  map Q gq
  vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

  map <MiddleMouse> <Nop>
  map! <MiddleMouse> <Nop>
  map <2-MiddleMouse> <Nop>
  map! <2-MiddleMouse> <Nop>
  map <3-MiddleMouse> <Nop>
  map! <3-MiddleMouse> <Nop>
  map <4-MiddleMouse> <Nop>
  map! <4-MiddleMouse> <Nop>
endif

if has("fname_case")
  au BufNewFile,BufRead *.plx,*.PLX             set ft=perl
  au BufNewFile,BufRead *.tk,*.TK               set ft=tcl
  au BufNewFile,BufRead *.asp,*.ASP             set ft=html
  au BufNewFile,BufRead *.asa,*.ASA             set ft=html
  au BufNewFile,BufRead *.c,*.C                 exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.cpp,*.CPP,*.Cpp       exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.cxx,*.CXX,*.Cxx       exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.cc,*.CC               exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.h,*.H                 exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.hpp,*.HPP,*.Hpp       exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.hxx,*.HXX,*.Hxx       exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.cs,*.CS,*.Cs          exec "so " . My_vim_file("cs.vim")
  au BufNewFile,BufRead *.py,*.PY,*.Py          exec "so " . My_vim_file("python.vim")
  au BufNewFile,BufRead *.java,*.JAVA,*.Java    exec "so " . My_vim_file("java.vim")
  au BufNewFile,BufRead *.frm,*.FRM             exec "so " . My_vim_file("vb.vim")
  au BufNewFile,BufRead *.cls,*.CLS             exec "so " . My_vim_file("vb.vim")
  au BufNewFile,BufRead *.ctl,*.CTL             exec "so " . My_vim_file("vb.vim")
  au BufNewFile,BufRead *.html,*.HTML           exec "so " . My_vim_file("html.vim")
  au BufNewFile,BufRead *.asp,*.ASP             exec "so " . My_vim_file("html.vim")
  au BufNewFile,BufRead *.asa,*.ASA             exec "so " . My_vim_file("html.vim")
  au BufNewFile,BufRead *.xml,*.XML             exec "so " . My_vim_file("xml.vim")
  au BufNewFile,BufRead *.xsl,*.XSL             exec "so " . My_vim_file("xml.vim")
  au BufNewFile,BufRead *.xsd,*.XSD             exec "so " . My_vim_file("xml.vim")
  au BufNewFile,BufRead *.xslt,*.XSLT           exec "so " . My_vim_file("xml.vim")
  au BufNewFile,BufRead *.lex,*.LEX             exec "so " . My_vim_file("lex.vim")
  au BufNewFile,BufRead *.mak,*.MAK             exec "so " . My_vim_file("make.vim")
  au BufNewFile,BufRead makefile*               exec "so " . My_vim_file("make.vim")
  au BufNewFile,BufRead Makefile*               exec "so " . My_vim_file("make.vim")
  au BufNewFile,BufRead MAKEFILE*               exec "so " . My_vim_file("make.vim")
  au BufNewFile,BufRead *.frm,*.FRM             exec "so " . My_vim_file("vb.vim")
  au BufNewFile,BufRead *.cls,*.CLS             exec "so " . My_vim_file("vb.vim")
  au BufNewFile,BufRead *.ctl,*.CTL             exec "so " . My_vim_file("vb.vim")
  au BufNewFile,BufRead *.rc,*.RC,*.Rc,*.rC     exec "so " . My_vim_file("rc.vim")
  au BufNewFile,BufRead *.sqc,*.SQC             exec "so " . My_vim_file("sqc.vim")
  au BufNewFile,BufRead *.txt,*.Txt,*.TXT       exec "so " . My_vim_file("text.vim")
  au BufNewFile,BufRead *.log,*.Log,*.LOG       exec "so " . My_vim_file("text.vim")
  au BufNewFile,BufRead *.lst,*.Lst,*.LST       exec "so " . My_vim_file("text.vim")
  au BufNewFile,BufRead svn-*.tmp,svn-*.Tmp,svn-*.TMP exec "so " . My_vim_file("svntmp.vim")
else
  au BufNewFile,BufRead *.plx                   set ft=perl
  au BufNewFile,BufRead *.tk                    set ft=tcl
  au BufNewFile,BufRead *.asp                   set ft=html
  au BufNewFile,BufRead *.asa                   set ft=html
  au BufNewFile,BufRead *.c                     exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.cpp                   exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.cxx                   exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.cc                    exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.h                     exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.hpp                   exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.hxx                   exec "so " . My_vim_file("c.vim")
  au BufNewFile,BufRead *.cs                    exec "so " . My_vim_file("cs.vim")
  au BufNewFile,BufRead *.py                    exec "so " . My_vim_file("python.vim")
  au BufNewFile,BufRead *.java                  exec "so " . My_vim_file("java.vim")
  au BufNewFile,BufRead *.frm                   exec "so " . My_vim_file("vb.vim")
  au BufNewFile,BufRead *.cls                   exec "so " . My_vim_file("vb.vim")
  au BufNewFile,BufRead *.ctl                   exec "so " . My_vim_file("vb.vim")
  au BufNewFile,BufRead *.html                  exec "so " . My_vim_file("html.vim")
  au BufNewFile,BufRead *.asp                   exec "so " . My_vim_file("html.vim")
  au BufNewFile,BufRead *.asa                   exec "so " . My_vim_file("html.vim")
  au BufNewFile,BufRead *.xml                   exec "so " . My_vim_file("xml.vim")
  au BufNewFile,BufRead *.xsl                   exec "so " . My_vim_file("xml.vim")
  au BufNewFile,BufRead *.xsd                   exec "so " . My_vim_file("xml.vim")
  au BufNewFile,BufRead *.xslt                  exec "so " . My_vim_file("xml.vim")
  au BufNewFile,BufRead *.lex                   exec "so " . My_vim_file("lex.vim")
  au BufNewFile,BufRead *.mak                   exec "so " . My_vim_file("make.vim")
  au BufNewFile,BufRead Makefile*               exec "so " . My_vim_file("make.vim")
  au BufNewFile,BufRead *.frm                   exec "so " . My_vim_file("vb.vim")
  au BufNewFile,BufRead *.cls                   exec "so " . My_vim_file("vb.vim")
  au BufNewFile,BufRead *.ctl                   exec "so " . My_vim_file("vb.vim")
  au BufNewFile,BufRead *.rc                    exec "so " . My_vim_file("rc.vim")
  au BufNewFile,BufRead *.sqc                   exec "so " . My_vim_file("sqc.vim")
  au BufNewFile,BufRead *.txt                   exec "so " . My_vim_file("text.vim")
  au BufNewFile,BufRead *.log                   exec "so " . My_vim_file("text.vim")
  au BufNewFile,BufRead *.lst                   exec "so " . My_vim_file("text.vim")
  au BufNewFile,BufRead svn-*.tmp               exec "so " . My_vim_file("svntmp.vim")
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  filetype plugin indent on

 " In text files, always limit the width of text to 78 characters
 "autocmd BufRead *.txt set tw=78

 augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For C and C++ files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd FileType *      set formatoptions=tcql nocindent comments&
  autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
 augroup END

 augroup gzip
  " Remove all gzip autocommands
  au!

  " Enable editing of gzipped files
  " set binary mode before reading the file
  autocmd BufReadPre,FileReadPre        *.gz,*.bz2 set bin
  autocmd BufReadPost,FileReadPost      *.gz call GZIP_read("gunzip")
  autocmd BufReadPost,FileReadPost      *.bz2 call GZIP_read("bunzip2")
  autocmd BufWritePost,FileWritePost    *.gz call GZIP_write("gzip")
  autocmd BufWritePost,FileWritePost    *.bz2 call GZIP_write("bzip2")
  autocmd FileAppendPre                 *.gz call GZIP_appre("gunzip")
  autocmd FileAppendPre                 *.bz2 call GZIP_appre("bunzip2")
  autocmd FileAppendPost                *.gz call GZIP_write("gzip")
  autocmd FileAppendPost                *.bz2 call GZIP_write("bzip2")

  " After reading compressed file: Uncompress text in buffer with "cmd"
  fun! GZIP_read(cmd)
    " set 'cmdheight' to two, to avoid the hit-return prompt
    let ch_save = &ch
    set ch=3
    " when filtering the whole buffer, it will become empty
    let empty = line("'[") == 1 && line("']") == line("$")
    let tmp = tempname()
    let tmpe = tmp . "." . expand("<afile>:e")
    " write the just read lines to a temp file "'[,']w tmp.gz"
    execute "'[,']w " . tmpe
    " uncompress the temp file "!gunzip tmp.gz"
    execute "!" . a:cmd . " " . tmpe
    " delete the compressed lines
    '[,']d
    " read in the uncompressed lines "'[-1r tmp"
    set nobin
    execute "'[-1r " . tmp
    " if buffer became empty, delete trailing blank line
    if empty
      normal Gdd''
    endif
    " delete the temp file
    call delete(tmp)
    let &ch = ch_save
    " When uncompressed the whole buffer, do autocommands
    if empty
      execute ":doautocmd BufReadPost " . expand("%:r")
    endif
  endfun

  " After writing compressed file: Compress written file with "cmd"
  fun! GZIP_write(cmd)
    if rename(expand("<afile>"), expand("<afile>:r")) == 0
      execute "!" . a:cmd . " <afile>:r"
    endif
  endfun

  " Before appending to compressed file: Uncompress file with "cmd"
  fun! GZIP_appre(cmd)
    execute "!" . a:cmd . " <afile>"
    call rename(expand("<afile>:r"), expand("<afile>"))
  endfun

 augroup END

endif " has("autocmd")

if $OSTYPE == 'FreeBSD'
  let g:my_ctags='exctags'
elseif $OSTYPE == 'linux'
  let g:my_ctags='ctags-exuberant'
else
  let g:my_ctags='ctags'
endif

if has("gui")
  if !has("vms")
    exec "an 40.320 &Tools.Build\\ &Tags\\ File :!" . g:my_ctags . " -o __tags__ -R .<CR>"
  endif
  if has("toolbar")
    exec "an 1.270 ToolBar.RunCtags :!" . g:my_ctags . " -o __tags__ -R .<CR>"
  endif
endif

" vim:sts=2:sw=2:ts=8:et
