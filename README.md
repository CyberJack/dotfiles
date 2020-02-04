# Peter’s dotfiles

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need.
Don’t blindly use my settings unless you know what that entails. Use at your own risk!

You can clone this repository or download and extact a archived version.
 
To install perform the following steps:

* Copy `.env.dist` to `.env` and add your global git username and email address **(optional)**
* Run `install.sh` script from the project directory.

After installation restart your terminal or start a new ZSH session.

### Requirements

These dotfiles require some applications to be installed.

*All systems*

* rsync
* zsh
* antigen
* [fzf](https://github.com/junegunn/fzf)
* git
* figlet
* zip & unzip
* midnight-commander

*Macos*

* brew

## Update

To update the dotfiles, update the repository (or download and extract a newer archived version) and run the `install.sh` script again.

## Extend the dotfiles

You can add your own functionality by adding new `.zsh` files to `~/.zsh/conf` All files in this directory will be loaded.
New files won't be overwritten during an upgrade.
If you want to extend the `antigen-modules` or `exports` files, create a simmilar file in `~/.zsh/extra` with your extensions.
