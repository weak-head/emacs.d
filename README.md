# Emacs.d

This repository contains my personal Emacs configuration.

## Config overview

*TBD*

## Installation

Backup your Emacs config:
``` shell
mv ~/.emacs.d ~/.emacs.d.back
```

Clone the repo:
``` shell
git clone https://github.com/weak-head/emacs.d ~/.emacs.d
```

To have access to all the features and capabilities please make sure to install the dependencies (described below).

## Prerequisites and dependencies

*TBD*

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

