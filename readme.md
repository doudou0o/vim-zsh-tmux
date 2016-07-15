## 设置vim

### Vundle 安装

linux
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

./configure --prefix=/home/opt/vim/ --with-features=huge --enable-multibyte --enable-pythoninterp

windows
git clone https://github.com/gmarik/Vundle.vim.git %USERPROFILE%/vimfiles/bundle/Vundle.vim

然后进入 vim 执行BundleInstall 就可以了所有其他插件都会安装好

### 配色安装

将 Bundle中的 
/vim-colors-solarized/colors/solarized.vim
/molokai/colors/molokai.vim
复制到
~/.vim/colors/ 文件夹中

(附加)
我的系统在linux中solarized普通颜色也是蓝色和一些关键字无法区分，所以在solarized.vim文件中修改了一行
第189行
let s:base0       = "10"
base0是指普通文本，10是某个颜色替代

### 模板文件

https://github.com/honza/vim-snippets  这里下载模板或者自己写模板(看模板文件就了解如何写了)

把所有模板放到
linux
~/.vim/snippets/
~/.vim/UltiSnips/

windows
vim74/snippets/ 
vim74/UltiSnips/

### YCM 安装

windows 下
vim 版本无所谓的，下一个最高的，在vim for windows下
https://bitbucket.org/Haroogan/vim-for-windows

然后下一个YCM for windows 以及 LLVM
https://bitbucket.org/Haroogan/vim-youcompleteme-for-windows
这个下第二个版本的，不要最新的，最新的没有一些关键文件
然后不要让 Vundle 去install 自己直接复制进去

将clang.lib放到YCM/python/ 下
就可以了\#finish


linux 下
https://github.com/Valloric/YouCompleteMe
clone下来 也可以BundleUpdate
然后
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
就可以了\#finish

(如果文件不存在可以直接复制一个)

### Ctag 安装
linux 
sudo apt-get install ctags
也可以下载源码编译安装，也十分方便

windows
http://ctags.sourceforge.net/ 下载

### 高亮文件

vim74/syntax/
~/.vim/syntax


## 设置 tmux
./configure --prefix=/home/opt/tmux  [--enable-static] CFLAGS=-I/opt/userhome/icchenchen/opt/libevent/include LDFLAGS=-L/opt/userhome/icchenchen/opt/libevent/lib


## 设置 zsh
