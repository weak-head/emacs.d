# Emacs cheat sheet

The list of commonly used key bindings and commands.

> **Table of Contents**
>
> - [Getting Help](#getting-help)
>   - [Info Manual](#info-manual)
>   - [Apropos](#apropos)
>   - [Describe System](#describe-system)
> - [Movements and Scrolling](#movements-and-scrolling)
>   - [Basic Commands](#basic-commands)
>   - [Point Movements](#point-movements)
>   - [Window Scrolling](#window-scrolling)
>   - [Window Management](#window-management)
>   - [Bookmarks and Registers](#bookmarks-and-registers)
>   - [Selections and Regions](#selections-and-regions)
> - [Searching and Indexing](#searching-and-indexing)
>   - [Isearch](#isearch)
>   - [Occur](#occur)
> - [Editing and Transformations](#editing-and-transformations)
>   - [Killing and Yanking](#killing-and-yanking)
>   - [Transposing](#transposing)
>   - [Filling](#filling)
>   - [Commenting](#commenting)
>   - [Search and Replace](#search-and-replace)
>   - [Changing Case](#changing-case)
>   - [Flushing and Keeping Lines](#flushing-and-keeping-lines)
>   - [Joining and Splitting Lines](#joining-and-splitting-lines)
>   - [Whitespace Commands](#whitespace-commands)
> - [TO-DO: Keyboard Macros](#to-do--keyboard-macros)
> - [Additional topics](#additional-topics)
>   - [Highlighting Patterns](#highlighting-patterns)
>   - [Dired](#dired)

## Getting Help

### Info Manual

> Accessing the info manual

| Key Binding | Purpose |
| ----------- | ------- |
| C-h i       | Opens Info manual |
| C-h r       | Opens Emacs Editor manual |

> Navigating the manual

| Key Binding | Purpose |
| ----------- | ------- |
| [ and ]     | Previous / next node |
| l and r     | Go back / forward in history |
| n and p     | Previous / next sibling node |
| u           | Goes up one level to a parent node |
| SPC         | Scroll one screen at a time |
| TAB         | Cycles through cross-references and links |
| RET         | Opens the active link |
| m           | Prompts for a menu item name and opens it |
| q           | Closes the info browse |

### Apropos

| Command | Purpose |
| ------- | ------- |
| ```M-x apropos``` | Display all symbols that match a given pattern |
| ```M-x apropos-command``` or C-h a | Display only the commands |
| ```M-x apropos-documentation``` or C-h d | Searches just the documentation |
| ```M-x apropos-library``` | Lists all variables and functions defined in a library |
| ```M-x info-apropos``` | Searches all known Info files on your system for STRING. Builds a menu of the possible matches. |

### Describe System

| Key Binding | Purpose |
| ----------- | ------- |
| C-h m       | Displays the documentation for the major mode (and any minor modes also enabled) along with any keybindings introduced by the modes. |
| C-h f       | Describes a function |
| C-h v       | Describes a variable |
| C-h k       | Describes a key binding |

## Movements and Scrolling

### Basic Commands

| Key Binding | Purpose |
| ----------- | ------- |
| C-x C-f     | Find (open) file |
| C-x C-s     | Save the buffer |
| C-x C-q     | Mark buffer as read-only |
| C-x b       | Switch buffer |
| C-x k       | Kill (close) a buffer |
| C-x C-b     | Display all opened buffers |
| C-x C-c     | Exit emacs |
| ESC ESC ESC | Exits out prompts, regions and ret to one window |
| C-/         | Undo changes |

### Point Movements

> Basic

| Key Binding | Puprose |
| ----------- | ------- |
| C-f         | Move forward one character |
| C-b         | Move backward one character |
| M-f         | Move forward one word |
| M-b         | Move backward one word |
| C-n         | Move to next line |
| C-p         | Move to previous line |
| C-a         | Move to begining of line |
| C-e         | Move to end of line |
| M-m         | Move to first non-whitespace character on this lane |
| M-a         | Move back to begining of sentence |
| M-e         | Move forward to end of sentence |
| M-g M-g     | Go to line |
| M-g TAB     | Go to column |
| M-g c       | Go to character position |

> Advanced

| Key Binding | Purpose |
| ----------- | ------- |
| C-M-a       | Move to begining of defun |
| C-M-e       | Move to end of defun |
| C-M-f       | Move forward by s-expression |
| C-M-b       | Move backward by s-expression |
| C-M-d       | Move down into a list |
| C-M-u       | Move up out of a list |

### Window Scrolling

|Key Binding| Purpose |
|-----------|---------|
| C-v       | Move forward one screen |
| M-v       | Move backward one screen |
| C-M-v     | Scroll down the *other* window |
| C-M-S-v   | Scroll up the *other* window |
| C-l       | Move the text to the center of the screen |
| C-M-l     | Re-position the comment or definition so it is in view in the buffer|
| M-<       | Move to the begining of the buffer |
| M->       | Move to the end of the buffer |


> Extra Commands

| Command | Purpose |
| ------- | ------- |
| ```M-x subword-mode``` | CamelCase as distinct words |
| ```M-x superword-mode``` | snake_case as one word |
| ```M-x customize-option RET ido-mode RET``` | Enable IDO mode |
| ```M-x customize-option RET ido-enable-flex-matching RET``` | Enable flexible matching |
| ```M-x winner-mode``` | Window management mode |

### Window Management

| Key Binding | Purpose |
| ----------- | ------- |
| C-x 0       | Delete the active window |
| C-x 1       | Delete all other windows |
| C-x 2       | Split window below |
| C-x 3       | Split window right |
| C-x o (M-o) | Switch active window |

> Resizing window

| Key Binding | Purpose |
| ----------- | ------- |
| C-x ^       | Increase height by 1 line |
| C-x +       | Balances windows |
| C-x -       | Shrink window to fit it's content |
| C-x {       | Shrink window horizontally |
| C-x }       | Enlarge window horizontally |

> Working with other windows

| Key Binding | Purpose |
| ----------- | ------- |
| C-x 4 C-f   | Find a file in other window |
| C-x 4 d     | Opens M-x dired |
| C-x 4 C-o   | Displays a buffer |
| C-x 4 0     | Kill the window and the buffer |

> Winner mode

| Key Binding | Puprose |
| ----------- | ------- |
| C-c left    | Undo changes in the window configuration |
| C-c right   | Redo changes in the window configuration |

### Bookmarks and Registers

> Bookmarks

| Key Binding | Purpose |
| ----------- | ------- |
| C-x r m     | Set a bookmark |
| C-x r l     | List bookmarks |
| C-x r b     | Jump to bookmark |

> Registers

| Key Binding | Purpose |
| ----------- | ------- |
| C-x r n     | Store number in register |
| C-x r s     | Store region in register |
| C-x r SPC   | Store point in register |
| C-x r +     | Increment number in register |
| C-x r j     | Jump to register |
| C-x r i     | Insert content of register |
| C-x r w     | Store window configuration in register |
| C-x r f     | Store frameset in register |

### Selections and Regions

> Setting the mark

| Key Binding | Puprose |
| ----------- | ------- |
| M-h         | Marks the next paragraph |
| C-x h       | Marks the whole buffer |
| C-M h       | Marks the next defun |
| M-@         | Marks the next word  |
| C-M-SPC, C-M-@ | Marks the next s-expression |

> Activating the mark

| Key Binding | Puprose |
| ----------- | ------- |
| C-SPC       | Activate the region |
| C-SPC, C-g  | Deactivates the region |
| C-u C-SPC   | Jumps to the mark |
| C-x C-x     | Exchanges the point and mark and reactivates your last region |

## Searching and Indexing

### Isearch

> Incremental search

| Key Binding | Puprose |
| ----------- | ------- |
| C-s         | Begins an incremental search |
| C-r         | Begins a backward incremental search |
| C-M-s       | Begins a regexp incremental search |
| C-M-r       | Begins a regexp backward incremental search |
| RET         | Pick the selected match |
| C-g         | Exit incremental search |

> Search ring (during the search mode)

| *Isearch* Key Binding | Puprose |
| ----------- | ------- |
| M-n         | Move to next item in search history |
| M-p         | Move to previous item in search history |
| C-M-i       | TAB-complete search string against previous search ring |
| C-s C-s     | Begins search against last search string |
| C-r C-r     | Begins backward search agains last search string |

> Search at poing (during the search mode)

| *Isearch* Key Binding | Puprose |
| ----------- | ------- |
| C-w         | Add word at point to search string |
| C-M-y       | Add character at point to search string |
| M-s C-e     | Add rest of line at point to search string |

> Toogle search commands (during the search mode)

| *Isearch* Key Binding | Purpose |
| --------------------- | ------- |
| M-s c                 | Toggles case-sensivity |
| M-s r                 | Toggles regular-expression mode |
| M-s w                 | Toggles word mode |
| M-s _                 | Toggles symbol mode |
| M-s SPC               | Toogles lax whitespace matching |

> Global keybindings for frequent toogle search commands

| Key Binding | Purpose |
| ----------- | ------- |
| M-s w       | Starts Isearch forward for word |
| M-s _       | Starts Isearch forward for symbol |
| M-s .       | Starts Isearch forward for symbol at point |


### Occur

> Print lines matching an expression

| Key Binding | Purpose |
| ----------- | ------- |
| M-s o       | Occur mode |
| M-s o       | Activate occur on current search string inside Isearch |

> Occur navigation

| *Occur* Key Binding | Purpose |
| ------------------- | ------- |
| M-n                 | Go to next occurrence |
| M-p                 | Go to previous occurrence |
| <                   | Go to begining of buffer |
| >                   | Go to end of buffer |
| g                   | Revert the buffer, refreshing the search results |
| q                   | Quit occur mode |
| e                   | Switch to occur edit mode |
| C-c C-c             | Exits occur edit mode and applies changes |

> Navigating on occurances without switching to occur buffer

| Key Binding | Purpose |
| ----------- | ------- |
| M-g M-n     | Jump to next "error" |
| M-g M-p     | Jump to previous "error" |

> Multi-Occur

| Command | Purpose |
| ------- | ------- |
| ```M-x multi-occur-in-matching-buffers``` | Takes a regexp of buffers to match |
| ```M-x multi-occur``` | Explicetely select the buffers you want to search |

## Editing and Transformations

### Killing and Yanking

| Key Binding   | Puprose |
| ------------- | ------- |
| C-d           | Delete character |
| BACKSPACE     | Detele previous character |
| M-d           | Kill word |
| C-k           | Kill rest of line |
| M-k           | Kill sentence |
| C-M-k         | Kill s-expression |
| C-S-BACKSPACE | Kill current line |

> Commands customizations

| Command | Puprose |
| ------- | ------- |
| ```M-x package-install RET whole-line-or-region RET``` | Modify the behavior of C-w, so it kills the current line the point is on if there are no active regions |
| ```M-x customize-option RET kill-whole-line RET``` | Force C-k to kill newline character |

> Clipboard-equivalent commands

| Key Binding | Kill Ring Purpose | Clipboard |
| ----------- | ----------------- | --------- |
| C-w         | Kill active region | cut |
| M-w         | Copy to kill ring | copy |
| C-y         | Yank last kill | paste |
| M-y         | Cycle through kill ring, replacing yanked text | |

> Appending to kill ring

| Key Binding | Purpose |
| ----------- | ------- |
| C-M-w *[AnyKillCommand]* | Appends to the kill ring |

### Transposing

| Key Binding | Purpose |
| ----------- | ------- |
| C-t         | Transpose characters |
| M-t         | Transpose words |
| C-M-t       | Transpose s-expression |
| C-x C-t     | Transpose lines |
| ```M-x transpose-paragraphs``` | Transpose paragraphs |
| ```M-x transpose-sentences``` | Transpose sentences |

### Filling

| Key Binding | Purpose |
| ----------- | ------- |
| M-q         | Refills the paragraph point is in |
| C-u M-q     | Refills the paragraph point is in, justify if possible |
| C-x f       | Sets the fill column width |
| C-x .       | Sets the fill prefix |
| ```M-x auto-fill-mode``` | Toggles auto-filling |

### Commenting

| Key Binding | Purpose |
| ----------- | ------- |
| M-;         | Comment or uncomment DWIM |
| C-x C-;     | Comment or uncomment line |
| ```M-x comment-box``` | Comments the region but as a box |
| M-j, C-M-j  | Inserts new line and continues with comment on a new line |

### Search and Replace

| Key Binding | Purpose |
| ----------- | ------- |
| C-M-%       | Query regexp search and replace |
| M-%         | Query search and replace |
| ```M-x replace-string``` | Search and replace |
| ```M-x replace-regexp``` | Regexp search and replace |

> Inside Isearch

| Key Binding | Purpose |
| ----------- | ------- |
| C-M-%       | Query regexp search and replace |
| M-%         | Query search and replace|

> Query intstructions

| Query Key Binding | Purpose |
| ----------------- | ------- |
| SPC, y            | Replaces one match, then continues |
| .                 | Replaces one match, then exits |
| RET, q            | Exits without replacing match |
| !                 | Replaces all mathces in buffer |
| ^                 | Moves point back to previous match

### Changing Case

| Region Commands | Description |
| --------------- | ----------- |
| C-x C-u         | Uppercases the region |
| C-x C-l         | Lowercases the region |
| ```M-x upcase-initials-region``` | Capitalizes the region |

| Key Binding | Description |
| ----------- | ----------- |
| M-c         | Capitalizes the next word |
| M-u         | Uppercases the next word |
| M-l         | Lowercases the next word |


### Flushing and Keeping Lines

| Command | Description |
| ------- | ----------- |
| ```M-x flush-lines``` | Deletes all lines in a region that match a pattern |
| ```M-x keep-lines``` | Keeps all lines in a region that match a pattern and removes all non-matches |


### Joining and Splitting Lines

| Key Binding | Description |
| ----------- | ----------- |
| C-o         | Inserts a blank line after point |
| C-x C-o     | Deletes all blank lines after point |
| C-M-o       | Splits a line after point, keeping the indentation |
| M-^         | Joins the line the point is on with the one above |


### Whitespace Commands

| Key Binding | Description |
| ----------- | ----------- |
| M-SPC       | Deletes all but 1 space or tab to the left and right of the point |
| M-\         | Deletes all spaces and tabs around point |
| ```M-x whitespace-mode```           | Minor mode that highlights alll whitespace characters |
| ```M-x whitespace-newline-mode```   | Minor mode that displayes newline characters with a $ |
| ```M-x whitespace-toggle-options``` | Displayes a toogle menu of all whitespace-mode options |

> Whitespace reporting and cleanup

| Command | Description |
| ------- | ----------- |
| ```M-x whitespace-report```          | Shows whitespace issues |
| ```M-x whitespace-report-region```   | Shows whitespace issues for the region |
| ```M-x whitespace-clean-up```        | Attempts automatic cleanup |
| ```M-x whitespace-clean-up-region``` | Attempts automatic cleanup for the region |


## TO-DO: Keyboard Macros

Put keyboard macros information and keybindings here.


## Additional topics

### Highlighting patterns

| Key Binding | Description |
| ----------- | ----------- |
| M-s h p     | Highlight a phrase |
| M-s h r     | Highlight a regular expression |
| M-s h .     | Highlights symbol at point |
| M-s h l     | Highlights a line containing the regexp |
| M-s h u     | Removes highlighting under the point |

### Dired

| Key Binding | Description |
| ----------- | ----------- |
| ^           | Goes up one directory |
| q           | Quits dired |
| m           | Marks active |
| u           | Unmarks active |
| U           | Unmarks everything |
| d           | Flags for deletion |
| g           | Refreshes dired buffer |
| +           | Creates a sub-directory |
| C           | Copy marked |
| R           | Rename/moves marked |
| O           | chown marked |
| G           | chgrp marked |
| M           | chmod marked |
| D           | Deletes marked |
| x           | Deletes flagged |
| i           | Inserts this subdirectory into the same dired buffer |
