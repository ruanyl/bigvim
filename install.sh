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
lnif $CURRENT_DIR/others/eslintrc $HOME/.eslintrc


if [ ! -e $CURRENT_DIR/autoload/plug.vim ]; then
    echo "Installing Vim-Plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


echo "update/install plugins using vim-plug"
system_shell=$SHELL
export SHELL="/bin/sh"
vim -u $CURRENT_DIR/vimrc +PlugInstall! +PlugClean +qall
export SHELL=$system_shell

echo "install eslint for javascript syntax check"
command -v eslint >/dev/null || npm install -g eslint

#vim undo dir
if [ ! -d ~/.undodir ]
then
    mkdir -p ~/.undodir
fi
