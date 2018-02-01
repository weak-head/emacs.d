# emacs.d

This repository contains my personal Emacs configuration.

## Installation

Backup your existing config and clone the repo:
``` shell
mv ~/.emacs.d ~/.emacs.d.back

git clone https://github.com/weak-head/emacs.d ~/.emacs.d
```

Though I'm using some [custom shortcuts](packages/which-key.el), most of my key bindings are set to default.  
Optionally you can toggle [evil mode](https://github.com/emacs-evil/evil) (<kbd>C-c t e</kbd>).  

If you want to have an access to the specific features and capabilities, please make sure to install the required dependencies.

## Check it out using Docker

Build and run the image:  
``` shell
docker build -f ./Dockerfile -t=weak-head/emacs.d . 

docker run -i -t --name emacs weak-head/emacs.d
```

## External dependencies

A lot of major/minor modes are relying on external dependencies. Usually they are mentioned in the `*.el` file headers.  
This list is not trying to be complete, but mostly reflects the summary of the hi-level dependencies.

* [all-the-icons fonts](https://github.com/domtronn/all-the-icons.el/tree/master/fonts)
* [silver searcher](https://github.com/ggreer/the_silver_searcher)
* [pandoc](https://pandoc.org/)
* [stack](https://docs.haskellstack.org/en/stable/README/), [codex](https://github.com/aloiscochard/codex)
* [omnisharp](http://www.omnisharp.net/)
* [nodejs](https://nodejs.org/), [tern](https://github.com/ternjs/tern), [eslint](https://eslint.org/)

## Utils

Windows specific scripts:
* [Emacs client in context menu](scripts/w-context-menu.reg)  
* [Associate files with Emacs client](scripts/w-file-assoc.bat)  
* [Fix Alt Gr and remap CapsLock to Ctrl](scripts/w-fix-right-alt-and-capslock.reg)  
* [.bashrc: Share the same SSH agent for multiple Git Bash sessions](scripts/.bashrc)  
