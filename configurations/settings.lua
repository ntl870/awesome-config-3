local settings = {}

settings.wlan_interface = "wlo1"
settings.lan_interface = "enp2s0"
-- Turn this to false if you have no bluetooth available, otherwise your dbus will get polutate with bluetoothctl
settings.is_bluetooth_presence = true
settings.script_dir = "/home/devops/.config/awesome/scripts/"
settings.openweathermap_api_key = "61dec65e599e81c7da0ba7b73d1a6349"
settings.openweathermap_coordinates = {
	"16.0544", -- lat
	"108.2022" -- lng
}
return settings
