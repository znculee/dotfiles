set -x LS_COLORS

set -x PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin

set -x CONDA_LEFT_PROMPT
set -x PATH ~/miniconda/bin $PATH
source ~/miniconda/etc/fish/conf.d/conda.fish

set -x PATH /usr/local/texlive/2021/bin/universal-darwin $PATH
set -x PATH /usr/local/opt/llvm/bin $PATH
set -x PATH /usr/local/opt/openjdk/bin $PATH
set -x PATH /usr/local/opt/ruby/bin $PATH
set -x PATH ~/.gem/ruby/3.0.0/bin $PATH

set -x PATH ~/bin $PATH

set -x EDITOR vi

set -x LC_ALL en_US.UTF-8
set -x HOMEBREW_FORCE_BREWED_CURL 1
set -x GPG_TTY (tty)
