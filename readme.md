## ����vim

### Vundle ��װ

linux
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

windows
git clone https://github.com/gmarik/Vundle.vim.git %USERPROFILE%/vimfiles/bundle/Vundle.vim

Ȼ����� vim ִ��BundleInstall �Ϳ�������������������ᰲװ��

### ��ɫ��װ

�� Bundle�е� 
/vim-colors-solarized/colors/solarized.vim
/molokai/colors/molokai.vim
���Ƶ�
~/.vim/colors/ �ļ�����

(����)
�ҵ�ϵͳ��linux��solarized��ͨ��ɫҲ����ɫ��һЩ�ؼ����޷����֣�������solarized.vim�ļ����޸���һ��
��189��
let s:base0       = "10"
base0��ָ��ͨ�ı���10��ĳ����ɫ���

### ģ���ļ�

https://github.com/honza/vim-snippets  ��������ģ������Լ�дģ��(��ģ���ļ����˽����д��)

������ģ��ŵ�
linux
~/.vim/snippets/
~/.vim/UltiSnips/

windows
vim74/snippets/ 
vim74/UltiSnips/

### YCM ��װ

windows ��
vim �汾����ν�ģ���һ����ߵģ���vim for windows��
https://bitbucket.org/Haroogan/vim-for-windows

Ȼ����һ��YCM for windows �Լ� LLVM
https://bitbucket.org/Haroogan/vim-youcompleteme-for-windows
����µڶ����汾�ģ���Ҫ���µģ����µ�û��һЩ�ؼ��ļ�
Ȼ��Ҫ�� Vundle ȥinstall �Լ�ֱ�Ӹ��ƽ�ȥ

��clang.lib�ŵ�YCM/python/ ��
�Ϳ�����\#finish


linux ��
https://github.com/Valloric/YouCompleteMe
clone���� Ҳ����BundleUpdate
Ȼ��
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
�Ϳ�����\#finish

(����ļ������ڿ���ֱ�Ӹ���һ��)

### Ctag ��װ
linux 
sudo apt-get install ctags
Ҳ��������Դ����밲װ��Ҳʮ�ַ���

windows
http://ctags.sourceforge.net/ ����

### �����ļ�

vim74/syntax/
~/.vim/syntax