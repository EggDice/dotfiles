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
  vcs_info
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
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# EDITOR
export EDITOR="vim"

# Install the fuck
eval "$(thefuck --alias)"
