" VIM script for testing colors (color name define inside this file)
" Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
" Last Change:	2021.04.08


" edit this file, then do ":source %", and check if the colors match

" xxxx__xxxx xxxx__blck xxxx__whte xxxx__grey blck__xxxx whte__xxxx grey__xxxx ====
" blck__xxxx blck__blck blck__whte blck__grey blck__blck whte__blck grey__blck ====
" grdk__xxxx grdk__blck grdk__whte grdk__grey blck__grdk whte__grdk grey__grdk ====
" grey__xxxx grey__blck grey__whte grey__grey blck__grey whte__grey grey__grey ====
" grlt__xxxx grlt__blck grlt__whte grlt__grey blck__grlt whte__grlt grey__grlt ====
" whte__xxxx whte__blck whte__whte whte__grey blck__whte whte__whte grey__whte ====
"
" rrrr__xxxx rrrr__blck rrrr__whte rrrr__grey blck__rrrr whte__rrrr grey__rrrr ====
" oooo__xxxx oooo__blck oooo__whte oooo__grey blck__oooo whte__oooo grey__oooo ====
" yyyy__xxxx yyyy__blck yyyy__whte yyyy__grey blck__yyyy whte__yyyy grey__yyyy ====
" llll__xxxx llll__blck llll__whte llll__grey blck__llll whte__llll grey__llll ====
" gggg__xxxx gggg__blck gggg__whte gggg__grey blck__gggg whte__gggg grey__gggg ====
" ssss__xxxx ssss__blck ssss__whte ssss__grey blck__ssss whte__ssss grey__ssss ====
" cccc__xxxx cccc__blck cccc__whte cccc__grey blck__cccc whte__cccc grey__cccc ====
" aaaa__xxxx aaaa__blck aaaa__whte aaaa__grey blck__aaaa whte__aaaa grey__aaaa ====
" bbbb__xxxx bbbb__blck bbbb__whte bbbb__grey blck__bbbb whte__bbbb grey__bbbb ====
" vvvv__xxxx vvvv__blck vvvv__whte vvvv__grey blck__vvvv whte__vvvv grey__vvvv ====
" mmmm__xxxx mmmm__blck mmmm__whte mmmm__grey blck__mmmm whte__mmmm grey__mmmm ====
" pppp__xxxx pppp__blck pppp__whte pppp__grey blck__pppp whte__pppp grey__pppp ====
"
" rrgy__xxxx rrgy__blck rrgy__whte rrgy__grey blck__rrgy whte__rrgy grey__rrgy ====
" oogy__xxxx oogy__blck oogy__whte oogy__grey blck__oogy whte__oogy grey__oogy ====
" yygy__xxxx yygy__blck yygy__whte yygy__grey blck__yygy whte__yygy grey__yygy ====
" llgy__xxxx llgy__blck llgy__whte llgy__grey blck__llgy whte__llgy grey__llgy ====
" gggy__xxxx gggy__blck gggy__whte gggy__grey blck__gggy whte__gggy grey__gggy ====
" ssgy__xxxx ssgy__blck ssgy__whte ssgy__grey blck__ssgy whte__ssgy grey__ssgy ====
" ccgy__xxxx ccgy__blck ccgy__whte ccgy__grey blck__ccgy whte__ccgy grey__ccgy ====
" aagy__xxxx aagy__blck aagy__whte aagy__grey blck__aagy whte__aagy grey__aagy ====
" bbgy__xxxx bbgy__blck bbgy__whte bbgy__grey blck__bbgy whte__bbgy grey__bbgy ====
" vvgy__xxxx vvgy__blck vvgy__whte vvgy__grey blck__vvgy whte__vvgy grey__vvgy ====
" mmgy__xxxx mmgy__blck mmgy__whte mmgy__grey blck__mmgy whte__mmgy grey__mmgy ====
" ppgy__xxxx ppgy__blck ppgy__whte ppgy__grey blck__ppgy whte__ppgy grey__ppgy ====
"
" rrlt__xxxx rrlt__blck rrlt__whte rrlt__grey blck__rrlt whte__rrlt grey__rrlt ====
" oolt__xxxx oolt__blck oolt__whte oolt__grey blck__oolt whte__oolt grey__oolt ====
" yylt__xxxx yylt__blck yylt__whte yylt__grey blck__yylt whte__yylt grey__yylt ====
" lllt__xxxx lllt__blck lllt__whte lllt__grey blck__lllt whte__lllt grey__lllt ====
" gglt__xxxx gglt__blck gglt__whte gglt__grey blck__gglt whte__gglt grey__gglt ====
" sslt__xxxx sslt__blck sslt__whte sslt__grey blck__sslt whte__sslt grey__sslt ====
" cclt__xxxx cclt__blck cclt__whte cclt__grey blck__cclt whte__cclt grey__cclt ====
" aalt__xxxx aalt__blck aalt__whte aalt__grey blck__aalt whte__aalt grey__aalt ====
" bblt__xxxx bblt__blck bblt__whte bblt__grey blck__bblt whte__bblt grey__bblt ====
" vvlt__xxxx vvlt__blck vvlt__whte vvlt__grey blck__vvlt whte__vvlt grey__vvlt ====
" mmlt__xxxx mmlt__blck mmlt__whte mmlt__grey blck__mmlt whte__mmlt grey__mmlt ====
" pplt__xxxx pplt__blck pplt__whte pplt__grey blck__pplt whte__pplt grey__pplt ====
"
" rrdk__xxxx rrdk__blck rrdk__whte rrdk__grey blck__rrdk whte__rrdk grey__rrdk ====
" oodk__xxxx oodk__blck oodk__whte oodk__grey blck__oodk whte__oodk grey__oodk ====
" yydk__xxxx yydk__blck yydk__whte yydk__grey blck__yydk whte__yydk grey__yydk ====
" lldk__xxxx lldk__blck lldk__whte lldk__grey blck__lldk whte__lldk grey__lldk ====
" ggdk__xxxx ggdk__blck ggdk__whte ggdk__grey blck__ggdk whte__ggdk grey__ggdk ====
" ssdk__xxxx ssdk__blck ssdk__whte ssdk__grey blck__ssdk whte__ssdk grey__ssdk ====
" ccdk__xxxx ccdk__blck ccdk__whte ccdk__grey blck__ccdk whte__ccdk grey__ccdk ====
" aadk__xxxx aadk__blck aadk__whte aadk__grey blck__aadk whte__aadk grey__aadk ====
" bbdk__xxxx bbdk__blck bbdk__whte bbdk__grey blck__bbdk whte__bbdk grey__bbdk ====
" vvdk__xxxx vvdk__blck vvdk__whte vvdk__grey blck__vvdk whte__vvdk grey__vvdk ====
" mmdk__xxxx mmdk__blck mmdk__whte mmdk__grey blck__mmdk whte__mmdk grey__mmdk ====
" ppdk__xxxx ppdk__blck ppdk__whte ppdk__grey blck__ppdk whte__ppdk grey__ppdk ====
"
"
"
"
" Open this file in a window if it isn't edited yet.
" Use the current window if it's empty.
if expand('%:p') != expand('<sfile>:p')
  let s:fname = expand('<sfile>')
  if exists('*fnameescape')
    let s:fname = fnameescape(s:fname)
  else
    let s:fname = escape(s:fname, ' \|')
  endif
  if &mod || line('$') != 1 || getline(1) != ''
    exe "new " . s:fname
  else
    exe "edit " . s:fname
  endif
  unlet s:fname
