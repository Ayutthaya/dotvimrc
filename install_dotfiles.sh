cd ~
ln -s ~/dotvimrc/dotfiles/vimrc ~/.vimrc
ln -s ~/dotvimrc/dotfiles/bashrc ~/.bashrc
ln -s ~/dotvimrc/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotvimrc/dotfiles/git-completion.bash ~/.git-completion.bash

if [ -e ~/.vim ]
then
    echo "~/.vim already exists"
else
    ln -s ~/dotvimrc ~/.vim
fi
