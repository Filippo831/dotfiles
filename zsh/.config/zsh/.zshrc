#██████╗░██████╗██╗░░██╗██████╗░░█████╗░
#╚════██║██╔════╝██║░░██║██╔══██╗██╔══██╗
#░░███╔═╝╚█████╗░███████║██████╔╝██║░░╚═╝
#██╔══╝░░░╚═══██╗██╔══██║██╔══██╗██║░░██╗
#███████╗██████╔╝██║░░██║██║░░██║╚█████╔╝
#╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░


# COMPLETION
plugin=(zsh-syntax-highlighting vi-mode git sudo)
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/completion.zsh

# PROMPT STYLE
#fpath=($ZDOTDIR/prompt $fpath)
#autoload -Uz prompt_purification_setup; prompt_purification_setup

fpath=($ZDOTDIR/pure $fpath)
autoload -U promptinit; promptinit
prompt zefram 

ZSH_THEME=robbyrussell


# GENERAL ALIASES
alias ll="ls -al"
alias ls="ls -p"
alias ..="cd .."
alias hibernate="sudo systemctl hibernate"


# ZSH DIRECTORY STACK
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.


# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# PLUGINS
fpath=($ZDOTDIR/plugins $fpath)
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$PATH:$ZDOTDIR/plugins"


# FLUTTER
export PATH="$PATH:$HOME/gitClones/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"



# hdmi audio output alias
alias hao="pactl set-card-profile 0 output:hdmi-stereo"

# set keyboard "speed"
xset r rate 300 50

# change keyboard layout
alias italian="setxkbmap it"
alias aoeu="setxkbmap -option \"caps:swapescape\""
alias dvorak="setxkbmap dvorak"
alias sshserver="ssh filippoa@100.74.177.144"

# reverse search
bindkey -v
bindkey '^r' history-incremental-search-backward

source $HOME/.config/zsh/ohmyzsh/oh-my-zsh.sh

export PATH=$PATH:/home/filippo/.spicetify

# Created by `pipx` on 2023-12-06 11:33:56
export PATH="$PATH:/home/filippo/.local/bin"

bindkey -s ^f "tmux-sessionizer\n"

# Created by `pipx` on 2024-03-08 16:11:01
export PATH="$PATH:/home/filippoa/.local/bin"

# bun completions
[ -s "/home/filippoa/.bun/_bun" ] && source "/home/filippoa/.bun/_bun"
