#!/bin/bash

# This should install all of the dotfiles for a quick and easy minimum setup


# Global Vars
VIMRC_LOCATION='~/.vimrc'

function start_message(){
    echo -en "Installing basic config... \n"
}

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


function install_shortcuts(){
    # Making the startup shortcut
    cp run_browsers ~/.tools/.run_browsers
    sudo ln -s ~/.tools/.run_browsers /usr/bin/st
}

function add_bashrc() {  # Adding the bashrc contents
	cat ~/.bashrc bashrc_contents/bashrc_contents > ~/.bashrc  # Putting the concatenated text in the .bashrc
}

# The main function
function main(){
    start_message

    # Tries to install Vim basic config
    echo -en "Installing Vim...\n"
    install_vim

    echo -en "Installing the bashrc changes...\n"
	add_bashrc  # Adding the bashrc info to the local file

    # echo -en "Installing the shortcuts...\n"
    # install_shortcuts
}

# Runs the main function 
main
