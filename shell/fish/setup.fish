set -U fish_greeting
set -U fish_prompt_pwd_dir_length 0
fish_vi_key_bindings

# Color
set -Ux CLICOLOR 1
set -Ux LSCOLORS ExGxFxdxcxegedabagacad
set -Ux TERM xterm-256color
set -U fish_color_command \x2d\x2dbold
set -U fish_color_quote green
set -U fish_color_redirection brblue
set -U fish_color_end brmagenta
set -U fish_color_error brred
set -U fish_color_param brcyan
set -U fish_color_comment 8a8a8a
set -U fish_color_operator cyan
set -U fish_color_escape bryellow\x1e\x2d\x2dbold
set -U fish_color_autosuggestion 555\x1ebrblack
