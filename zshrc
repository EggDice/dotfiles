if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#  Prompt
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

precmd() {
  vcs_info 2> /dev/null
  NEWLINE=$'\n'
  if [[ -n ${vcs_info_msg_0_} ]]; then
    STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
    if [[ -n $STATUS ]]; then
        PS1='%B%{$fg[magenta]%}%n%{$fg[yellow]%}@%{$fg[green]%}%m%{$fg[white]%}%1 :%{$fg[cyan]%}${PWD/#$HOME/~} %{$fg[yellow]%}git%{$fg[green]%}:%{$fg[yellow]%}(%{$fg[red]%}${vcs_info_msg_0_}%{$fg[yellow]%}) %b%(?.%F{green}✔.%F{red}✘%?)%f %{$fg[red]%}${NEWLINE}▶ %{$reset_color%}%'
    else
        PS1='%B%{$fg[magenta]%}%n%{$fg[yellow]%}@%{$fg[green]%}%m%{$fg[white]%}%1 :%{$fg[cyan]%}${PWD/#$HOME/~} %{$fg[yellow]%}git%{$fg[green]%}:%{$fg[yellow]%}(%{$fg[green]%}${vcs_info_msg_0_}%{$fg[yellow]%}) %b%(?.%F{green}✔.%F{red}✘%?)%f %{$fg[red]%}${NEWLINE}▶ %{$reset_color%}%'
    fi
  else
    PS1='%B%{$fg[magenta]%}%n%{$fg[yellow]%}@%{$fg[green]%}%m%{$fg[white]%}%1 :%{$fg[cyan]%}${PWD/#$HOME/~} %b%(?.%F{green}✔.%F{red}✘%?)%f %{$fg[red]%}${NEWLINE}▶ %{$reset_color%}%'
  fi
}

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" 2> /dev/null'

# aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# coreutils
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# EDITOR
export EDITOR="nvim"

# Install the fuck
eval "$(thefuck --alias)"

eval $(minikube docker-env)
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eggdice/Downloads/google-cloud-sdk 2/path.zsh.inc' ]; then . '/Users/eggdice/Downloads/google-cloud-sdk 2/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/eggdice/Downloads/google-cloud-sdk 2/completion.zsh.inc' ]; then . '/Users/eggdice/Downloads/google-cloud-sdk 2/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/eggdice/.bun/_bun" ] && source "/Users/eggdice/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rust

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/Applications/Inkscape.app/Contents/MacOS:$PATH"

# Added by Windsurf
export PATH="/Users/eggdice/.codeium/windsurf/bin:$PATH"

# .NET SDK (latest version via Homebrew)
export PATH="/opt/homebrew/opt/dotnet/bin:$PATH"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/eggdice/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Added by Hugging Face CLI installer
export PATH="/Users/eggdice/.local/bin:$PATH"


# Activity Tracker — shell history with timestamps
setopt EXTENDED_HISTORY          # Save timestamp with each command
setopt INC_APPEND_HISTORY        # Write to history immediately, not on shell exit
export HISTSIZE=50000            # Commands to keep in memory
export SAVEHIST=50000            # Commands to save to file
export HISTFILE="$HOME/.zsh_history"

# Activity Tracker — quick log alias
alias log='bash /Users/eggdice/Projects/activity-tracker/scripts/log.sh'

# Activity Tracker — harvest yesterday's log on first terminal open
(source "/Users/eggdice/Projects/activity-tracker/scripts/harvest.sh" &>/dev/null &)
