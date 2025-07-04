#!/bin/bash

HISTSIZE=1000
SAVEHIST=1000
setopt notify
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'

HISTFILE=$HOME/.zsh_history
setopt appendhistory

setopt interactive_comments # allow use of comments in interactive shell
stty stop undef # disable ctrl-s to freeze terminal
unsetopt BEEP # disable beep
zle_highlight=('paste:none')

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# colors
autoload -Uz colors && colors

# useful functions
source "$ZDOTDIR/zsh-functions"

# files to source
# zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
#zsh_add_completion "esc/conda-zsh-completion" false
# for more plugins: https://github.com/unixorn/awesome-zsh-plugins
# for more completions: https://github.com/zsh-users/zsh-completions

# fzf shell integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# exports
export PATH=$PATH:$HOME/.local/bin

# zoxide
eval "$(zoxide init zsh)"
