# emacs.d

This repository contains my personal Emacs configuration.

## Installation

Back up your Emacs config and clone the repo:
``` shell
mv ~/.emacs.d ~/.emacs.d.back
git clone https://github.com/weak-head/emacs.d ~/.emacs.d
```

I've remapped some of the commonly used keys for the major modes.  
My most vital shortcuts could be found in the [which_key.el](packages/which-key.el).  
  
  
To have access to all the features and capabilities make sure to install the dependencies.

## Testing config using Docker

Build and run the image:  
``` shell
docker build -f ./Dockerfile -t=weak-head/emacs.d . 

docker run -i -t --name emacs weak-head/emacs.d
```

## External dependencies

This is just a hi-level overview.  
For the additional information check the `Prerequisites` section of the each particular *.el file.

Themes and Neotree
* [all-the-icons-fonts](https://github.com/domtronn/all-the-icons.el/tree/master/fonts)

Projectile
* [Silver searcher](https://github.com/ggreer/the_silver_searcher)

Haskell
* [stack]()
* [codex]()

C#
* [omnisharp]()

JavaScript
* [nodejs]()
* [tern]()
* [eslint]()

## Utils

Windows specific scripts:
* [Emacs client in context menu](scripts/w-context-menu.reg)  
* [Associate files with Emacs client](scripts/w-file-assoc.bat)  
* [Fix Alt Gr and remap CapsLock to Ctrl](scripts/w-fix-right-alt-and-capslock.reg)  
