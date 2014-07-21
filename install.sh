#!/bin/bash

REQUIRE="npm node"
for i in $REQUIRE
do
    command -v $i >/dev/null && continue || { echo "$i command not found."; exit 1; }
done

BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
    if [ -L $2 ] ; then
        ln -sf $1 $2
    fi
}

echo "backing up current vim config"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.editorconfig $HOME/.tern-config; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.editorconfig $HOME/.tern-config; do [ -L $i ] && unlink $i ; done


echo "setting up symlinks"
lnif $CURRENT_DIR/vimrc $HOME/.vimrc
lnif $CURRENT_DIR/ $HOME/.vim
lnif $CURRENT_DIR/others/tern-config $HOME/.tern-config
lnif $CURRENT_DIR/others/editorconfig $HOME/.editorconfig


if [ ! -e $CURRENT_DIR/vundle ]; then
    echo "Installing Vundle"
    git clone http://github.com/gmarik/vundle.git $CURRENT_DIR/bundle/vundle
fi


echo "update/install plugins using Vundle"
system_shell=$SHELL
export SHELL="/bin/sh"
vim -u $CURRENT_DIR/vimrc +BundleInstall! +BundleClean +qall
export SHELL=$system_shell


#echo "compile YouCompleteMe"
#echo "if error,you need to compile it yourself"
#cd $CURRENT_DIR/bundle/YouCompleteMe/
#bash -x install.sh --clang-completer

echo "install ternjs dependences"
cd $CURRENT_DIR/bundle/tern_for_vim/
npm install

echo "install jshint for javascript syntax check"
sudo npm install -g jshint

#vim undo dir
if [ ! -d ~/.undodir ]
then
    mkdir -p ~/.undodir
fi
