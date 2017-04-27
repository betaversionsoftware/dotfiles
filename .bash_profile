
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# PS1="[\[\033[01;34m\]\$(~/.rvm/bin/rvm-prompt)\[\033[00m\]] \u@\h:\[\033[33m\]\W \[\033[00m\]$\[\033[00m\] "

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="[\[$(tput sgr0)\]\[\033[38;5;32m\]\$(~/.rvm/bin/rvm-prompt)\[$(tput sgr0)\]\[\033[38;5;15m\]] \[$(tput sgr0)\]\[\033[38;5;112m\]\u\[$(tput sgr0)\]\[\033[38;5;226m\]@\[$(tput sgr0)\]\[\033[38;5;112m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\$(parse_git_branch)\[\033[00m\] \n->\[$(tput sgr0)\] "
