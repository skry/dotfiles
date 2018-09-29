# $HOME/.bash_profile

# Source user profile common for all shells
if [ -f $HOME/.profile ]; then
  . $HOME/.profile
fi

# Source bashrc settings if interactive
if [[ -f $HOME/.bashrc ]] && [[ $- == *i* ]]; then
  . $HOME/.bashrc
fi

