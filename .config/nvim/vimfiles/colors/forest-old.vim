" Vim color file
" Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
" Last Change:	2021.03.18


let g:colors_name = "forest"
hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif

hi Normal		guifg=LightGreen guibg=black		ctermfg=LightGreen ctermbg=Black
hi VertSplit	guifg=DarkGreen	 guibg=White	 gui=none
hi StatusLine	guifg=DarkGreen  guibg=White	 gui=none gui=bold
hi StatusLineNC guifg=DarkGreen	 guibg=Black	 gui=none gui=bold
hi Pmenu		guifg=DarkGreen	 guibg=White	 gui=none gui=bold
hi WildMenu		guifg=White		 guibg=DarkGreen gui=none 
hi PmenuSel		guifg=White		 guibg=DarkGreen gui=none 

hi Cursor		guifg=Black		 guibg=yellow	 gui=none 
hi lCursor						 guibg=DarkGrey	 gui=none 
hi MatchParen	guifg=white	 	 guibg=darkGreen gui=none
hi Visual		guifg=White		 guibg=DarkGreen gui=none			cterm=reverse 
hi Search										 gui=reverse		cterm=reverse
hi IncSearch									 gui=reverse		cterm=reverse 

hi Directory	guifg=LightBlue				ctermfg=LightCyan				
hi Title		guifg=Purple  guibg=bg  gui=bold ctermfg=LightMagenta 	       
hi SpecialKey	guifg=Yellow  guibg=bg  gui=bold ctermfg=LightBlue		  	
hi Question		guifg=Cyan    guibg=bg  gui=bold ctermfg=LightGreen   	       
hi NonText		guifg=Green   guibg=bg  gui=bold ctermfg=Blue		 	       
hi ModeMsg		guifg=Yellow  guibg=bg  gui=bold cterm=bold			  		
hi MoreMsg		guifg=Yellow  guibg=bg  gui=bold ctermfg=LightGreen		        
hi WarningMsg	guifg=Magenta guibg=bg  gui=bold ctermfg=LightRed				
hi ErrorMsg		guifg=Red	  guibg=bg  gui=bold ctermbg=DarkRed	ctermfg=White	

hi LineNr		guifg=DarkGreen				ctermfg=Yellow					
hi Comment		guifg=Orange				ctermfg=LightRed			 
hi constant		guifg=Cyan					ctermfg=lightgreen 
hi identifier	guifg=Yellow                ctermfg=lightcyan 
hi statement	guifg=LightBlue				ctermfg=yellow	   
hi preproc		guifg=Wheat					ctermfg=lightblue 
hi type			guifg=LightRed				ctermfg=lightgreen
hi special		guifg=Magenta				ctermfg=lightred  
hi ignore		guifg=Black				    ctermfg=black	             
hi Error		guifg=White guibg=DarkRed	ctermbg=Red		ctermfg=White 
hi Todo			guifg=Black guibg=Yellow	ctermbg=Yellow	ctermfg=Black 


