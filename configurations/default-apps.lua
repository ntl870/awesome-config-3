local filesystem = require("gears.filesystem")
local beautiful = require("beautiful")
local config_dir = filesystem.get_configuration_dir()
local default_apps = {}

default_apps.screeh_shot = "spectacle"
default_apps.lock_screen = config_dir .. "scripts/i3lock-blur "
default_apps.software_updater = "alacritty --title 'System upgrade' -e sudo pacman -Syu"
default_apps.bluetooth_manager = "alacritty -e bluetoothctl"
default_apps.network_manager = "alacritty -e nm-applet"
default_apps.app_menu = "rofi -show"

return default_apps
