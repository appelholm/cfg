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
zstyle ':prompt:pure:git:branch'        color "yellow"
zstyle ':prompt:pure:git:dirty'         color "#fabd2f"
zstyle ':prompt:pure:prompt:success'    color "cyan"
zstyle ':prompt:pure:prompt:error'      color "red"
zstyle ':prompt:pure:path'              color "blue"

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

# load module files
for file in ~/.zsh/autoload/*; do
    source "$file"
done
