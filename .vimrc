set nocompatible                 " no legacy
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
set viminfo^=%                   " save buffer list (%) in viminfo
set foldmethod=syntax            " fold using syntax rules
set hlsearch                     " highlight all search hits

:colorscheme elflord " set before doing any other colour stuff!

set laststatus=2                                            " always show status line
set statusline=                                             " (reset statusline in case this is a reload)
set statusline+=%1*\ %F\                                    " path
set statusline+=%2*\ %m%r%w%h                               " flags
set statusline+=%=                                          " right justify rest
set statusline+=%3*\ <enc:%{''.(&fenc!=''?&fenc:&enc).''}>  " encoding
set statusline+=%4*\ <br:%{&ff}>                            " newline format
set statusline+=%5*\ [line:%l\/%L]                          " line num
set statusline+=%6*\ [col:%03c]                             " column num

:hi User1 ctermfg=lightgray   ctermbg=darkblue
:hi User2 ctermfg=white       ctermbg=darkblue
:hi User3 ctermfg=lightblue   ctermbg=black
:hi User4 ctermfg=lightblue   ctermbg=black
:hi User5 ctermfg=lightgreen  ctermbg=black
:hi User6 ctermfg=lightgreen  ctermbg=black

:hi LineNr ctermfg=gray      ctermbg=darkblue   " blue line number BG

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'luochen1990/rainbow'
Plugin 'francoiscabrol/ranger.vim'
call vundle#end()
filetype plugin indent on

let g:rainbow_active = 1  " enable rainbow parens plugin

" page up and down by half
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>

" start a new undopoint before edit-mode deletions 
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" hotkey to turn off autoindent
nnoremap <F8> :setl noai nocin nosi inde=<CR>

autocmd FileType ruby setlocal softtabstop=2 shiftwidth=2 tabstop=2
autocmd FileType scala setlocal softtabstop=2 shiftwidth=2 tabstop=2
