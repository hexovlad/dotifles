#!/bin/bash

# This should install all of the dotfiles for a quick and easy minimum setup


# Global Vars
VIMRC_LOCATION='~/.vimrc'

function start_message(){
    echo -en "Installing basic config... \n"
}


# Get the PS1
function PS1_setter(){
	echo "if [ $EUID != 0 ] ; then

    export PS1="\[$(tput bold)\]\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;245m\]@\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;46m\]\H\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \A\n[\[$(tput sgr0)\]\[\033[38;5;8m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$\[$(tput sgr0)\] "

else

    export PS1='\e[1;38;5;56;48;5;234m\u \e[38;5;240mon \e[1;38;5;28;48;5;234m\h \e[38;5;54m\d \@\e[0m\n\e[0;38;5;56;48;5;234m[\w] \e[1m\$\e[0m '

" >> ~/.bashrc
}


# Installs Vim config
function install_vim(){
	# Getting vim-plug
	# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim	

	# Getting Vundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	
	# We need to install NodeJS for coc.nvim to work
	sudo apt -y install nodejs

	
	# Copy the .vimrc from here to the home folder
	cp vim/vimrc /home/$USER/.vimrc

	# Installing the Vim plugins
	vim +PluginInstall +qall
}


# The main function
function main(){
    start_message

    # Tries to install Vim basic config
    echo -en "Installing Vim...\n"
    install_vim

	echo -en "Setting the PS1... \n"
	PS1_setter 
}


# Runs the main function 
main
