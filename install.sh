#!/usr/bin/env bash

curl -fLo ~/.vimrc https://raw.githubusercontent.com/textkiller/vim_config/master/vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

case $(uname -s) in
    Darwin*)
        curl -fLo ~/.vim/coc-settings.json \
            https://raw.githubusercontent.com/textkiller/vim_config/master/macos/coc-settings.json
        ;;
    Linux*)
        curl -fLo ~/.vim/coc-settings.json \
            https://raw.githubusercontent.com/textkiller/vim_config/master/linux/coc-settings.json
        ;;
esac
