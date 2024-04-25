# dotfiles

## Functionality
Core:
- PowerLevel10k - zsh prompt
- Antidote - fast and simple zsh plugin manager

CLI Utilities:
- fzf
- fzf-tab
- zoxide - smarter cd command

Extras:

## Pre-requisites

### Install stow
This version of my dotfiles uses [GNU Stow](https://github.com/aspiers/stow), which is a symlink farm manager. To install, use your OS distribution's package manager, or follow their [installation guide](https://github.com/aspiers/stow/blob/master/INSTALL.md).

### Cloning and submodule setup
To ensure ease of installation, run the following command to also include installation of the submodules. With the way that [.zshenv](https://github.com/louis-manabat/dotfiles/blob/main/.zshenv) is currently setup, please ensure you are cloning this in you home directory!

```sh
# One command initialisation
git clone https://github.com/louis-manabat/dotfiles.git --resursive-submodules

# Multi-line utilisation
git clone https://github.com/louis-manabat/dotfiles.git
cd dotfiles
git submodule init
git submodule update
```

### Package installation
In the current state of the repository, fzf and zoxide need to be installed. Ensure that the submodules have been initialised and pulled. Go to the root directory of the repository and run the following.
```
# Package installtion
./package-setup.sh
```

## Symlink setup
Once the aboves have been done, run the following to setup the symlinks with Stow.
```
# Stow symlinks
stow --adopt .
```