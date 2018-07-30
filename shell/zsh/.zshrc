export ZSH="$HOME/.oh-my-zsh"

fpath+=($HOME/.zsh/pure) # https://github.com/sindresorhus/pure#manually
autoload -U promptinit; promptinit
prompt pure

zstyle ':omz:update' mode auto

plugins=(
  git
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
  zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
  conda-zsh-completion # https://github.com/conda-incubator/conda-zsh-completion
  poetry # https://python-poetry.org/docs/#oh-my-zsh
)

. $HOME/.zsh/zsh-bd/bd.zsh # https://github.com/Tarrasch/zsh-bd

. $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/opt/homebrew/bin":$PATH
export HOMEBREW_BIN_PATH="/opt/homebrew/bin"
export PATH=$HOMEBREW_BIN_PATH:$PATH
export PATH="/usr/local/texlive/2022/bin/universal-darwin":$PATH
export PATH="/opt/homebrew/opt/llvm/bin":$PATH
export PATH="$HOME/.cargo/bin":$PATH

export LANG=en_US.UTF-8
export EDITOR='nvim'

alias l='ls -lh'
alias ll='ls -alh'
alias vi='nvim'
alias tmux='tmux -2u -S ~/.tmux.sock'
alias tl='tmux ls'
alias ta='tmux -S ~/.tmux.sock attach || tmux'
alias lg='lazygit'
alias ts='printf "%x\n" $(date +%s)'
alias dr='docker run -it --rm'
alias drw='docker run -it --rm -v $(pwd):/runtime -w /runtime'

# fzf `$(brew --prefix)/opt/fzf/install`
export FZF_DEFAULT_OPTS="--height=50% --layout=reverse"
eval "$(fasd --init auto)"
alias z='cd "$(fasd -dlR | fzf)"'
alias v='vi "$(fasd -flR | fzf)"'
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
# Homebrew
export HOMEBREW_FORCE_BREWED_CURL=1

# Terminal
export TERM=xterm-256color

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/xintongli/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/xintongli/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/xintongli/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/xintongli/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# vim mode
bindkey -v

# python
export PYTHONBREAKPOINT=ipdb.set_trace

# jekyll
export SDKROOT=$(xcrun --show-sdk-path)
export PATH="/opt/homebrew/opt/ruby@3.1/bin:/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"

# java
export JAVA_HOME=/opt/homebrew/opt/java

# turn off special handling of ._* files in tar, etc.
export COPYFILE_DISABLE=1

# Personal bin
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/bin":$PATH

# local rc
[ -f ~/.zshenv ] && . ~/.zshenv
[ -f ~/.rc.sh ] && . ~/.rc.sh
