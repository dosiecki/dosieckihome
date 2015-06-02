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
:hi LineNr guifg=gray guibg=darkblue       " gray line numbers
:hi LineNr ctermfg=gray ctermbg=darkblue   " blue line number BG
set undofile                     " persist undo buffers
set undodir=~/.vim/undo          " keep undo buffers in the vim dir
set undolevels=1024              " max undo levels per buffer
set hidden                       " allow unsaved buffers to be backgrounded without confirmation
