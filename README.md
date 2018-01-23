# Emacs.d

This repository contains my personal emacs configuration.

## Config overview

*TBD*

## Installation

``` shell
mv ~/.emacs.d ~/.emacs.d.back
git clone https://github.com/weak-head/emacs.d ~/.emacs.d
```

To have access to all the features and capabilities the dependencies described below should be installed. 

## Prerequisites and dependencies

*TBD*

## Scripts

> Windows specific
* [Emacs client in context menu](scripts/w-context-menu.reg)  
* [Associate files with Emacs client](scripts/w-file-assoc.bat)  
* [Fix Alt Gr and remap CapsLock to Ctrl](scripts/w-fix-right-alt-and-capslock.reg)  

## Testing config using Docker

Build image:  
  ``` docker build -f ./Dockerfile -t=weak-head/emacs.d . ```

Run:  
  ``` docker run -i -t --name emacs weak-head/emacs.d ```

