# Emacs cheat sheet

The list of commonly used key bindings and commands.

## Movements and Scrolling

### Basic Commands

| Key Binding | Purpose |
| ----------- | ------- |
| C-x C-f     | Find (open) file |
| C-x C-s     | Save the buffer |
| C-x b	      | Switch buffer |
| C-x k	      | Kill (close) a buffer |
| C-x C-b     | Display all opened buffers |
| C-x C-c     | Exit emacs |
| ESC ESC ESC | Exits out prompts, regions and ret to one window |
| C-/ 	      | Undo changes |

### Point Movements 

> Basic

| Key Binding | Puprose |
| ----------- | ------- |
| C-f	      | Move forward one character |
| C-b	      | Move backward one character |
| M-f	      | Move forward one word |
| M-b	      | Move backward one word |
| C-n	      | Move to next line |
| C-p	      | Move to previous line |
| C-a	      | Move to begining of line |
| C-e	      | Move to end of line |
| M-m	      | Move to first non-whitespace character on this lane |
| M-a	      | Move back to begining of sentence |
| M-e	      | Move forward to end of sentence |
| M-g M-g     | Go to line |
| M-g TAB     | Go to column |
| M-g c       | Go to character position |

> Advanced

| Key Binding | Purpose |
| ----------- | ------- |
| C-M-a	      | Move to begining of defun |
| C-M-e	      | Move to end of defun |
| C-M-f	      | Move forward by s-expression |
| C-M-b	      | Move backward by s-expression |
| C-M-d	      | Move down into a list |
| C-M-u	      | Move up out of a list |

### Window Scrolling

|Key Binding| Purpose |
|-----------|---------|
| C-v       | Move forward one screen |
| M-v	    | Move backward one screen |
| C-M-v	    | Scroll down the *other* window |
| C-M-S-v   | Scroll up the *other* window |
| C-l	    | Move the text to the center of the screen |
| C-M-l     | Re-position the comment or definition so it is in view in the buffer|
| M-<	    | Move to the begining of the buffer |
| M->	    | Move to the end of the buffer |


> Extra Commands

| Command | Purpose |
| ------- | ------- |
| ```M-x subword-mode``` | CamelCase as distinct words |
| ```M-x superword-mode``` | snake_case as one word |
| ```M-x customize-option RET ido-mode RET``` | Enable IDO mode |
| ```M-x customize-option RET ido-enable-flex-matching RET``` | Enable flexible matching |
| ```M-x winner-mode``` | Windows management mode |

### Window Management

| Key Binding | Purpose |
| ----------- | ------- |
| C-x 0	      | Delete the active window |
| C-x 1	      | Delete all other windows |
| C-x 2	      | Split window below |
| C-x 3	      | Split window right |
| C-x o (M-o) | Switch active window |

> Resizing window

| Key Binding | Purpose |
| ----------- | ------- |
| C-x ^	      | Increase height by 1 line |
| C-x +	      | Balances windows |
| C-x -	      | Shrink window to fit it's content |
| C-x {	      | Shrink window horizontally |
| C-x }	      | Enlarge window horizontally |

> Working with other windows

| Key Binding | Purpose |
| ----------- | ------- |
| C-x 4 C-f   | Find a file in other window |
| C-x 4 d     | Opens M-x dired |
| C-x 4 C-o   | Displays a buffer |
| C-x 4 0     | Kill the window and the buffer |

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

### Isearch: Incremental Search

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


### Occur: Print lines matching an expression

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
| e                   | Swithc to occur edit mode |
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

## Editing, Text Macros and Text Transformation

### Killing and Yanking Text

| Key Binding   | Puprose |
| ------------- | ------- |
| C-d           | Delete character |
| BACKSPACE     | Detele previous character |
| M-d           | Kill word |
| C-k           | Kill rest of line |
| M-k           | Kill sentence |
| C-M-k         | Kill s-expression |
| C-S-BACKSPACE | Kill current line |

> Clipboard-equivalent commands

| Key Binding | Kill Ring Purpose | Clipboard |
| ----------- | ----------------- | --------- |
| C-w         | Kill active region | cut |
| M-w         | Copy to kill ring | copy |
| C-M-w       | Append kill | |
| C-y         | Yank last kill | paste |
| M-y         | Cycle through kill ring, replacing yanked text | |
