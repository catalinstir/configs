#!/bin/bash

copy_file() {
    local file=$1
    if [[ $# -e 2 ]]
    then
        local dest=$2
    else
        local dest=~/$file
    fi
    cp -r "./$file" $dest
    echo "$file has been applied."
}

while true; do
    echo "Choose what files to apply:"
    echo "[1] .vimrc"
    echo "[2] .bashrc"
    echo "[3] .zshrc"
    echo "[4] .zsh_functions"
    echo "[5] .zsh_templates"
	echo "[6] settings.json (vscode)"
    echo "[7] nvim (directory)"
    echo "[a] all"
    echo "[q] quit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            copy_file ".vimrc"
            ;;
        2)
            copy_file ".bashrc"
            ;;
        3)
            copy_file ".zshrc"
            ;;
        4)
            copy_file ".zsh_functions"
            ;;
        5)
            copy_file ".zsh_templates"
            ;;
		6)
			copy_file settings.json ~/.config/Code/User/settings.json
			echo "settings.json has been applied"
			;;
        7)
            copy_file "nvim"
            ;;
        a)
            copy_file ".vimrc"
            copy_file ".bashrc"
            copy_file ".zshrc"
            copy_file ".zsh_functions"
            copy_file ".zsh_templates"
            ;;
        q)
            echo "Quitting..."
            break
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done