endif
syn clear
nohlsearch


func! s:get_color()
  let colors = []
  call cursor(1,1)
  while search('^\s\+" ==== ','W')
    let s = getline('.')
    let l = split(s, '\s\+" ==== ')
    let l = split(l[0], '\s\+')
    call remove(l, 2, 6)
    call add(colors, l)
    "echo l
  endwhile
  call cursor(1,1)
  let s:colors = colors
endfunc
func! s:get_palette()
  let palette = []
  call cursor(1,1)
  while search('\s\+====$','W')
    let s = getline('.')
    let l = split(s, '\s\+====$' )
    let l = split(l[0], '"\s\+')
    let s = l[0]
    call add(palette, s)
    "echo s
  endwhile
  let s:palette = palette
  call cursor(1,1)
endfunc
func! s:show_palette()
  let colors = s:colors
  for c in colors
    let cmd = 'let ' .c[0]. ' = "' .c[1]. '"'
    exec cmd
  endfor
  let palette = s:palette
  for each in palette
    let keys = split(each, " ")
    for k in keys
      let cmdSy = ["syn keyword c_"]
      let cmdHi = ["hi c_"]
      let c = split(k, "__")
      " amazing 2 let
      exec join(["let cf = "] + [c[0]], "")
      exec join(["let cb = "] + [c[1]], "")
      let cmdSy = cmdSy + [k] + [" "] + [k]
      let cmdHi = cmdHi+[k]+[" "]+["guifg="]+[cf]+[" "]+["guibg="]+[cb]
      exec join(cmdSy, "")
      exec join(cmdHi, "")
    endfor
  endfor
