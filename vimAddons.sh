#!/bin/bash

#mkdir ~/.vim/bundle
mkdir -p ~/.vim/autoload ~/.vim/bundle 
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd ~/.vim/bundle

git clone https://github.com/Lokaltog/vim-powerline.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/scrooloose/nerdtree.git
#git clone git://github.com/majutsushi/tagba ##Needs dependancies
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/honza/vim-snippets.git


