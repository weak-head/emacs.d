# emacs.d

This repository contains my personal Emacs configuration.

## Installation

Back up your Emacs config and clone the repo:
``` shell
mv ~/.emacs.d ~/.emacs.d.back
git clone https://github.com/weak-head/emacs.d ~/.emacs.d
```

To have access to all the features and capabilities  make sure to install the dependencies.

## External dependencies

This is just a hi-level overview. For additional information check the `Prerequisites` section of each particular *.el file.

> Themes and Neotree
* [all-the-icons-fonts](https://github.com/domtronn/all-the-icons.el/tree/master/fonts)

> Projectile
* [Silver searcher](https://github.com/ggreer/the_silver_searcher)

> Haskell
* [stack]()
* [codex]()

> C#
* [omnisharp]()

> JavaScript
* [nodejs]()
* [tern]()
* [eslint]()

## Scripts

Windows specific scripts:
* [Emacs client in context menu](scripts/w-context-menu.reg)  
* [Associate files with Emacs client](scripts/w-file-assoc.bat)  
* [Fix Alt Gr and remap CapsLock to Ctrl](scripts/w-fix-right-alt-and-capslock.reg)  

## Testing config using Docker

Build image:  
``` shell
docker build -f ./Dockerfile -t=weak-head/emacs.d . 
```

Run:  
``` shell
docker run -i -t --name emacs weak-head/emacs.d 
```

