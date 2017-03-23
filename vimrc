"========================================= 
"vim配置设置 
"========================================= 
"set go=r
if has("gui_running") 
    set guioptions+=m " 隐藏菜单栏 
    set guioptions-=T " 隐藏工具栏 
    set guioptions-=L " 隐藏左侧滚动条 
    set guioptions+=r " 隐藏右侧滚动条 
    set guioptions-=b " 隐藏底部滚动条 
    set showtabline=0 " 隐藏Tab栏 
endif
" 定义 <Leader> 为逗号
let mapleader = ","
let maplocalleader = ","

set nu
set nocompatible         "取消vi兼容
set cmdheight=2
set ruler                "始终显示光标位置
set scrolloff=5          "光标移动时保留5行
set sidescrolloff=5      "光标移动时保留5位
"设置字体 
"set guifont=Monaco 
"set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" 禁止折行 
set nowrap
"设置编码
if has('unix') 
    set encoding=UTF-8
    set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
    set fileencodings=utf-8,ucs-bom,chinese
else 
    set encoding=utf-8
    set fileencoding=chinese
endif

"语言设置
set langmenu=zh_CN.UTF-8
"语法高亮
syntax enable
syntax on
syntax sync minlines=128
syntax sync maxlines=256
set synmaxcol=800
"配色方案
set background=light
colorscheme solarized
"colorscheme molokai
" 高亮显示当前行/列 
set cursorline 
"set cursorcolumn
hi CursorLine  cterm=NONE  ctermbg=black  ctermfg=NONE
"可以使用鼠标
set mouse=c
set selection=exclusive
set selectmode=mouse,key
"实时匹配搜索文本 
set incsearch 
"搜索时高亮现实被找到的文本 
set hlsearch 
"高亮匹配括号
set showmatch
"括号自动补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf
function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf
"设置缩进
set smartindent         "智能缩进"
set softtabstop=4
set shiftwidth=4        "行交错"
set autoindent          "自动对齐"
set smartindent         "自动缩进
set cindent             "c语言缩进"
set tabstop=4           "tab为四个空格"
set expandtab           "tab用空格代替

"文件自动检测
filetype on
"设置自动补全
filetype plugin indent on        "检测文件类型
set completeopt=longest,menu     "关掉预览窗口
"智能补全 
autocmd FileType python set omnifunc=pythoncomplete#Complete 
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 
autocmd FileType css set omnifunc=csscomplete#CompleteCSS 
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags 
autocmd FileType php set omnifunc=phpcomplete#CompletePHP 
autocmd FileType c set omnifunc=ccomplete#Complete 
autocmd FileType java set omnifunc=javacomplete#Complete 
"不要备份文件
set nobackup
set noswapfile
set nowb
"与windows共享剪贴板
set clipboard=unnamed
nmap <c-a> ggVG
nmap <c-s> :w<CR>

"折叠
set foldenable
"set foldmethod=syntax
set foldmethod=indent
set foldlevel=100
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo') <CR>
" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start
" Buffers操作快捷方式
nmap <c-l> :bnext<CR> 
nmap <c-h> :bprevious<CR>

nmap <s-j> <c-d>
nmap <s-k> <c-u>
" 插入模式下快捷方式
imap <c-j> <esc>ja
imap <c-k> <esc>ka
imap <c-h> <esc>i
imap <c-l> <esc>la
imap jk <esc>

"================================= 
"vim-airline
"================================= 
set laststatus=2
let g:airline_theme='base16'
"let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

"================================= 
"vundle配置 
"================================= 
filetype off "bundle required
if has('unix') 
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#rc()
else 
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim
    call vundle#rc('$VIM/vimfiles/bundle/')
endif

" let Vundle manage Vundle     
Bundle 'gmarik/vundle'  
  
" My Bundles here:  /* 插件配置格式 */  
     
" original repos on github 
"（Github网站上非vim-scripts仓库的插件，按下面格式填写）
  
Bundle "bling/vim-airline"
Bundle "altercation/vim-colors-solarized"
Bundle "tomasr/molokai"
Bundle "Yggdroot/indentLine"
Bundle "vim-scripts/TagHighlight"
Bundle "scrooloose/syntastic"
Bundle "SirVer/ultisnips"
Bundle "Valloric/YouCompleteMe"
"变量高亮
"Bundle "jaxbot/semantic-highlight.vim"

