alias l='ls -lh'
alias ll='ls -alh'
alias vi='nvim'
alias tmux='tmux -2u -S ~/.tmux.sock'
alias tl='tmux ls'
alias ta='tmux -S ~/.tmux.sock attach || tmux'
alias z='cd $(fasd -dlR | fzf --height 50% --reverse)'
alias v='vi $(fasd -flR | fzf --height 50% --reverse)'

export EDITOR=vi
export LANG=en_US.UTF-8
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

export PATH="~/miniconda/bin:$PATH"
. "~/miniconda/etc/profile.d/conda.sh"

export PATH="/usr/local/opt/llvm/bin":$PATH

export PATH="~/bin":$PATH

export HOMEBREW_FORCE_BREWED_CURL=1
