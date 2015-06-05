:syntax on                       " hilight!
set tabstop=4                    " how to render hard tabs
set softtabstop=4                " size of tabs
set shiftwidth=4                 " size of indents
set expandtab                    " destroy all tabs!
set autoindent                   " preserve indentation on CR
set wrap!                        " no line wrapping
set sidescroll=1                 " enable horizontal scrolling
set backspace=2                  " allow backspacing over things not recently typed
set notimeout                    " don't timeout on mappings
set ttimeout                     " do timeout on key codes
set timeoutlen=150               " after 150ms
set mouse=a                      " enable mouse support
set wildmenu                     " enable tab completion
set wildmode=longest:full,full   " complete longest match first, then cycle thru all matches
set number                       " enable line numbering
set numberwidth=4                " use 4 characters of space for the margin
set undofile                     " persist undo buffers
set undodir=~/.vim/undo          " keep undo buffers in the vim dir
set undolevels=1024              " max undo levels per buffer
set hidden                       " allow unsaved buffers to be backgrounded without confirmation

set laststatus=2                                            " always show status line
set statusline=                                             " (reset statusline in case this is a reload)
set statusline+=%1*\ %F\                                    " path
set statusline+=%2*\ %m%r%w%h                               " flags
set statusline+=%=                                          " right justify rest
set statusline+=%3*\ <enc:%{''.(&fenc!=''?&fenc:&enc).''}>  " encoding
set statusline+=%4*\ <br:%{&ff}>                            " newline format
set statusline+=%5*\ [line:%l\/%L]                          " line num
set statusline+=%6*\ [col:%03c]                             " column num

:hi User1 ctermfg=lightgray   ctermbg=lightblue
:hi User2 ctermfg=white       ctermbg=darkblue
:hi User3 ctermfg=lightblue   ctermbg=black
:hi User4 ctermfg=lightblue   ctermbg=black
:hi User5 ctermfg=lightgreen  ctermbg=black
:hi User6 ctermfg=lightgreen  ctermbg=black

:hi LineNr ctermfg=gray      ctermbg=darkblue   " blue line number BG
