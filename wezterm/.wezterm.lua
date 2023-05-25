local wezterm = require("wezterm");

local config = {
  color_scheme = "Catppuccin Latte",
  font = wezterm.font {
    family = "Cascadia Code",
    harfbuzz_features = { "calt=1", "ss01=1" },
    weight = "Bold",
  },
  font_size = 13.0,
  use_fancy_tab_bar = false,
  enable_wayland = true,
  front_end = "WebGpu",
  -- window_decorations = "INTEGRATED_BUTTONS | RESIZE"
}

wezterm.on(
  "format-tab-title",
  function(tab, tabs, panes, config, hover, max_width)
    local active_command = tab.active_pane.foreground_process_name:match("[^/]*$")
    return " " .. (tab.tab_index + 1) .. ": " .. active_command .. " "
  end
)

return config;
