## 设置vim

## 编译 vim
./configure --prefix=$HOME/opt/vim/ --with-features=huge --enable-multibyte --enable-pythoninterp

在.bashrc中增加 (若你安装了zsh 统一改为 .zshrc)
~~~
alias vim='$HOME/opt/vim/bin/vim'
~~~

### Vundle 安装
~~~
linux
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

windows
git clone https://github.com/gmarik/Vundle.vim.git %USERPROFILE%/vimfiles/bundle/Vundle.vim
~~~

然后进入 vim 执行BundleInstall 就可以了所有其他插件都会安装好

### 配色安装

将 Bundle中的  
/vim-colors-solarized/colors/solarized.vim (已经改为NeoSolarized因为该主题能够无视iterm2的主题) 
/molokai/colors/molokai.vim  
复制到  
~/.vim/colors/ 文件夹中  

如果显示不完美,试试在.bashrc中增加这段
~~~
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM-'xterm-color'
fi
~~~

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

### 编译安装 tmux

先安装libevent

./configure --prefix=~/opt/libevent/

且在.bashrc中增加(若你安装了zsh 统一改为 .zshrc)  
~~~
LIBEVENT_PATH="$HOME/opt/libevent"  
export LD_LIBRARY_PATH="$LIBEVENT_PATH/lib/:$LD_LIBRARY_PATH"
~~~

再安装tmux
~~~
./configure --prefix=$HOME/opt/tmux  CFLAGS="-I$HOME/opt/libevent/include" LDFLAGS="-L$HOME/opt/libevent/lib"
~~~

如果发生  "curses not found" 错误则需要再安装 ncurses  
~~~
wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz  
./configure --prefix=$HOME/opt/ncurses --with-shared --without-debug --enable-widec  
~~~

并且将tmux 的配置改成
~~~
./configure --prefix=$HOME/opt/tmux  
CFLAGS="-I$HOME/opt/libevent/include -I$HOME/opt/ncurses/include/ncurses -I$HOME/opt/ncurses/include"  
LDFLAGS="-L$HOME/opt/libevent/lib -L$HOME/opt/ncurses/lib"  
~~~

### 使用
在.bashrc中增加(若你安装了zsh 统一改为 .zshrc)  
~~~
alias tmux='$HOME/opt/tmux/bin/tmux'
~~~

配置在.tmux.conf中

### 配置tpm
~~~
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~~~
地址: https://github.com/tmux-plugins/tpm


## 设置 zsh

### 编译安装 zsh
如果环境中没有 zsh 且没有root权限的时候用编译安装 (用 cat /etc/shells 查看)
~~~
wget http://sourceforge.net/projects/zsh/files/zsh/5.0.7/zsh-5.0.7.tar.gz
./configure --prefix=$HOME/opt/zsh
make & make install
~~~

如果发生  "curses not found" 错误则需要再安装 ncurses  
详情请按照上一章
并且配置改为
~~~
./configure --prefix=$HOME/opt/zsh  
CFLAGS="-I$HOME/opt/ncurses/include/ncurses -I$HOME/opt/ncurses/include"  
LDFLAGS="-L$HOME/opt/ncurses/lib"
~~~

### 安装 oh-my-zsh
~~~
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
~~~

.zshrc 文件也可以用我目录下的文件稍做了一点修改
另外有zsh 我增加了我的模板在 ~/.oh-my-zsh/themes 中

### 设置zsh 默认
没有root权限时: 在 .bashrc 中曾加 exec $HOME/opt/zsh/bin/zsh -l  
有root权限时:   chsh -s /usr/local/bin/zsh

### (可配)配置powerlevel10k
~~~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
~~~

地址: https://github.com/romkatv/powerlevel10k
如果是初次使用者可以用`p10k configure`命令来指导安装
否则用自己的配置文件即可

### (可配)配置colorls
~~~
gem install colorls
~~~

地址: https://github.com/athityakumar/colorls#installation
配置文件地址
~~~
dark_colors.yaml
~/.config/colorls/dark_colors.yaml
~~~

## 设置iterm2
下载一个[字体](https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf)
当使用zsh的`ZSH_THEME="agnoster"`主题时需要

更新字体，我当前字体是
Monlo + MesloLGS NF


