" VIM script, keymap
" Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
" Last Change:	2021.04.30


"mapclear

" F key
  map   <F1> <ESC>:only<CR>:help<CR><C-w>H
  map   <F2> <ESC>:e.<CR>
  map!  <F1> <ESC>:only<CR>:help<CR><C-w>H
  map!  <F2> <ESC>:e.<CR>
  "map! <F12> <C-s>:only<CR>:copen<CR><C-w>H<C-w><C-w>
  "map!  <F4> <C-s>:so %<CR>
  "map!  <F5> <C-s>:exec (&filetype=='python') ? ("AsyncRun -raw python %") : ("")<CR>
  "map!  <F5> <C-s>:exec (&filetype=='python') ? ("!python %") : ("")<CR>

" Move
  noremap  j h
  noremap  k j
  noremap  l k
  noremap  ; l
  noremap  h ;
  noremap  H K
  noremap  , ^
  noremap  . $
  "
  noremap  <C-d> <C-d>
  noremap  <C-e> <C-u>

" Tab
  noremap  <C-w><C-t> <ESC>:tabe<CR>
  noremap  <C-t><C-q> <ESC>:q<CR>
  noremap  <C-t><C-t> <ESC>:tabnext<CR>
  noremap       <C-q> <ESC><C-w><C-q>
  "noremap       <C-,> <ESC>gT
  "noremap       <C-.> <ESC>gt
  "noremap      <C-TAB> <ESC>:tabnext<CR>
  "
  noremap! <C-w><C-t> <ESC>:tabe<CR>
  noremap! <C-t><C-q> <ESC>:q<CR>
  noremap! <C-t><C-t> <ESC>:tabnext<CR>
  noremap!      <C-q> <ESC><C-w><C-q>
  "noremap!      <C-,> <ESC>gT
  "noremap!      <C-.> <ESC>gt
  "noremap!     <C-TAB> <ESC>:tabnext<CR>

" Win
  "noremap     <C-k> <C-w><c-j>
  "noremap     <C-l> <C-w><c-k>
  noremap        <C-k> <C-w><C-h>
  noremap        <C-l> <C-w><c-l>
  noremap       <C-UP> <C-w>K
  noremap     <C-DOWN> <C-w>J
  noremap     <C-LEFT> <C-w>H
  noremap    <C-RIGHT> <C-w>L
  noremap     <C-S-UP> <ESC>:resize -5<CR>
  noremap   <C-s-DOWN> <ESC>:resize +5<CR>
  noremap   <C-s-LEFT> <ESC>:vertical res +5<CR>
  noremap  <C-S-RIGHT> <ESC>:vertical res -5<CR>
  noremap    <C-SPACE> <ESC><C-w><C-w>
  "
  "noremap!     <C-k> <C-w><c-j>
  "noremap!     <C-l> <C-w><c-k>
  noremap!       <C-k> <C-w><C-h>
  noremap!       <C-l> <C-w><c-l>
  noremap!      <C-up> <C-w>K
  noremap!    <C-down> <C-w>J
  noremap!    <C-left> <C-w>H
  noremap!   <C-right> <C-w>L
  noremap!    <C-S-up> <ESC>:resize -5<CR>
  noremap!  <C-S-down> <ESC>:resize +5<CR>
  noremap!  <C-S-left> <ESC>:vertical res +5<CR>
  noremap! <C-S-right> <ESC>:vertical res -5<CR>
  noremap!   <C-space> <ESC><C-w><C-w>

" Fold
  let g:fl = 0
  noremap <C-a> <ESC>:let g:fl=!g:fl<CR>:exec(g:fl)?(":set foldlevel=888"):(":set foldlevel=0")<CR>:set foldlevel?<CR>
  noremap <C-z> <ESC>za

" Search
  noremap     n <ESC>Nzz
  noremap     m <ESC>nzz

" Visual
  let g:ve=0
  noremap       vv <ESC>:let g:ve=!g:ve<CR>:exec(g:ve)?(":set ve=all"):(":set ve=")<CR>:set ve?<CR>
  noremap       vb <ESC>:set ve=all<CR><C-v>
  noremap       vg <ESC>:set ve=all<CR>V
  noremap       vt <ESC>:set ve=all<CR>v
  vnoremap    <BS> I<BS>
  vnoremap   <TAB> I<TAB>
  vnoremap <SPACE> I<SPACE>

" Normal
  nnoremap <ENTER> o<ESC>
  nnoremap <SPACE> i <ESC>

" Insert
  inoremap <C-ENTER> <ESC>jA
  "inoremap <C-SPACE> <ESC>la

" File
  noremap  <C-s> <ESC>:w!<CR>
  noremap  <C-c> <ESC>yy
  noremap  <C-v> <ESC>p
  noremap! <C-s> <ESC>:w!<CR>
  inoremap <C-c> <ESC>yy
  inoremap <C-v> <ESC>p

" autocmd
  autocmd BufRead,BufNewFile * call Map_F5()
  autocmd  WinEnter,TabEnter * call Map_F5()
" def func
  func! Map_F5()
    "echo &filetype
    if     &filetype=='vim'
      map  <F5> <C-s>:so %<CR>
      map! <F5> <C-s>:so %<CR>
    elseif &filetype=='python'
      map  <F5> <C-s>:only<CR>:copen<CR><C-w>H<C-w><C-w>:AsyncRun -raw python %<CR>
      map! <F5> <C-s>:only<CR>:copen<CR><C-w>H<C-w><C-w>:AsyncRun -raw python %<CR>
    else
      map  <F5> :echo 'CAN NOT RUN THIS FILE'<CR>
    endif
  endfunc
"
  "func! Run()
  "  if     &filetype=='vim'
  "    "exec 'so %'
  "  elseif &filetype=='python'
  "    exec 'AsyncRun -raw python %'
  "  endif
  "endfunc





