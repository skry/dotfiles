# $HOME/.bashrc

# Aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto --time-style=long-iso'
alias pdraw='echo - | awk "{printf \"%.1f\", $(( $(cat /sys/class/power_supply/BAT0/current_now) * $(cat /sys/class/power_supply/BAT0/voltage_now) )) / 1000000000000 }" ; echo " W "'

# Variables
export BROWSER=chromium

# Proper history: Append to log from all instances, ignoring duplicates
unset HISTFILESIZE
HISTSIZE=10000
HISTCONTROL=ignoreboth:erasedups
HISTTIMEFORMAT="%F %T  "
PROMPT_COMMAND="history -a"
shopt -s histappend

# Disable completion when input buffer is empty
shopt -s no_empty_cmd_completion

if [ -f "/usr/share/nvm/init-nvm.sh" ]; then
  . /usr/share/nvm/init-nvm.sh
fi

# Directory colors
if [ -f "$HOME/.dir_colors" ]; then
  eval `dircolors -b $HOME/.dir_colors`
fi

# Prompt
if [ -f "/usr/bin/liquidprompt" ]; then
  . /usr/bin/liquidprompt
else
  PS1='[\u@\h \W]\$ '
fi

