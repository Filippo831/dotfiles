#████╗░██████╗██╗░░██╗██████╗░░█████╗░
#╚════██║██╔════╝██║░░██║██╔══██╗██╔══██╗
#░░███╔═╝╚█████╗░███████║██████╔╝██║░░╚═╝
#██╔══╝░░░╚═══██╗██╔══██║██╔══██╗██║░░██╗
#███████╗██████╔╝██║░░██║██║░░██║╚█████╔╝
#╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░


# COMPLETION
plugin=(zsh-syntax-highlighting vi-mode git)
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
alias ls="ls --color=auto -p"
alias ..="cd .."
alias hibernate="sudo systemctl hibernate"

# FZF ALIAS
alias f='cd $(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv | fzf)'

# PYTHON VENV ACTIVATE ALIAS
alias pv='source venv/bin/activate'


# ZSH DIRECTORY STACK
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.


# FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)


# PLUGINS
fpath=($ZDOTDIR/plugins $fpath)
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/plugins/sudo/sudo.plugin.zsh

export PATH="$PATH:$ZDOTDIR/plugins"

export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=37;41:sg=30;43:tw=30;42:ow=34;42"



# FLUTTER
export PATH="$PATH:$HOME/gitClones/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"


export HYPRSHOT_DIR="/home/filippoa/Pictures/Screeshots"

# hdmi audio output alias
alias hao="pactl set-card-profile 0 output:hdmi-stereo"

# set keyboard "speed"
xset r rate 300 50

# change keyboard layout
alias italian="setxkbmap it"
alias aoeu="setxkbmap -option \"caps:swapescape\""
alias dvorak="setxkbmap dvorak"
alias sshserver-local="ssh server@192.168.1.20 -p 5625"

# reverse search
bindkey -v
bindkey '^r' history-incremental-search-backward

export PATH=$PATH:/home/filippo/.spicetify


# Created by `pipx` on 2023-12-06 11:33:56
export PATH="$PATH:/home/filippo/.local/bin"

bindkey -s ^f "tmux-sessionizer\n"

# Created by `pipx` on 2024-03-08 16:11:01
export PATH="$PATH:/home/filippoa/.local/bin"

# bun completions
[ -s "/home/filippoa/.bun/_bun" ] && source "/home/filippoa/.bun/_bun"

# change theme to starship
eval "$(starship init zsh)"

