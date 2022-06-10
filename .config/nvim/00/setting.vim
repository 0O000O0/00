" VIM script for add your own setting
" Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
" Last Change:	2021.04.08


" various
  "language en           "
  "colorscheme forest-   "
  syntax on             "
  filetype on           "
  filetype indent on    "
  filetype plugin on    "
                        "
  set nocompatible      " behave very Vi compatible (not advisable)
  set ttimeout		      " time out for key codes
  set ttimeoutlen=100	  " wait up to 100ms after Esc for special key
  set cmdheight=1       " number of lines used for the command-line
  set mouse=a           " list of flags for using the mouse

" gui
  if has('gui_running')
    set guifont=Consolas:h10 " list of font names to be used in the GUI
    set langmenu=none   " language to be used for the menus
    set guioptions +=d  " Use dark theme variant if available
    set guioptions -=m  " remove Menu bar
    set guioptions -=T  " remove Tool bar
    set guioptions -=b  " remove scroll bar
    set guioptions -=r  " remove scroll bar
    set guioptions -=L  " remove scroll bar
  endif                 "
" termimal
  set title             " show info in the window title
  let &t_EI = "\e[1 q" " NORMAL  mode
  let &t_SI = "\e[5 q" " INSERT  mode
  let &t_SR = "\e[3 q" " REPLACE mode
  " cursor mode
    " 1 blinking block          2 solid block
    " 3 blinking line under     4 solid line under
    " 5 blinking line verti     6 solid line verti

" text
  set display=truncate  " Show @@@ in the last line if it is truncated.
  set scrolloff=5       " number of screen lines to show around the cursor
  set nowrap            " long lines wrap
  set linebreak         " wrap long lines at a character in 'breakat'
  set nolist            " show <Tab> as ^I and end-of-line as $
  set cursorline        " highlight the screen line of the cursor
  "set cursorcolumn      " highlight the screen column of the cursor

" info
  "set relativenumber    " show the relative line number for each line
  set number            " show the line number for each line
  set ruler             " show cursor position below each window
  set wildmenu		      " display completion matches in a status line
  set showtabline=1     " when to use a tab pages line, 0, 1, 2;
  set showcmd           " show (partial) command keys in the status line
  set showmode          " display the current mode in the status line
  set showmatch         " when inserting a bracket, briefly jump to its match

" search
  set magic             " change the way backslashes are used in search patterns
  set hlsearch          " highlight all matches for the last used search pattern
  set incsearch         " show match for partly typed search command
  set ignorecase        " ignore case when using a search pattern
  set smartcase         " override 'ignorecase' when pattern has upper case characters

" indent
  set expandtab         " expand <Tab> to spaces in Insert mode
  set shiftround        " round to 'shiftwidth' for << and >>
  set smarttab          " a <Tab> in an indent inserts 'shiftwidth' spaces
  set smartindent       " do clever autoindenting
  set autoindent        " automatically set the indent of a new line
  set shiftwidth=2      " number of spaces used for each step of (auto)indent
  set tabstop=2         " number of spaces a <Tab> in the text stands for
  set softtabstop=2     " if non-zero, number of spaces to insert for a <Tab>
  set backspace=indent,eol,start " Allow backspacing over everything in insert mode.

" fold
  set foldmethod=indent " folding type: manual, indent, expr, marker, syntax
  set foldignore==      " used to ignore lines when 'foldmethod' is "indent"
  "set foldlevel=00     " folds with a level higher than this number will be closed
  "set nofoldenable     " set to display all folds open

" file
  set nobackup          " keep a backup after overwriting a file
  set noswapfile	      " use a swap file for this buffer
  set autowrite         " auto wrte a file when leaving a modified buffer
  set autoread          " auto read a file when it was modified outside of Vim
  set history=200		    " keep 200 lines of command line history
  set clipboard+=unnamedplus "unnamed to use the * register like unnamed register

" multi-byte characters
  set encoding=utf-8                     " character encoding for Vim: utf-8
  set termencoding=utf-8                 " character encoding for terminal
  set fileencodings=ucs-bom,utf-8,gb2312 " character encoding for current file
  set fileformats=unix,dos,mac           " auto detected character encodings


