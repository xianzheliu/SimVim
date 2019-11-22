"A simple vim configuration, only autoindent, 
"syntax highlight, colorscheme, hightlight  
"current line, and bracket auto-complement 
"was set, other configurations will be gradually 
"added.
"@Author:Nike Liu
"@Date:Fri Nov 22 2019 
"@version:v0.1
"=====================
"autoindent
"=====================
set autoindent
set cindent				"use C style indent
set shiftwidth=4 		"set the shift width of indent
set tabstop=4			"set the whitespace number of tab
set softtabstop=4		"if there two different above, it works

"=====================
"number and syntax
"=====================
set nu
syntax on

"=====================
"colorscheme
"=====================
colorscheme ron

"=====================
"highlight current
"=====================
"set cursorline

"=====================
"autocomplete brackets
"=====================
"inoremap map the key for the insert mode,
" in case vim gets stuck in a infinite loop.
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap [ []<ESC>i
inoremap ( ()<ESC>i
inoremap { {<CR>}<ESC>O

"While type the left-bracket will jump into 
"the right-bracket.
set showmatch

"=====================
"autonewline
"=====================
"b				backspace in Normal or Visual
"s				whitespace	in Normal or Visual
"h,l,<,>		direction key in Normal or Visual
"[ and ]		direction key in Insert or Replace
set whichwrap=b,s,h,l,<,>,[,]

"=====================
"autocomplete ins
"=====================
set wildmenu

"=====================
"search
"=====================
set is			"immediate search
set hls			"highlight string

"=====================
"encoding
"=====================
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

"=====================
"dir tree(netrw)
"=====================
let g:netrw_winsize=20
let g:netrw_liststyle=3			"use tree mode
let g:netrw_banner=0			"show no banner
let g:netrw_browse_split=3		"open file in new tab
"let g:netrw_browse_split=4		" go back previous window

