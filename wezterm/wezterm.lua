local wezterm = require("wezterm")
local rose_pine_dawn_theme = require("themes/rose_pine_dawn")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
  config:set_strict_mode(true)
end

-------------
-- Font stuff
-------------
config.font = wezterm.font("JetbrainsMono Nerd Font")

----------
-- Theming
----------
config.colors = rose_pine_dawn_theme.colors()
config.window_frame = rose_pine_dawn_theme.window_frame()
config.window_decorations = "INTEGRATED_BUTTONS"

-----------
-- Keybinds
-----------
local act = wezterm.action
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  -- Spawning tabs
  { key = "%",  mods = "LEADER|SHIFT", action = act.SplitHorizontal { domain = "CurrentPaneDomain", cwd = wezterm.home_dir } },
  { key = "\"", mods = "LEADER|SHIFT", action = act.SplitVertical { domain = "CurrentPaneDomain", cwd = wezterm.home_dir } },
  { key = "c",  mods = "LEADER",       action = act.SpawnCommandInNewTab { domain = "CurrentPaneDomain", cwd = wezterm.home_dir } },

  -- Navigation
  { key = "h",  mods = "LEADER",       action = act.ActivatePaneDirection("Left") },
  { key = "j",  mods = "LEADER",       action = act.ActivatePaneDirection("Down") },
  { key = "k",  mods = "LEADER",       action = act.ActivatePaneDirection("Up") },
  { key = "l",  mods = "LEADER",       action = act.ActivatePaneDirection("Right") },
}

return config
