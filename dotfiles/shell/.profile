# $HOME/.profile

# Variables
export EDITOR=vim
export PAGER=less
export XDG_CONFIG_HOME="$HOME/.config"

# Color in less
if [ -f "/usr/bin/source-highlight-esc.sh" ]; then
  export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
fi
export LESS=-R
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline

if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

