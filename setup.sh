#!/usr/bin/env sh

rm "$HOME/.vimrc"
rm -r "$HOME/.vim"

cp -r vim "$HOME/.vim"
cp vimrc "$HOME/.vimrc"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
