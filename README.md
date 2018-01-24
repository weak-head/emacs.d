# emacs.d

This repository contains my personal Emacs configuration.

## Installation

Backup your existing config and clone the repo:
``` shell
mv ~/.emacs.d ~/.emacs.d.back

git clone https://github.com/weak-head/emacs.d ~/.emacs.d
```

Though I'm using [custom shortcuts](packages/which-key.el), most of my bindings are default.  
If you want to have access to all the features and capabilities, please make sure to install the dependencies.

## Check it out using Docker

Build and run the image:  
``` shell
docker build -f ./Dockerfile -t=weak-head/emacs.d . 

docker run -i -t --name emacs weak-head/emacs.d
```

## External dependencies

A lot of major/minor modes are having external dependencies. Usually they are mentioned in the `*.el` file headers.  
This list is not trying to be complete, but mostly reflects the summary of the hi-level dependencies.

Themes and Neotree:
* [all-the-icons-fonts](https://github.com/domtronn/all-the-icons.el/tree/master/fonts)

Projectile:
* [silver searcher](https://github.com/ggreer/the_silver_searcher)

Haskell:
* [stack]()
* [codex]()

C#:
* [omnisharp]()

JavaScript:
* [nodejs]()
* [tern]()
* [eslint]()

## Utils

Windows specific scripts:
* [Emacs client in context menu](scripts/w-context-menu.reg)  
* [Associate files with Emacs client](scripts/w-file-assoc.bat)  
* [Fix Alt Gr and remap CapsLock to Ctrl](scripts/w-fix-right-alt-and-capslock.reg)  
