# dotfiles

Credit to [Ryan Bates'](https://github.com/ryanb) excellent dotfiles. Basically I used it verbatim for git, zsh, Gem, and VIM config, then added Powerline font installation and a Bash script to install additional stuff I use. See Features section below for more info.

__PLEASE NOTE: This was created for my personal use and may have undesired effects on your environment. Please back up your current configuration and read through the source and prompts to see what is happening before you proceed.__

## Installation

1. Download and install via command line
```terminal
git clone git://github.com/joshgking/dotfiles ~/.dotfiles
cd ~/.dotfiles
sh install_env
```
2. You will be prompted before each step. Please read these steps carefully and be aware that skipping brew installation will result in other tasks failing if you don't have it installed already.
3. After running the install above, open a new terminal window or tab to see the changes.

## Features

* oh-my-zsh with Agnoster theme set by default
* Powerline Fonts to complement Agnoster theme
* Latest stable version of NodeJS and npm installed via n and n-install (https://github.com/tj/n)
* Homebrew package manager
* Python 3 with pip (installed via Homebrew)
* VS Code - latest release (installed via Homebrew)
* For additional features, see [ryanb's dotfiles](https://github.com/ryanb/dotfiles) 

> After installation, you'll probably want to select one of the Powerline fonts in your terminal of choice. 

### TODO

* Add script to automate defaults for OSX terminal Powerline fonts.
* Add uninstall script
* Add some defaults for VS Code
