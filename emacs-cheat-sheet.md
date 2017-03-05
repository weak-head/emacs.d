# Emacs cheat sheet

The list of commonly used key bindings and commands.

## Movements and Scrolling

The basic movements and scrolling.

### Window scrolling 

|Key Binding| Purpose |
|-----------|---------|
| C-v       | Move forward one screen |
| M-v	    | Move backward one screen |
| C-M-v	    | Scroll down the *other* window |
| C-M-S-v   | Scroll up the *other* window |
| C-l	    | Move the text to the center of the screen |
| M-<	    | Move to the begining of the buffer |
| M->	    | Move to the end of the buffer |

### Movements 

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
| C-M-a	      | Move to begining of defun |
| C-M-e	      | Move to end of defun |
| C-M-f	      | Move forward by s-expression |
| C-M-b	      | Move backward by s-expression |
| C-M-d	      | Move down into a list |
| C-M-u	      | Move up out of a list |

### Extra commands

| Command | Purpose |
| ------- | ------- |
| ```M-x subword-mode``` | CamelCase as distinct words |
| ```M-x superword-mode``` | snake_case as one word |

## Basic Commands

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

### IDO mode

| Command | Purpose |
| ------- | ------- |
| ```M-x customize-option RET ido-mode RET``` | Enable IDO mode |
| ```M-x customize-option RET ido-enable-flex-matching RET``` | Enable flexible matching |

## Windows Management

| Key Binding | Purpose |
| ----------- | ------- |
| C-x 0	      | Delete the active window |
| C-x 1	      | Delete all other windows |
| C-x 2	      | Split window below |
| C-x 3	      | Split window right |
| C-x o (M-o) | Switch active window |

### Resizing window

| Key Binding | Purpose |
| ----------- | ------- |
| C-x ^	      | Increase height by 1 line |
| C-x +	      | Balances windows |
| C-x -	      | Shrink window to fit it's content |
| C-x {	      | Shrink window horizontally |
| C-x }	      | Enlarge window horizontally |

### Working with other windows

| Key Binding | Purpose |
| ----------- | ------- |
| C-x 4 C-f   | Find a file in other window |
| C-x 4 d     | Opens M-x dired |
| C-x 4 C-o   | Displays a buffer |
| C-x 4 0     | Kill the window and the buffer |

## Bookmarks

| Key Binding | Purpose |
| ----------- | ------- |
| C-x r m     | Set a bookmark |
| C-x r l     | List bookmarks |
| C-x r b     | Jump to bookmark |

### TODO: Add Registers key binding
