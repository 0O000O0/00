# FISH config, the friendly interactive shell.


# key for shell must be compatible with terminal


# key general
  #
  bind --user \cz undo
  bind --user \cx cancel-commandline
  bind --user \cc fish_clipboard_copy
  bind --user \cv fish_clipboard_paste
  #
  bind --user \ca beginning-of-line
  bind --user \cs       end-of-line
  bind --user \cd  backward-word
  bind --user \cf   forward-word
  #
  bind --user \cw backward-kill-path-component
  bind --user \ce delete-or-exit
  #
  bind --user \cb pager-toggle-search
  #

# key vi
  #set -g fish_vi_cursor fish_vi_cursor
  #set -g fish_vi_key_bindings fish_vi_key_bindings
  #
  #bind --user j  backward-char
  #bind --user \;  forward-char
  #bind --user l     up-or-search
  #bind --user k   down-or-search
  #bind --user h    repeat-jump
  #
  #bind --user \cl history-token-search-backward
  #bind --user \ck history-token-search-forward
  #
  #bind --user -M visual j  backward-char
  #bind --user -M visual \;  forward-char
  #bind --user -M visual l     up-or-search
  #bind --user -M visual k   down-or-search
  #bind --user -M visual h    repeat-jump
  #


