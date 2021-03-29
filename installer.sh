#!/bin/bash

# This should install all of the dotfiles for a quick and easy minimum setup


# Global Vars
VIMRC_LOCATION='~/.vimrc'

function start_message(){
    echo -en "Installing basic config...\n"
}

function install_vim(){
    if [ ! -f "$VIMRC_LOCATION" ]; then
        # File is not found so we make the config
        touch $VIMRC_LOCATION 
        echo -en "set number\nsyntax on\n" >> $VIMRC_LOCATION
    fi
}

function install_shortcuts(){
    # Making the startup shortcut
    cp run_browsers ~/.tools/.run_browsers
    sudo ln -s ~/.tools/.run_browsers /usr/bin/st
}

# The main function
function main(){
    start_message

    # Tries to install Vim basic config
    echo -en "Installing Vim...\n"
    install_vim

    # echo -en "Installing the shortcuts...\n"
    # install_shortcuts
}

# Runs the main function 
main
