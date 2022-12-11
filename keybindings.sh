#!/bin/sh
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Page_Up', '<Super><Alt>Left', '<Control><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Page_Down', '<Super><Alt>Right', '<Control><Super>Right']"
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['Print', '<Super><Shift>s']"
