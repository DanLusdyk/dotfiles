-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_scroll_bar = true
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 11.0

config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 }
local act = wezterm.action
config.keys = {
  {
    mods   = "LEADER|SHIFT",
    key    = '"',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    mods   = "LEADER|SHIFT",
    key    = '%',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    mods   = "LEADER",
    key    = "j",
    action = act.ActivatePaneDirection("Down")
  },
  {
    mods   = "LEADER",
    key    = "k",
    action = act.ActivatePaneDirection("Up")
  },
  {
    mods   = "LEADER",
    key    = "h",
    action = act.ActivatePaneDirection("Left")
  },
  {
    mods   = "LEADER",
    key    = "l",
    action = act.ActivatePaneDirection("Right")
  },
  {
    mods   = "LEADER",
    key    = "x",
    action = act.CloseCurrentPane { confirm = true }
  },
  {
    mods   = "LEADER|SHIFT",
    key    = "&",
    action = act.CloseCurrentTab { confirm = true }
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  {
    mods   = "LEADER",
    key    = "n",
    action = act.ActivateTabRelative(1)
  },
  {
    mods   = "LEADER",
    key    = "p",
    action = act.ActivateTabRelative(-1)
  },
  {
    key = 'F',
    mods = 'CTRL|SHIFT',
    action = act.Search { CaseInSensitiveString = "" },
  },
}

return config
