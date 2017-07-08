"set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
"set rtp+=/gpfs/mcs/data/users/xingui_zeng/tools/vim/usr/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('/gpfs/mcs/data/users/xingui_zeng/tools/vim/usr/bundle/')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Add all your plugins here (note older versions of Vundle used Bundleinstead of Plugin)
" 代码折叠
Plugin 'tmhedberg/SimpylFold'
" 代码缩进 
Plugin 'vim-scripts/indentpython.vim'
" 代码补全
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
" 配色
Plugin 'jnurmine/Zenburn' 
" 主题美化插件
Plugin 'altercation/vim-colors-solarized'
" 状态栏插件，可以显示当前的虚拟环境、Git分支、正在编辑的文件等信息。
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" 符号自动补全，{} () []
Plugin 'Raimondi/delimitMate'
" 代码快速查找插件
" Bundle 'ctrlpvim/ctrlp.vim'
" 静态检查python代码
Plugin 'nvie/vim-flake8'
" 标签列表
Plugin 'vim-scripts/taglist.vim'
" 接口与实现文件快速切换，如.c 和 .h 文件
Plugin 'derekwyatt/vim-fswitch'
" 文件目录显示插件
Plugin 'scrooloose/nerdtree'
" 多文件打开切换
Plugin 'fholgado/minibufexpl.vim'

" All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
"" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" 定义快捷键的前缀，即<Leader>
let mapleader=";""

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 依次遍历子窗口
nnoremap <Leader>nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap wl <C-W>l
" 跳转至左方的窗口
nnoremap wh <C-W>h
" 跳转至上方的子窗口
nnoremap wk <C-W>k
" 跳转至下方的子窗口
nnoremap wj <C-W>j
" 定义查找光标所在单词的快捷键
nnoremap f *
" 定义快捷键在结对符之间跳转
nmap <Leader>m %
" 开启实时搜索功能
set incsearch
" 高亮显示搜索结果
set hlsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
" set cursorline
" 禁止折行
set nowrap
" 开启语法高亮功能
syntax enable
" " 允许用指定语法高亮配色方案替换默认方案
syntax on
" 定义快捷键到行首和行尾
nmap <Leader>b 0
nmap <Leader>e $
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
set foldlevel=99
" Enable folding with the spacebar 
nnoremap <space> za
" 开启自动缩进，set autoindent
set ai
" 显示输入的命令
set showcmd
" 关闭错误响铃
set noerrorbells
" 开启可视化响铃，终端错误，屏幕闪烁
set visualbell
" 加载主题
set background=dark
colorscheme solarized
"colo zenburn 
" diff时，加在另一主题
"if &diff
""    colors elflord
"endif
" 设置F9为切换粘贴模式快捷键
set pastetoggle=<F9>
" 新分割窗口位于下方
set splitbelow
" 新分割窗口位于右方
set splitright
" 设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" 清除vim退出的界面残留
set term=xterm


filetype plugin on
"syn on

let g:pydiction_location = '/home/jianzhong_teng/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 3 



au BufNewFile,BufRead *.py  set tabstop=4 
au BufNewFile,BufRead *.py  set softtabstop=4
au BufNewFile,BufRead *.py  set shiftwidth=4
au BufNewFile,BufRead *.py  set textwidth=109
au BufNewFile,BufRead *.py  set expandtab
au BufNewFile,BufRead *.py  set autoindent
au BufNewFile,BufRead *.py  set fileformat=unix

"au BufNewFile,BufRead *.py,*.c,*.h  TlistToggle

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_server_keep_logfiles='~/.vim/bundle/YouCompleteMe/err.log'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
map <Leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1

set backspace=indent,eol,start

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

" 使用Taglist显示符号/函数/标签
"nmap <Leader>tl :TlistToggle<CR>
"let Tlist_Show_One_File=1    "只显示当前文件的tags
"let Tlist_WinWidth=40        "设置taglist宽度
"let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
"let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <Leader>t :MBEbn<cr>
map <Leader>st :MBEbp<cr>

" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
