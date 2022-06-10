" VIM script for add your own autocmd
" Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
" Last Change:	2021.04.08


"autocmd VimEnter * :vsplit
":only<CR>:help<CR><C-w>H<C-w><C-w>
"
autocmd BufWritePre * :%s/\s\+$//e
"autocmd WinLeave * :w