" vim-scripts repos  
"（vim-scripts仓库里的，按下面格式填写）  
"Bundle 'L9'    
Bundle 'winmanager'
Bundle 'ctags.vim' 
Bundle 'taglist.vim'
"Bundle 'SuperTab.vim'
Bundle 'The-NERD-tree'
Bundle 'pyflakes.vim'

" non github repos   
"(非上面两种情况的，按下面格式填写)  
"Bundle 'git://git.wincent.com/command-t.git'     
  
filetype plugin indent on     " required!   /** vimrc文件配置结束 **/  
"/** vundle命令 **/  
" Brief help  
" :BundleList          - list configured bundles  
" :BundleInstall(!)    - install(update) bundles  
" :BundleSearch(!) foo - search(or refresh cache first) for foo   
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles  


"================================== 
"WinManager配置 
"================================== 
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='NERDTree|TagList'

"映射WinManager快捷键，在normal模式下按mt，控制开启和关闭 
" 键盘映射，同时加入防止因winmanager和nerdtree冲突而导致空白页的语句
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>
"设置WinManager宽度 
let g:winManagerWidth = 30 

"在进入vim时自动打开winmanager,打开=1,关闭=0 
let g:AutoOpenWinManager = 1

let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start() 
    exe 'NERDTree'
endfunction 
function! NERDTree_IsValid() 
    return 1 
endfunction
"================================== 
"ctags配置 
"================================== 
"当前目录找不到tag元文件，则向上查找 
set tags=tags; 
"设置当前目录为当前打开文件所在目录 
set autochdir 

"================================== 
"taglist配置 
"================================== 
let Tlist_File_Fold_Auto_Close=0 "非当前文件
let Tlist_Use_SingleClick=1      "单击跳转
let Tlist_GainFocus_On_ToggleOpen=1 "打开taglist时获得输入焦点
let Tlist_Process_File_Always=1  "taglist 始终解析
"不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Show_One_File=1 
"如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Exit_OnlyWindow=1 
let Tlist_Show_Menu=0 "显示taglist菜单

"================================== 
" indentLine配置
"================================== 
" 设置Gvim的对齐线样式

"    let g:indentLine_char = "┊"
"    let g:indentLine_first_char = "┊"
let g:indentLine_char = "|"
let g:indentLine_first_char = "|"

" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
" let g:indentLine_color_term = 239

" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7

"================================== 
" NERDTree配置
"================================== 
let NERDTreeShowBookmarks = 1
let NERDTreeShowLineNumbers =1 
let NERDTreeStatusline = 0
"let NERDChristmasTree = 1
let NERDTreeMinimalUI=1

function! ToggleTree()
    if !exists("g:openNerd")
        NERDTree
        let g:openNerd = 1
    elseif g:openNerd == 1
        let g:openNerd = 0
        NERDTreeClose
    elseif g:openNerd != 1
        let g:openNerd = 1
        NERDTree
    endif
endfunction
"================================== 
" syntastic配置
"================================== 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let ycm_show_diagnostics_ui = 0

"================================== 
" UltiSnips配置
"================================== 
let g:UltiSnipsExpandTrigger="<leader><tab>" 
let g:UltiSnipsJumpForwardTrigger="<leader><tab>" 
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
"let g:UltiSnipsSnippetDirectories=["mysnippets"] 
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]

	"================================== 
	" YouCompleteMe配置
	"================================== 
	" YCM 补全菜单配色 
	" 菜单 
	" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5 
	" 选中项 
	" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900 
	" let g:ycm_global_ycm_extra_conf = '$VIM/vimfiles/bundle/YouCompleteMe/python/.ycm_extra_conf.py'

	let g:ycm_complete_in_comments=1		" 补全功能在注释中同样有效 
	let g:ycm_confirm_extra_conf=0			" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示 
	let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 标签补全引擎 
	"tags set tags+=/data/misc/software/misc./vim/stdcpp.tags " 引入 C++ 标准库
	inoremap <leader>; <C-x><C-o>			" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键 
	set completeopt-=preview			" 补全内容不以分割子窗口形式出现，只显示补全列表 
	let g:ycm_min_num_of_chars_for_completion=1	" 从第一个键入字符就开始罗列匹配项 
	let g:ycm_cache_omnifunc=0			" 禁止缓存匹配项，每次都重新生成匹配项
	let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全 

	nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
	
	nnoremap <Leader>s :SemanticHighlightToggle<cr>
