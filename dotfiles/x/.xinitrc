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

xsetroot -cursor_name left_ptr

xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset +fp $HOME/.fonts
xset fp rehash

setxkbmap fi

for output in $(xrandr --prop | grep -E -o -i "^[A-Z\-]+-[0-9]+")
do
  xrandr --output "$output" --set "scaling mode" "Full aspect"
done

if [ -f "$HOME/.xinitrc_local" ]; then
  . "$HOME/.xinitrc_local"
fi

exec bspwm

