" VIM color file
" Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
" Last Change:	2021.04.08


"let g:colors_name = 'forest'
let s:settings = [
      \ ' Normal           none    gglt xxxx ' ,
      \ ' VertSplit        none    ggdk whte ' ,
      \ ' TabLineFill      none    ggdk blck ' ,
      \ ' Title            bold    yyyy none ' ,
      \ ' TabLine          italic  ggdk blck ' ,
      \ ' StatusLineNC     italic  ggdk blck ' ,
      \ ' StatusLineTermNC italic  ggdk blck ' ,
      \ ' TabLineSel       bold    ggdk whte ' ,
      \ ' StatusLine       none    ggdk whte ' ,
      \ ' StatusLineTerm   none    ggdk whte ' ,
      \ ' Pmenu            none    ggdk whte ' ,
      \ ' WildMenu         bold    whte ggdk ' ,
      \ ' PmenuSel         bold    whte ggdk ' ,
      \ ' QuickFixline     bold    blck yydk ' ,
      \ ' Folded           none    ssdk none ' ,
      \ ' FoldColumn       none    none none ' ,
      \
      \ ' Cursor           none    blck yyyy ' ,
      \ ' CursorLine       bold    none grdk ' ,
      \ ' CursorColumn     none    none grdk ' ,
      \ ' CursorLineNr     bold    yyyy none ' ,
      \ ' LineNr           none    lldk none ' ,
      \ ' Visual           none    whte ggdk ' ,
      \ ' lCursor          reverse none none ' ,
      \ ' MatchParen       reverse none none ' ,
      \ ' Search           reverse none none ' ,
      \ ' IncSearch        reverse none none ' ,
      \
      \ ' Directory        bold    aalt none ' ,
      \ ' SpecialKey       bold    yyyy none ' ,
      \ ' NonText          bold    gggg none ' ,
      \ ' ModeMsg          bold    yyyy none ' ,
      \ ' MoreMsg          bold    yyyy none ' ,
      \ ' Question         bold    llll none ' ,
      \ ' WarningMsg       bold    mmmm none ' ,
      \ ' ErrorMsg         bold    rrrr none ' ,
      \
      \ ' Comment          none    oooo none ' ,
      \ ' Constant         none    ccdk none ' ,
      \ ' Number           none    cccc none ' ,
      \ ' Float            none    cccc none ' ,
      \ ' Identifier       none    yyyy none ' ,
      \ ' Statement        none    oolt none ' ,
      \ ' Preproc          none    yylt none ' ,
      \ ' Type             none    aalt none ' ,
      \ ' Special          none    vvlt none ' ,
      \ ' Ignore           none    blck grey ' ,
      \ ' Error            none    whte rrrr ' ,
      \ ' Todo             none    blck yyyy ' , ]


