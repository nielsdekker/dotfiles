local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
  config:set_strict_mode(true)
end

-------------
-- Font stuff
-------------
config.font_size = 14
config.line_height = 1.2
config.font = wezterm.font({
  family = "Monaspace Neon",
  weight = 500,
  harfbuzz_features = { "ss01", "ss02", "ss03" }
})
config.font_rules = {
  {
    italic = true,
    font = wezterm.font({
      family = "Monaspace Radon",
      weight = 700,
      harfbuzz_features = { "ss01", "ss02", "ss03" }
    })
  }
}

----------
-- Theming
----------
config.color_scheme = "tokyonight-day"
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
