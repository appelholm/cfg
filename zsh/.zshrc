# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kj/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt
fpath+=("$HOME/.zsh/pure")
autoload -Uz promptinit
promptinit
prompt pure
#PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
#autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# RPROMPT=\$vcs_info_msg_0_
# zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
# zstyle ':vcs_info:*' enable git

# Options added by me
setopt correct
setopt correct_all
setopt autopushd

# Completions added by me
# Partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Aliases
alias ls='ls --color=tty'
alias ll='ls -la'

alias -s {c,h,json,yaml,py}=nvim

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vi mode
for file in ~/.zsh/autoload/*; do
    source "$file"
done
