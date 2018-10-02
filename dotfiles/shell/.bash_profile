# $HOME/.bash_profile

# Source user profile common for all shells
if [ -f $HOME/.profile ]; then
  . $HOME/.profile
fi

# Source bashrc if interactive
if [[ -f $HOME/.bashrc ]] && [[ $- == *i* ]]; then
  . $HOME/.bashrc
fi

# ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > $HOME/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
  eval "$(<$HOME/.ssh-agent-thing)"
  ssh-add
fi

