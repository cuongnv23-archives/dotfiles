set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
"
" List of bundles
"
"" PowerLine
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"" File browser
Bundle 'scrooloose/nerdtree'
"" Python mode
Bundle 'klen/python-mode'
"" Code hinting for Python (Yes, Python only)
Bundle 'davidhalter/jedi-vim'
"" Syntax checking
Plugin 'scrooloose/syntastic'
"" Flake8
Plugin 'nvie/vim-flake8'
"" Color skin for vim
Plugin 'jnurmine/Zenburn'
"" Solarized color scheme for GVim
Plugin 'altercation/vim-colors-solarized'
"" Fucking awsome ctrlp
Plugin 'kien/ctrlp.vim'
"Plugin 'tpope/vim-fugitive'
"" Ansible
Bundle 'chase/vim-ansible-yaml'
"" Quote complete
Bundle 'Raimondi/delimitMate'




filetype plugin indent on
"

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    autocmd BufNewFile *.py 0put =\"# -*- coding: utf-8 -*-\<nl>\"|$
    autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl>\"|$
    autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl>\"|$
    augroup END

" Powerline setup
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
"" Must have for zenburn
set t_Co=256
" Activte NerdTree

map <F2> :NERDTreeToggle<CR>
" Python-mode
" " Activate rope
" " Keys:
" " K             Show python docs
" " <Ctrl-Space>  Rope autocomplete
" " <Ctrl-c>g     Rope goto definition
" " <Ctrl-c>d     Rope show documentation
" " <Ctrl-c>f     Rope find occurrences
" " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" " [[            Jump on previous class or function (normal, visual, operator modes)
" " ]]            Jump on next class or function (normal, visual, operator modes)
" " [M            Jump on previous class or method (normal, visual, operator modes)
" " ]M            Jump on next class or method (normal, visual, operator modes)
" let g:pymode_rope = 1
"
" " Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"
" "Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" " Auto check on save
let g:pymode_lint_write = 1
"
" " Support virtualenv
let g:pymode_virtualenv = 1
"
" " Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
"
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" " Don't autofold code
let g:pymode_folding = 0
" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" " automatically change window's cwd to file's dir

set encoding=utf-8

" enable syntax highlighting

syntax enable
" "
" " " show line numbers
set number
" "
" " " set tabs to have 4 spaces
set ts=4
" "
" " " indent when moving to the next line while writing code
set autoindent
" "
" " " expand tabs into spaces
set expandtab
" "
" " " when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" "
" " " show a visual line under the cursor's current line
set cursorline
" "
" " " show the matching part of the pair for [] {} and ()
set showmatch
" "
" " lines longer than 79 columns will be broken
set textwidth=79"
"
"
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
 project_base_dir = os.environ['VIRTUAL_ENV']
 activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
 execfile(activate_this, dict(__file__=activate_this))
EOF

"" Color scheme setup
let g:solarized_termcolors=256
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif
