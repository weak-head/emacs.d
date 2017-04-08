
:: Original concept is coming from here:
::   https://www.emacswiki.org/emacs/EmacsMsWindowsIntegration

@echo off

:: -----------------------------------------
:: The Emacs bin folder and main executables
set EMACS_PATH_BIN=C:\Program Files\emacs-25.1-2-x86_64-w64-mingw32\bin\
set EMACS_PATH_CLIENTW=%EMACS_PATH_BIN%emacsclientw.exe
set EMACS_PATH_RUNEMACS=%EMACS_PATH_BIN%runemacs.exe


:: -----------------------------------------
:: Configuring file associations and file types

set EMACS_FILE_TYPE_TEXT=emacs.text
set EMACS_FILE_TYPES[00]=%EMACS_FILE_TYPE_TEXT%

set EMACS_FILE_TYPE_LISP=emacs.lisp
set EMACS_FILE_TYPES[01]=%EMACS_FILE_TYPE_LISP%

set EMACS_FILE_TYPE_CODE=emacs.code
set EMACS_FILE_TYPES[02]=%EMACS_FILE_TYPE_CODE%

set EMACS_FILE_TYPE_JSON=emacs.json
set EMACS_FILE_TYPES[03]=%EMACS_FILE_TYPE_JSON%


:: ----------------------
:: File type assosiations

assoc .txt=%EMACS_FILE_TYPE_TEXT%
assoc .text=%EMACS_FILE_TYPE_TEXT%
assoc .log=%EMACS_FILE_TYPE_TEXT%

assoc .el=%EMACS_FILE_TYPE_LISP%

assoc .c=%EMACS_FILE_TYPE_CODE%
assoc .h=%EMACS_FILE_TYPE_CODE%
assoc .cs=%EMACS_FILE_TYPE_CODE%

assoc .json=%EMACS_FILE_TYPE_JSON%


:: --------------------------------------------
:: Registering all emacs file types using ftype
for /F "tokens=2 delims==" %%s in ('set EMACS_FILE_TYPES[') do (    
    ftype %%s="%EMACS_PATH_CLIENTW%" -na "%EMACS_PATH_RUNEMACS%" "%%1"
)

pause
