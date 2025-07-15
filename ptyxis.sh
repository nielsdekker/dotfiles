#!/bin/bash
# Updates the settings for ptyxis terminal and make sure all the correct stuff
# is installed.

# Make sure the correct font is installed
#
# ```bash
# dnf install cascadia-code-nf-fonts
# ```

# font setttings
gsettings set org.gnome.Ptyxis use-system-font false
gsettings set org.gnome.Ptyxis font-name 'Cascadia Code NF Semi-Bold 12'

gsettings set org.gnome.Ptyxis interface-style 'system'

# Shortcuts overwrites
gsettings set org.gnome.Ptyxis.Shortcuts new-tab '<ctrl>t'
gsettings set org.gnome.Ptyxis.Shortcuts close-tab '<ctrl>q'
gsettings set org.gnome.Ptyxis.Shortcuts move-previous-tab '<ctrl>bracketleft'
gsettings set org.gnome.Ptyxis.Shortcuts move-next-tab '<ctrl>bracketright'
gsettings set org.gnome.Ptyxis.Shortcuts move-tab-left '<ctrl>braceleft'
gsettings set org.gnome.Ptyxis.Shortcuts move-tab-right '<ctrl>braceright'

gsettings set org.gnome.Ptyxis.Shortcuts focus-tab-1 '<ctrl>1'
gsettings set org.gnome.Ptyxis.Shortcuts focus-tab-2 '<ctrl>2'
gsettings set org.gnome.Ptyxis.Shortcuts focus-tab-3 '<ctrl>3'
gsettings set org.gnome.Ptyxis.Shortcuts focus-tab-4 '<ctrl>4'
gsettings set org.gnome.Ptyxis.Shortcuts focus-tab-5 '<ctrl>5'
gsettings set org.gnome.Ptyxis.Shortcuts focus-tab-6 '<ctrl>6'
gsettings set org.gnome.Ptyxis.Shortcuts focus-tab-7 '<ctrl>7'
gsettings set org.gnome.Ptyxis.Shortcuts focus-tab-8 '<ctrl>8'
gsettings set org.gnome.Ptyxis.Shortcuts focus-tab-9 '<ctrl>9'