endfunc


call s:get_color()
call s:get_palette()
call s:show_palette()


" +++++++++ color name ++++++++++
  " ==== xxxx #101a10 016 026 016  - theme
  "
  " ==== blck #000000 000 000 000 黑 black
  " ==== grdk #404040 064 064 064  - -
  " ==== grey #808080 128 128 128 灰 grey
  " ==== grlt #c0c0c0 192 192 192  - -
  " ==== whte #ffffff 255 255 255 白 white
  "
  " ==== rrrr #ff0000 255 000 000 红 red
  " ==== oooo #ff8000 255 128 000 橙 orange
  " ==== yyyy #ffff00 255 255 000 黄 yellow
  " ==== llll #80ff00 128 255 000 柠 lime
  " ==== gggg #00ff00 000 255 000 绿 green
  " ==== ssss #00ff80 000 255 128 春 spring
  " ==== cccc #00ffff 000 255 255 青 cyan
  " ==== aaaa #0080ff 000 128 255 蔚 azure
  " ==== bbbb #0000ff 000 000 255 蓝 blue
  " ==== vvvv #8000ff 128 000 255 紫 violet
  " ==== mmmm #ff00ff 255 000 255 洋 magenta
  " ==== pppp #ff0080 255 000 128 粉 pink
  "
  " ==== rrgy #c06060 192 096 096  - -
  " ==== oogy #c09060 192 144 096  - -
  " ==== yygy #c0c060 192 192 096  - -
  " ==== llgy #90c060 144 192 096  - -
  " ==== gggy #60c060 096 192 096  - -
  " ==== ssgy #60c090 096 192 144  - -
  " ==== ccgy #60c0c0 096 192 192  - -
  " ==== aagy #6090c0 096 144 192  - -
  " ==== bbgy #6060c0 096 096 192  - -
  " ==== vvgy #9060c0 144 096 192  - -
  " ==== mmgy #c060c0 192 096 192  - -
  " ==== ppgy #c06090 192 096 144  - -
  "                                - -
  " ==== rrlt #ff8080 255 128 128  - -
  " ==== oolt #ffc080 255 192 128  - -
  " ==== yylt #ffff80 255 255 128  - -
  " ==== lllt #c0ff80 192 255 128  - -
  " ==== gglt #80ff80 128 255 128  - -
  " ==== sslt #80ffc0 128 255 192  - -
  " ==== cclt #80ffff 128 255 255  - -
  " ==== aalt #80c0ff 128 192 255  - -
  " ==== bblt #8080ff 128 128 255  - -
  " ==== vvlt #c080ff 192 128 255  - -
  " ==== mmlt #ff80ff 255 128 255  - -
  " ==== pplt #ff80c0 255 128 192  - -
  "                                - -
  " ==== rrdk #800000 128 000 000  - -
  " ==== oodk #804000 128 064 000  - -
  " ==== yydk #808000 128 128 000  - -
  " ==== lldk #408000 064 128 000  - -
  " ==== ggdk #008000 000 128 000  - -
  " ==== ssdk #008040 000 128 064  - -
  " ==== ccdk #008080 000 128 128  - -
  " ==== aadk #004080 000 064 128  - -
  " ==== bbdk #000080 000 000 128  - -
  " ==== vvdk #400080 064 000 128  - -
  " ==== mmdk #800080 128 000 128  - -
  " ==== ppdk #800040 128 000 064  - -


