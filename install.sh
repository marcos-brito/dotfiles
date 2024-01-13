#!/bin/bash

IGNORE=(assets .git .gitignore install.py install_nvim_on_windows.py install.sh README.md)
INSTALLTION_DIR="$HOME"/.config

backup() {
	mkdir -p "$INSTALLTION_DIR"/old
	mkdir "$INSTALLTION_DIR"/old/"$1"
	cp -r "$1"/* "$INSTALLTION_DIR"/old/"$1"
}

install_with_symlinks() {
	for file in $(ls); do
		if [[ ! " ${IGNORE[@]} " =~ " $file " ]]; then
			backup "$file"
			ln -s $(realpath "$file") "$INSTALLTION_DIR"/"$file"
		fi
	done
}

install_with_cp() {
	for file in $(ls); do
		if [[ ! " ${IGNORE[@]} " =~ " $file " ]]; then
			backup "$file"
			cp -r $(realpath "$file") "$INSTALLTION_DIR"/"$file"
		fi
	done
}

read -p "Should we use symlinks? (Y/N): " choice
if [ -z "$choice" ] || [ "$choice" == "Y" ] || [ "$choice" == "y" ] ]; then
	install_with_symlinks
else
	install_with_cp
fi
