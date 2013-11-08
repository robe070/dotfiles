" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
if has("win32")
  set bg&
endif

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "default_kiyo"

hi LineNr term=underline ctermfg=Gray ctermbg=DarkBlue guifg=Red3 guibg=LightYellow

" vim:sts=2:sw=2:ts=8:et
