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
"编辑vim配置文件 
if has('unix') 
    set fileformats=unix,dos,mac 
    nmap <Leader>e :tabnew $HOME/.vimrc<CR> 
    let $VIMFILES = $HOME.'/.vim' 
else 
    set fileformats=dos,unix,mac 
    nmap <Leader>e :tabnew $VIM/_vimrc<CR> 
    let $VIMFILES = $VIM.'/vimfiles' 
endif

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
    set encoding=gbk
    set fileencoding=chinese
endif

"语言设置
set langmenu=zh_CN.UTF-8
"语法高亮
syntax enable
syntax on
"配色方案
set background=light
colorscheme solarized
" 高亮显示当前行/列 
set cursorline 
"set cursorcolumn
"可以使用鼠标
set mouse=a
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
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf
function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
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
"折叠
set foldenable
set foldmethod=syntax
set foldlevel=100
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo') <CR>
" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start
" Buffers操作快捷方式! 
nmap <c-l> :bnext<CR> 
nmap <c-h> :bprevious<CR> 

"================================= 
"vim-airline
"================================= 
set laststatus=2
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

"================================= 
"vundle配置 
"================================= 
filetype off "bundle required
if has('unix') 
    set rtp+=~/.vim/bundle/vundle/
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
Bundle "vim-scripts/TagHighlight"
Bundle "scrooloose/syntastic"
Bundle "SirVer/ultisnips"
"Bundle "Lokaltog/vim-powerline"

" vim-scripts repos  
"（vim-scripts仓库里的，按下面格式填写）  
"Bundle 'L9'    
Bundle 'winmanager'
Bundle 'ctags.vim' 
Bundle 'taglist.vim'
"Bundle 'SuperTab.vim'
Bundle 'The-NERD-tree'

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
let Tlist_File_Fold_Auto_Close=1 "非当前文件
let Tlist_Use_SingleClick=1      "单击跳转
let Tlist_GainFocus_On_ToggleOpen=1 "打开taglist时获得输入焦点
let Tlist_Process_File_Always=1  "taglist 始终解析
"不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Show_One_File=1 
"如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Exit_OnlyWindow=1 
let Tlist_Show_Menu=1 "显示taglist菜单

"================================== 
" NERDTree配置
"================================== 
let NERDTreeShowBookmarks = 1
let NERDTreeShowLineNumbers =1 
let NERDTreeStatusline = 0
let NERDChristmasTree = 1

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
