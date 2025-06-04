-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- configure size

config.initial_cols = 180
config.initial_rows = 40

-- configure appareance

config.font_size = 12
config.color_scheme = 'Tokyo Night Storm'


-- center the window on the screen

local function center_window_once(window)
  wezterm.GLOBAL.windows_centered = wezterm.GLOBAL.windows_centered or {}

  local window_id = window:window_id() .. ""
  if wezterm.GLOBAL.windows_centered[window_id] then
    return
  end

  local screen = wezterm.gui.screens().active

  local width = screen.width * 0.85
  local height = screen.height * 0.80

  window:set_inner_size(width, height)

  local dimensions = window:get_dimensions()
  local x = (screen.width - dimensions.pixel_width) * 0.5
  local y = (screen.height - dimensions.pixel_height) * 0.5

  wezterm.GLOBAL.windows_centered[window_id] = true

  window:set_position(x, y)
end

wezterm.on("update-status", function(window)
  center_window_once(window)
end)

-- return the config

return config