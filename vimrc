"A simple vim configuration, only autoindent, 
"syntax highlight, colorscheme, hightlight  
"current line, and bracket auto-complement 
"was set, other configurations will be gradually 
"added.
"@Author:Nike Liu
"@Date:Fri Nov 22 2019 
"@version:v0.2
"=====================
"use mouse
"=====================
set mouse=a

"=====================
"not hidden buffer
"=====================
set nohidden

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
colorscheme desert 

"=====================
"highlight current
"=====================
set cursorline
set scrolloff=999

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
set ignorecase	"ignore cases

"=====================
"fold
"=====================
"set foldenable			
set foldmethod=syntax	"open syntax fold
"0 is the highest level, set a great number to make it closed by default
setlocal foldlevel=199999999999999999
"use space to open and close the fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"=====================
"switch tab 
"=====================
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"=====================
"break for a new line
"=====================
set tw=78		"break at 78 columns
set lbr			"not break in single one word

"=====================
"C/C++ coding
"=====================
set cin					"open C/C++ autoindent by "V" + "="
set cino=:0g0t0(sus		"set autoindent style, see more by :h cino

"=====================
"encoding
"=====================
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

"====================
"vundle
"====================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive''
Plugin  'preservim/nerdtree'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"====================
"nerdtree
"====================
"open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:stdin_in") | NERDTree | endif
""ctrl" + "a" to open the NerdTree
map <C-a> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
