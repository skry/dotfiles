#!/bin/sh

xresources=( /etc/X11/xinit/.Xresources
             $HOME/.Xresources
             $HOME/.Xresources_local
)

for xresource in "${xresources[@]}"; do
  if [ -f "$xresource" ]; then
    xrdb -merge "$xresource"
  fi
done
unset xresource xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -f "$HOME/.xinitrc_local" ]; then
  . "$HOME/.xinitrc_local"
fi

sxhkd &
exec bspwm

