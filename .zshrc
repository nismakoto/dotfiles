#################################################
# Setting
#################################################
export LANG=en_US.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
limit coredumpsize 102400

#################################################
# Prompt
#################################################
autoload colors
colors

case ${UID} in
  0)
    PROMPT="[%{${fg[cyan]}%}%n@%m%{${reset_color}%}] %{${fg[cyan]}%}%#%{${reset_color}%} "
    PROMPT2="%B%{${fg[cyan]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%{${fg[magenta]}%}correct:%R -> %r [n y a e]? %{${reset_color}%}"
    RPROMPT="%{${fg[cyan]}%}[%/]%{${reset_color}%}"
    ;;
  *)
    PROMPT="[%n@%m] %{${fg[cyan]}%}%#%{${reset_color}%} "
    PROMPT2="%B%{${fg[cyan]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%{${fg[magenta]}%}correct:%R -> %r [n y a e]? %{${reset_color}%}"
    RPROMPT="%{${fg[cyan]}%}[%/]%{${reset_color}%}"
    ;;
esac

#################################################
# Completion
#################################################
autoload -U compinit
compinit

unsetopt promptcr
setopt prompt_subst
setopt nobeep
setopt long_list_jobs
setopt list_types
setopt auto_resume
setopt auto_list
setopt list_packed
setopt hist_ignore_dups
setopt autopushd
setopt pushd_ignore_dups
setopt extended_glob
setopt auto_menu
setopt extended_history
setopt equals
setopt magic_equal_subst
setopt hist_verify
setopt numeric_glob_sort
setopt print_eight_bit
setopt share_history
setopt auto_cd
setopt auto_param_keys
setopt auto_param_slash
setopt correct
setopt noautoremoveslash

zstyle ':completion:*:default' menu select=1
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#################################################
# Alias
#################################################
setopt complete_aliases

case "${OSTYPE}" in
  freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
  linux*)
    alias ls="ls --color"
    ;;
esac
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias gvim="gvim --remote-tab-silent"
alias lpr_duplex='lpr -o Duplex=DuplexNoTumble'

#################################################
# Git
#################################################
export GIT_EDITOR=vim
