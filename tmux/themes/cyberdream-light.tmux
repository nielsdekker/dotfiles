#!/usr/bin/env bash

# Cyberdream colors for Tmux, based on tokyonight config

set -g mode-style "fg=#0057d1,bg=#acacac"

set -g message-style "fg=#0057d1,bg=#acacac"
set -g message-command-style "fg=#0057d1,bg=#acacac"

set -g pane-border-style "fg=#acacac"
set -g pane-active-border-style "fg=#0057d1"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#0057d1,bg=#e9e9ec"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#e9e9ed,bg=#0057d1,bold] #S #[fg=#0057d1,bg=#e9e9ec,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#e9e9ec,bg=#e9e9ec,nobold,nounderscore,noitalics]#[fg=#0057d1,bg=#e9e9ec] #{prefix_highlight} #[fg=#acacac,bg=#e9e9ec,nobold,nounderscore,noitalics]#[fg=#0057d1,bg=#acacac] %Y-%m-%d | %I:%M %p #[fg=#0057d1,bg=#acacac,nobold,nounderscore,noitalics] #[fg=#e9e9ed,bg=#0057d1,bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=#e9e9ec,bg=#e9e9ec,nobold,nounderscore,noitalics] #[fg=#0057d1,bg=#e9e9ec] #{prefix_highlight} #[fg=#acacac,bg=#e9e9ec,nobold,nounderscore,noitalics] #[fg=#0057d1,bg=#acacac] %Y-%m-%d | %H:%M #[fg=#0057d1,bg=#acacac,nobold,nounderscore,noitalics] #[fg=#e9e9ed,bg=#0057d1,bold] #h "
}

setw -g window-status-activity-style "underscore,fg=#008c99,bg=#e9e9ec"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#008c99,bg=#e9e9ec"
setw -g window-status-format "#[fg=#e9e9ec,bg=#e9e9ec,nobold,nounderscore,noitalics] #[default] #I | #W #F #[fg=#e9e9ec,bg=#e9e9ec,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#e9e9ec,bg=#acacac,nobold,nounderscore,noitalics] #[fg=#0057d1,bg=#acacac,bold] #I | #W #F #[fg=#acacac,bg=#e9e9ec,nobold,nounderscore,noitalics]"
