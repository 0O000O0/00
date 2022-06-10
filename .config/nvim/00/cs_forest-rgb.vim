" VIM color file
" Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
" Last Change:	2021.03.28


let g:colors_name = "forest"
let s:setting = [
\" Normal        NONE    gglt xxxx " ,
\" VertSplit     NONE    ggdk whte " ,
\" StatusLine    NONE    ggdk whte " ,
\" StatusLineNC  italic  ggdk blck " ,
\" TabLine       NONE    ggdk whte " ,
\" TabLineFill   NONE    ggdk blck " ,
\" Pmenu         NONE    ggdk whte " ,
\" WildMenu      bold    whte ggdk " ,
\" TabLineSel    bold    whte ggdk " ,
\" PmenuSel      bold    whte ggdk " ,
\" QuickFixline  bold    blck yydk " ,
\" Folded        NONE    ssdk NONE " ,
\" FoldColumn    NONE    rrrr rrrr " ,
\
\" Cursor        NONE    blck yyyy " ,
\" CursorLine    bold    NONE grdk " ,
\" CursorColumn  NONE    NONE grdk " ,
\" CursorLineNr  bold    yyyy NONE " ,
\" LineNr        NONE    lldk NONE " ,
\" Visual        NONE    whte ggdk " ,
\" lCursor       reverse NONE NONE " ,
\" MatchParen    reverse NONE NONE " ,
\" Search        reverse NONE NONE " ,
\" IncSearch     reverse NONE NONE " ,
\
\" Directory     bold    aalt NONE " ,
\" Title         bold    cccc NONE " ,
\" SpecialKey    bold    yyyy NONE " ,
\" NonText       bold    gggg NONE " ,
\" ModeMsg       bold    yyyy NONE " ,
\" MoreMsg       bold    yyyy NONE " ,
\" Question      bold    llll NONE " ,
\" WarningMsg    bold    mmmm NONE " ,
\" ErrorMsg      bold    rrrr NONE " ,
\
\" Comment       NONE    oooo NONE " ,
\" Constant      NONE    ccdk NONE " ,
\" Number        NONE    cccc NONE " ,
\" Float         NONE    cccc NONE " ,
\" Identifier    NONE    yyyy NONE " ,
\" Statement     NONE    oolt NONE " ,
\" Preproc       NONE    yylt NONE " ,
\" Type          NONE    aalt NONE " ,
\" Special       NONE    vvlt NONE " ,
\" Ignore        NONE    blck grey " ,
\" Error         NONE    whte rrrr " ,
\" Todo          NONE    blck yyyy " , ]


func! s:init_setting()
	hi clear
  set termguicolors
	set background=dark
	if exists("syntax_on")
	  syntax reset
  else
    syntax on
	endif
endfunc
func! s:do_setting()
	let setting = s:setting
	for each in setting
		let s = split(each, "\\s\\+")
		let lCmd = ["hi "]+[s[0]]+
                    \ [" gui=NONE"]+[" gui="]+[s[1]]+
					\ [" guifg="]+[s[2]]+[" guibg="]+[s[3]] "+
                    " \ [" cterm=NONE"]+[" cterm="]+[s[1]]+
                    " \ [" ctermfg="]+[s[2]]+[" ctermbg="]+[s[3]]
		let sCmd = join(lCmd, "")
        exec sCmd
        "echo sCmd
	endfor
endfunc


call s:init_setting()
call s:do_setting()


