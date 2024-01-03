local wezterm = require 'wezterm'

local colors = require('lua/themes/kanagawa-dragon').colors

local config = {
  colors = colors
}

config.font = wezterm.font('CaskaydiaCove Nerd Font Mono')
config.font_size = 13.0

config.hide_tab_bar_if_only_one_tab = true

return config
