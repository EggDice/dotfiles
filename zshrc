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
export FZF_DEFAULT_COMMAND='ag -g ""'

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
