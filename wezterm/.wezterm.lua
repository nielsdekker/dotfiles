local wezterm = require("wezterm");

local config = {
  color_scheme = "Catppuccin Frappe",
  font = wezterm.font {
    family = "CaskaydiaCove Nerd Font Mono",
    harfbuzz_features = { "calt=1", "ss01=1" },
  },
  use_fancy_tab_bar = false,
}

wezterm.on(
  "format-tab-title",
  function(tab, tabs, panes, config, hover, max_width)
    local active_command = tab.active_pane.foreground_process_name:match("[^/]*$")
    return " " .. (tab.tab_index + 1) .. ": " .. active_command .. " "
  end
)

return config;
