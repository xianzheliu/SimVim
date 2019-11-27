[Toc]

# 1. Useful instruction

## 1.1 global 

全局命令 `:g` 在 Vim 中有着意想不到强大的功能。当想要在整个文件中对于匹配的行或者不匹配行进行一些操作时，应该第一时间想到这个 `:g` 命令。

```
:[range]global[!]/{pattern}/{command}
```

- [range] 指定文本范围,默认为整个文档

- pattern 在范围 range 内的行如果匹配 pattern，则执行 command

- ! 表示取反，也就是不匹配的行，也可以使用 `vglobal`

- command 默认是打印文本

- 常用的 command 可以参考如下例子：

  - d 删除
  - m 移动
  - t 拷贝
  - s 替换

- Example

  ```
  :10,200g/pattern/d		#删除20～200内匹配的行
  :g!/pattern/d			#删除不匹配的行
  :g/pattern/s/$/mytext	#在匹配的行后添加文字
  ```

# 2. RegExpr

vim毕竟是个编辑器，正则表达式中包含的大量元字符如果原封不动地引用（像perl那样）， 势必会给不懂正则表达式的人造成麻烦。于是，vim就规定，正则表达式的元字符必须用反斜杠进行转义才行。但是，像 **.**和 ***** 这种极其常用的元字符，都加上反斜杠就太麻烦了。于是vim只将除了  **.** / ***** / **$ ** / **^** 还有**[ ]**之外的字符加上反斜线。

可以通过 \v 和 \V来开关这一设定。 * \v（即 very magic 之意）：任何元字符都不用加反斜杠 * \V（即 very nomagic 之意）：任何元字符都必须加反斜杠

- Example

  ```
  /\v(a.c){3}$   # 查找行尾的abcaccadc
  /\m(a.c){3}$   # 查找行尾的(abc){3}
  /\M(a.c){3}$   # 查找行尾的(a.c){3}
  /\V(a.c){3}$   # 查找任意位置的(a.c){3}$
  ```

# 3.  Advanced tricks

`%`  跳转到光标所在括号的匹配

`:Lex` 打开目录

`ctrl-g` 查看当前文件信息

`''`  两个单引号会回到同一文件的上一跳转位置

`bp`  回到上一次跳转

`gD`  查找全局定义 

`ctrl+p/n` 在插入模式下自动搜索输入历史，根据输入历史补全

`#` 等价于gD

`ctrl-u/d` 翻半页

# 4. Tab usage

`:tab new filename` 		

`:tabc`			关闭tab

`gt` `gT`   切换tab

# 5. Vim Configuration, Indent, Highlight, Auto-complement

```shell
  1 "A simple vim configuration, only autoindent, 
  2 "syntax highlight, colorscheme, hightlight  
  3 "current line, and bracket auto-complement 
  4 "was set, other configurations will be gradually 
  5 "added.
  6 "@Author:Nike Liu
  7 "@Date:Fri Nov 22 2019 
  8 "@version:v0.1
  9 "=====================
 10 "autoindent
 11 "=====================
 12 set autoindent
 13 set cindent             "use C style indent
 14 set shiftwidth=4        "set the shift width of indent
 15 set tabstop=4           "set the whitespace number of tab
 16 set softtabstop=4       "if there two different above, it works
 17 
 18 "=====================
 19 "number and syntax
 20 "=====================
 21 set nu
 22 syntax on
 23 
 24 "=====================
 25 "colorscheme
 26 "=====================
 27 colorscheme zellner
 28 
 29 "=====================
 30 "highlight current
 31 "=====================
 32 "set cursorline
 33 
 34 "=====================
 35 "autocomplete brackets
 36 "=====================
 37 "inoremap map the key for the insert mode,
 38 " in case vim gets stuck in a infinite loop.
 39 inoremap ' ''<ESC>i
 40 inoremap " ""<ESC>i
 41 inoremap [ []<ESC>i
 42 inoremap ( ()<ESC>i
 43 inoremap { {<CR>}<ESC>O
 44 
 45 "While type the left-bracket will jump into 
 46 "the right-bracket.
 47 set showmatch
 48 
 49 "=====================
 50 "autonewline
 51 "=====================
 52 "b              backspace in Normal or Visual
 53 "s              whitespace  in Normal or Visual
 54 "h,l,<,>        direction key in Normal or Visual
 55 "[ and ]        direction key in Insert or Replace
 56 set whichwrap=b,s,h,l,<,>,[,]
 57 
 58 "=====================
 59 "autocomplete ins
 60 "=====================
 61 set wildmenu
 62 
 63 "=====================
 64 "search
 65 "=====================
 66 set is          "immediate search
 67 set hls         "highlight string
 68 
 69 "=====================
 70 "encoding
 71 "=====================
 72 set encoding=utf-8
 73 set langmenu=zh_CN.UTF-8
 74 language message zh_CN.UTF-8
 75 
 76 "=====================
 77 "dir tree(netrw)
 78 "=====================
 79 let g:netrw_winsize=20
 80 let g:netrw_liststyle=3         "use tree mode
 81 let g:netrw_banner=0            "show no banner
 82 let g:netrw_browse_split=3      "open file in new tab
 83 "let g:netrw_browse_split=4     "go back previous window
```

## Reference

[1] https://blog.csdn.net/xiaokangboy/article/details/79672015

[2] https://shapeshed.com/vim-netrw/

# 6. Plugin

# 6.1 cscope

**安装步骤**

1. `sudo apt-get install cscope `
2. 将`autoload_cscope.vim` 放到`～/.vim/plugin`下

**简单使用**

​	`:cs -h` 简单易懂

**高级用法**

:vert scs  f s foo  查找并水平分割当前窗口