"========================================= 
"vim配置设置 
"========================================= 
set go=
set nu
set nocompatible         "取消vi兼容
set cmdheight=2
set ruler                "始终显示光标位置
set scrolloff=5          "光标移动时保留5行
set sidescrolloff=5      "光标移动时保留5位
"设置字体 
set guifont=Monaco 
"设置编码
set encoding=utf-8
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set fileencodings=utf-8,ucs-bom,chinese
"语言设置
set langmenu=zh_CN.UTF-8
"语法高亮
syntax enable
syntax on
"配色方案
colorscheme evening
colo evening
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
"设置缩进
set smartindent         "智能缩进"
set softtabstop=4
set shiftwidth=4        "行交错"
set autoindent          "自动对齐"
set smartindent         "自动缩进
set cindent             "c语言缩进"
set tabstop=4           "tab为四个空格"
set expandtab           "tab用空格代替
if &term=="xterm"
set t_Co=8
set t_Sb=^[[4%dm
set t_Sf=^[[3%dm
endif
"文件自动检测
filetype on
"设置taglist
let Tlist_Show_One_File=0        "显示多个文件的tags
let Tlist_File_Fold_Auto_Close=1 "非当前文件
let Tlist_Exit_OnlyWindow=1      "当taglist是最后一个窗口时推出vim
let Tlist_Use_SingleClick=1      "单击跳转
let Tlist_GainFocus_On_ToggleOpen=1 "打开taglist时获得输入焦点
let Tlist_Process_File_Always=1  "taglist 始终解析
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
set nowb
"折叠
set foldenable
set foldmethod=syntax
set foldlevel=100
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo') <CR>

"================================= 
"vim-powerline
"================================= 
set laststatus=2
let g:Powerline_symbols='unicode'

"================================= 
"vundle配置 
"================================= 
filetype off "bundle required
  
set rtp+=~/.vim/bundle/vundle/  
call vundle#rc()  
  
" let Vundle manage Vundle     
Bundle 'gmarik/vundle'  
  
" My Bundles here:  /* 插件配置格式 */  
     
" original repos on github 
"（Github网站上非vim-scripts仓库的插件，按下面格式填写）
  
"Bundle "Lokaltog/vim-powerline"
"Bundle 'tpope/vim-fugitive'  
"Bundle 'Lokaltog/vim-easymotion'  
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}  
"Bundle 'tpope/vim-rails.git'  

" vim-scripts repos  
"（vim-scripts仓库里的，按下面格式填写）  
"Bundle 'L9'    
Bundle 'winmanager'
Bundle 'ctags.vim' 
Bundle 'taglist.vim'
"Bundle 'SuperTab.vim'
"Bundle 'The-NERD-tree'

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
let g:winManagerWindowLayout='FileExplorer|TagList'

"映射WinManager快捷键，在normal模式下按mt，控制开启和关闭 
nmap <silent> wm :WMToggle<cr>
"设置WinManager宽度 
let g:winManagerWidth = 30 

"在进入vim时自动打开winmanager,打开=1,关闭=0 
let g:AutoOpenWinManager = 1 

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

"不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Show_One_File=1 
"如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Exit_OnlyWindow=1 

"================================== 
" SuperTab配置 
"================================== 
let g:SuperTabRetainCompletionType=2
" 0 - 不记录上次的补全方式
" 1 - 记住上次的补全方式,直到用其他的补全命令改变它
" 2 - 记住上次的补全方式,直到按ESC退出插入模式为止
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
" 设置按下<Tab>后默认的补全方式, 默认是<C-P>, 
" 现在改为<C-X><C-O>. 关于<C-P>的补全方式, 
