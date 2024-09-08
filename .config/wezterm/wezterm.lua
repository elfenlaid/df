local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

config.color_scheme = 'Tokyo Night'
-- Choose your favourite font, make sure it's installed on your machine
config.font = wezterm.font({ family = 'JetbrainsMono Nerd Font' })
-- And a font size that won't have you squinting
config.font_size = 14

config.window_decorations = 'RESIZE'

config.window_frame = {
  font = wezterm.font({ family = 'JetbrainsMono Nerd Font', weight = 'Bold' }),
  font_size = 12,
}

config.set_environment_variables = {
  PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
}

local function resize_pane(key, direction)
  return {
    key = key,
    action = wezterm.action.AdjustPaneSize { direction, 3 }
  }
end

local function move_pane(key, direction)
  return {
    key = key,
    mods = 'SUPER',
    action = wezterm.action.ActivatePaneDirection(direction),
  }
end

config.keys = {
  -- ... add these new entries to your config.keys table
  {
    key = ',',
    mods = 'SUPER',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
      args = { 'hx', wezterm.config_file },
    },
  },
  {
    key = 'D',
    mods = 'SUPER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'd',
    mods = 'SUPER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'p',
    mods = 'SUPER',
    action = wezterm.action.ActivateCommandPalette
  },

  move_pane('j', 'Down'),
  move_pane('k', 'Up'),
  move_pane('h', 'Left'),
  move_pane('l', 'Right'),

  {
    -- When we push LEADER + R...
    key = 'r',
    mods = 'SUPER',
    -- Activate the `resize_panes` keytable
    action = wezterm.action.ActivateKeyTable {
      name = 'resize_panes',
      -- Ensures the keytable stays active after it handles its
      -- first keypress.
      one_shot = false,
      -- Deactivate the keytable after a timeout.
      timeout_milliseconds = 1000,
    }
  },
}

config.key_tables = {
  resize_panes = {
    resize_pane('j', 'Down'),
    resize_pane('k', 'Up'),
    resize_pane('h', 'Left'),
    resize_pane('l', 'Right'),
  },
}

return config
