# The personal bash profile options
source $HOME/.dotfiles/bash/bash_personal
source ~/git-completion.bash

# The rest might be quite machine specific...
# or set up by the tools themselves
# might need to actually not symlink bash_profile but just
# prepend the above to it as part of setup...

# Now with the config refactor, we need to explicitly set our rails env:
export RAILS_ENV=development
export PGHOST=localhost

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

get_region_and_rails_env() {
  if [ "$RAILS_ENV" == "" -o "$AGW_region" == "" ]; then
    return
  else
    if [ "$RAILS_ENV" == "development" -a "$AGW_region" == "au" ]; then
      rails_env_tmp=dev
    else
      rails_env_tmp=$RAILS_ENV
    fi

    if [ -n "$AGW_database_name" ]; then
      append_db_name_tmp=":$AGW_database_name"
    fi

    echo "$AGW_region:$rails_env_tmp$append_db_name_tmp"
  fi
}

PS1="\[$(tput sgr0)\]\[\033[38;5;112m\]\u\[$(tput sgr0)\]\[\033[38;5;226m\]@\[$(tput sgr0)\]\[\033[38;5;112m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\$(parse_git_branch)\[\033[00m\] [\[$(tput sgr0)\]\[\033[38;5;32m\]\$(~/.rvm/bin/rvm-prompt)\[$(tput sgr0)\]\[\033[38;5;15m\]] \[\033[38;5;13m\]\$(get_region_and_rails_env)\[\033[00m\] \n->\[$(tput sgr0)\] "