let s:colors = [
      \ ' xxxx #0d1a0d 013 026 013  - theme  ' ,
      \
      \ ' blck #000000 000 000 000 黑 black  ' ,
      \ ' grdk #404040 064 064 064  - -      ' ,
      \ ' grey #808080 128 128 128 灰 grey   ' ,
      \ ' grlt #c0c0c0 192 192 192  - -      ' ,
      \ ' whte #ffffff 255 255 255 白 white  ' ,
      \
      \ ' rrrr #ff0000 255 000 000 红 red    ' ,
      \ ' oooo #ff8000 255 128 000 橙 orange ' ,
      \ ' yyyy #ffff00 255 255 000 黄 yellow ' ,
      \ ' llll #80ff00 128 255 000 柠 lime   ' ,
      \ ' gggg #00ff00 000 255 000 绿 green  ' ,
      \ ' ssss #00ff80 000 255 128 春 spring ' ,
      \ ' cccc #00ffff 000 255 255 青 cyan   ' ,
      \ ' aaaa #0080ff 000 128 255 蔚 azure  ' ,
      \ ' bbbb #0000ff 000 000 255 蓝 blue   ' ,
      \ ' vvvv #8000ff 128 000 255 紫 violet ' ,
      \ ' mmmm #ff00ff 255 000 255 洋 magenta' ,
      \ ' pppp #ff0080 255 000 128 粉 pink   ' ,
      \
      \ ' rrgy #c06060 192 096 096  - -      ' ,
      \ ' oogy #c09060 192 144 096  - -      ' ,
      \ ' yygy #c0c060 192 192 096  - -      ' ,
      \ ' llgy #90c060 144 192 096  - -      ' ,
      \ ' gggy #60c060 096 192 096  - -      ' ,
      \ ' ssgy #60c090 096 192 144  - -      ' ,
      \ ' ccgy #60c0c0 096 192 192  - -      ' ,
      \ ' aagy #6090c0 096 144 192  - -      ' ,
      \ ' bbgy #6060c0 096 096 192  - -      ' ,
      \ ' vvgy #9060c0 144 096 192  - -      ' ,
      \ ' mmgy #c060c0 192 096 192  - -      ' ,
      \ ' ppgy #c06090 192 096 144  - -      ' ,
      \
      \ ' rrlt #ff8080 255 128 128  - -      ' ,
      \ ' oolt #ffc080 255 192 128  - -      ' ,
      \ ' yylt #ffff80 255 255 128  - -      ' ,
      \ ' lllt #c0ff80 192 255 128  - -      ' ,
      \ ' gglt #80ff80 128 255 128  - -      ' ,
      \ ' sslt #80ffc0 128 255 192  - -      ' ,
      \ ' cclt #80ffff 128 255 255  - -      ' ,
      \ ' aalt #80c0ff 128 192 255  - -      ' ,
      \ ' bblt #8080ff 128 128 255  - -      ' ,
      \ ' vvlt #c080ff 192 128 255  - -      ' ,
      \ ' mmlt #ff80ff 255 128 255  - -      ' ,
      \ ' pplt #ff80c0 255 128 192  - -      ' ,
      \
      \ ' rrdk #800000 128 000 000  - -      ' ,
      \ ' oodk #804000 128 064 000  - -      ' ,
      \ ' yydk #808000 128 128 000  - -      ' ,
      \ ' lldk #408000 064 128 000  - -      ' ,
      \ ' ggdk #008000 000 128 000  - -      ' ,
      \ ' ssdk #008040 000 128 064  - -      ' ,
      \ ' ccdk #008080 000 128 128  - -      ' ,
      \ ' aadk #004080 000 064 128  - -      ' ,
      \ ' bbdk #000080 000 000 128  - -      ' ,
      \ ' vvdk #400080 064 000 128  - -      ' ,
      \ ' mmdk #800080 128 000 128  - -      ' ,
      \ ' ppdk #800040 128 000 064  - -      ' , ]


func! s:init_setting()
  " let true-color-xterm uses highlight-gui attributes
	let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
	let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
  set termguicolors
  "
	set background=dark
	hi clear
	if exists("syntax_on")
	  syntax reset
  else
    syntax on
	endif
endfunc
func! s:do_setting()
  let colors = s:colors
  for each in colors
    let c = split(each, '\s\+')
    let cmd = 'let ' .c[0]. ' = "' .c[1]. '"'
    exec cmd
    "echo cmd
  endfor
  let none = 'NONE'
  let settings = s:settings
  for each in settings
    let s = split(each, '\s\+')
		" amazing 2 let
    exec join(['let cf = '] + [s[2]], '')
    exec join(['let cb = '] + [s[3]], '')
    let lCmd = ['hi '] + [s[0]] +
          \ [' cterm=NONE'] + [' cterm='] + [s[1]] +
          \ [' gui=NONE'] + [' gui=']+[s[1]]+
          \ [' guifg='] + [cf] + [' guibg='] + [cb] "+
          " \ [" cterm=none"]+[" cterm="]+[s[1]]+
          " \ [" ctermfg="]+[s[2]]+[" ctermbg="]+[s[3]]
    let sCmd = join(lCmd, "")
    exec sCmd
      "echo s
      "echo sCmd
  endfor
endfunc


call s:init_setting()
call s:do_setting()


