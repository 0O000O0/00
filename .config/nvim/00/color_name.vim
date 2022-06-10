" VIM script for add your own color name to rgb.txt file
" Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
" Last Change:	2021.04.08



" edit this file, then do ":source %", and check if the colors match

func! s:init_color()
	let s:colorX = [
				\ " xxxx 016 026 016 #1a0d1a theme      " ,
        \
				\ " blck 000 000 000 #000000 black   黑 " ,
				\ " grdk 064 064 064 #404040            " ,
				\ " grey 128 128 128 #808080 grey    灰 " ,
				\ " grlt 192 192 192 #c0c0c0            " ,
				\ " whte 255 255 255 #ffffff white   白 " , ]
	let s:colorP = [
				\ " rrrr 255 000 000 #ff0000 red     红 " ,
				\ " oooo 255 128 000 #ff8000 orange  橙 " ,
				\ " yyyy 255 255 000 #ffff00 yellow  黄 " ,
				\ " llll 128 255 000 #80ff00 lime    柠 " ,
				\ " gggg 000 255 000 #00ff00 green   绿 " ,
				\ " ssss 000 255 128 #00ff80 spring  春 " ,
				\ " cccc 000 255 255 #00ffff cyan    青 " ,
				\ " aaaa 000 128 255 #0080ff azure   蔚 " ,
				\ " bbbb 000 000 255 #0000ff blue    蓝 " ,
				\ " vvvv 128 000 255 #8000ff violet  紫 " ,
				\ " mmmm 255 000 255 #ff00ff magenta 洋 " ,
				\ " pppp 255 000 128 #ff0080 pink    粉 " , ]
	let colors = s:colorP
	let clrsDk = []
	let clrsLt = []
  let clrsGy = []
	for each in colors
		let clr = split(each, " ")
		let rgbs = [clr[1]] + [clr[2]] + [clr[3]]
		let clrDk = [join([strpart(clr[0],0,2)] + ["dk"], "")]
		let clrLt = [join([strpart(clr[0],0,2)] + ["lt"], "")]
		let clrGy = [join([strpart(clr[0],0,2)] + ["gy"], "")]
		for rgb in rgbs
			if 0
			elseif rgb == 255
				let rgb = 16*3*4
			elseif rgb == 000
				let rgb = 16*3*2
			else
				let rgb = 16*3*3
			endif
			let rgb = printf("%03d", rgb)
			call add(clrGy, rgb)
		endfor
		for rgb in rgbs
			if rgb == 255
				let rgb = 255
			else
				let rgb = rgb+(256-rgb)/2
			endif
			let rgb = printf("%03d", rgb)
			call add(clrLt, rgb)
		endfor
		for rgb in rgbs
			if rgb == 255
				let rgb = 128
      else
			  let rgb = rgb/2
      endif
			let rgb = printf("%03d", rgb)
			call add(clrDk, rgb)
		endfor
      "echo clrGy
      "echo clrDk
      "echo clrLt
    call add(clrsGy, join(clrGy, " "))
		call add(clrsDk, join(clrDk, " "))
		call add(clrsLt, join(clrLt, " "))
	endfor
  let s:colorG = clrsGy
	let s:colorD = clrsDk
	let s:colorL = clrsLt
endfunc

func! s:get_colors() " color all
	let colors = s:colorX+s:colorP+s:colorG+s:colorL+s:colorD
	let clrs = []
	for each in colors
		let clr = split(each, " ")
    let rgbX = join(["#"] +
                 \ [printf("%02x", str2nr(clr[1],"10"))] +
                 \ [printf("%02x", str2nr(clr[2],"10"))] +
                 \ [printf("%02x", str2nr(clr[3],"10"))]  , "")
		let clr = [clr[0]]+[rgbX]+[clr[1]]+[clr[2]]+[clr[3]]
		call add(clrs, join(clr, " "))
	endfor
	let s:colors = clrs
endfunc

" insert own color to the rgb.txt
func! s:add_colors()
	" if rgb.txt not exist, new it
	let path = "../rgb.txt"
	call writefile([], path, "a")
	let line0 = ""
	let list0 = []
	let listC = readfile(path, "", 1)
	" check, is it file empty
	if listC != list0
		let line0 = listC[0]
	endif
	" check, is it color insert
	let ttlT = ["========== add color name by JC =========="]
	if line0 !~ ttlT[0]
		let rgbS = readfile(path, "")
		let clrA = s:colors
		"let rgbT = ["*"] + ttlT + clrA + ["",""] + rgbS
		let rgbT = ttlT + clrA + ["",""] + rgbS
		call delete(path)
		call writefile(rgbT, path, "a")
	else
	    "echo "already done"
	endif
endfunc


call s:init_color()
call s:get_colors()
call s:add_colors()


