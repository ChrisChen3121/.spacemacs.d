#!/bin/bash
sudo apt-get install exuberant-ctags python-pygments
wget ftp://ftp.gnu.org/pub/gnu/global/global-6.5.5.tar.gz
tar -zvxf global-6.5.5.tar.gz
cd global-6.5.5
./configure --with-exuberant-ctags=ctags # --with-universal-ctags=ctags #to support rust
make && make install
