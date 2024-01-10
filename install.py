#!/bin/python3

import argparse
import shutil
import os


def get_dotfiles():
    dotfiles = os.listdir()

    for file in IGNORE:
        dotfiles.remove(file)

    return dotfiles


def backup():
    if not os.path.exists(CONFIG_PATH + "/old"):
        os.mkdir(CONFIG_PATH + "/old")
    else:
        shutil.rmtree(CONFIG_PATH + "/old")
        os.mkdir(CONFIG_PATH + "/old")

    for file in DOTFILES:
        if os.path.exists(CONFIG_PATH + "/" + file):
            shutil.move(CONFIG_PATH + "/" + file, CONFIG_PATH + "/old")


def install_all():
    backup()

    for file in DOTFILES:
        shutil.copytree("./" + file, CONFIG_PATH + "/" + file)


def install_all_with_symlink():
    backup()

    for file in DOTFILES:
        os.symlink(os.getcwd() + "/" + file, CONFIG_PATH + "/" + file)


IGNORE = [".zshrc", ".git", ".gitignore", "README.md", "install.py"]
HOME = os.environ["HOME"]
CONFIG_PATH = HOME + "/.config"
DOTFILES = get_dotfiles()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="A installation script")
    parser.add_argument(
        "-s", "--symlink", action="store_true", help="Install dotfiles with symlinks"
    )
    args = parser.parse_args()

    if args.symlink:
        install_all_with_symlink()
        exit(0)

    install_all()
