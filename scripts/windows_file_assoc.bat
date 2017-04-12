@echo off

REM --------------------------------------------------------------------------
REM
REM This script associates a few most commonly used file types with Emacs.
REM 
REM Please configure Emacs daemon, so the newly created cliens are reusing the
REM same Emacs instance and, as a result, sharing the buffers and history.
REM
REM
REM
REM Start emacs daemon:
REM   runemacs.exe --daemon
REM
REM Attach emacs client to daemon:
REM   emacsclientw.exe -c -n
REM
REM
REM
REM The original concept is coming from here:
REM   https://www.emacswiki.org/emacs/EmacsMsWindowsIntegration
REM
REM
REM --------------------------------------------------------------------------


REM -----------------------------------------
REM The Emacs bin folder and main executables

REM The Emacs bin folder
set EMACS_PATH_BIN=C:\Program Files\emacs-25.1-2-x86_64-w64-mingw32\bin\

REM The Emacs client executable
set EMACS_PATH_CLIENTW=%EMACS_PATH_BIN%emacsclientw.exe

REM The editor to be used if Emacs client cannot connect to the daemon
set EMACS_PATH_ALTERNATE_EDITOR=%EMACS_PATH_BIN%runemacs.exe



REM --------------------------------------------------------------------------
REM Enumerating file associations and file types

REM Text files (000 - 099)
set EMACS_FILE_TYPE[000]=.txt
set EMACS_FILE_TYPE[001]=.text
set EMACS_FILE_TYPE[002]=.log

REM Source code (100 - 299)
set EMACS_FILE_TYPE[100]=.el
set EMACS_FILE_TYPE[101]=.json
set EMACS_FILE_TYPE[102]=.js
set EMACS_FILE_TYPE[103]=.cs
set EMACS_FILE_TYPE[104]=.c
set EMACS_FILE_TYPE[105]=.cpp
set EMACS_FILE_TYPE[106]=.h
set EMACS_FILE_TYPE[107]=.hs
set EMACS_FILE_TYPE[108]=.htm
set EMACS_FILE_TYPE[109]=.html
set EMACS_FILE_TYPE[110]=.cshtml
set EMACS_FILE_TYPE[111]=.css
set EMACS_FILE_TYPE[112]=.xml
set EMACS_FILE_TYPE[113]=.xaml
set EMACS_FILE_TYPE[114]=.yaml
set EMACS_FILE_TYPE[115]=.sql

REM Shell scripts (300 - 399)
set EMACS_FILE_TYPE[300]=.bat
set EMACS_FILE_TYPE[301]=.ps1
set EMACS_FILE_TYPE[302]=.sh
set EMACS_FILE_TYPE[303]=.bash
set EMACS_FILE_TYPE[304]=.bashrc

REM Documentation (400 - 499)
set EMACS_FILE_TYPE[300]=.md

REM Other files (500 - 999)
set EMACS_FILE_TYPE[500]=.gitignore
set EMACS_FILE_TYPE[501]=.ini
set EMACS_FILE_TYPE[502]=.markdown
set EMACS_FILE_TYPE[503]=.makefile


REM --------------------------------------------------------------------------
REM Registering all emacs file types using ftype

REM The Emacs prefix for file types
set EMACS_PREFIX=emacs

for /F "tokens=2 delims==" %%s in ('set EMACS_FILE_TYPE[') do (

    rem assoc file-type=emacs.file-type
    assoc %%s=%EMACS_PREFIX%%%s

    rem ftype emacs.file-type="%EMACS_PATH_CLIENTW%" -c -n -a "%EMACS_PATH_RUNEMACS%" "%%1"
    rem -c  => new window
    rem -n  => do not wait
    rem -a  => use alternate editor if emacsclient fails
    ftype %EMACS_PREFIX%%%s="%EMACS_PATH_CLIENTW%" -c -n -a "%EMACS_PATH_ALTERNATE_EDITOR%" "%%1" 
)

pause
