local gears = require("gears");
local awful = require("awful");
local awesome = awesome
local hotkeys_popup = require("awful.hotkeys_popup")
local default_apps = require("configurations.default-apps")
require('awful.autofocus')
local globalkeys = gears.table.join(
    awful.key(
		{ modkey,},
		"F1",
		hotkeys_popup.show_help,
        {description="show help", group="awesome"}
	),
    awful.key(
		{ modkey,},
		"Escape",
		awful.tag.history.restore,
        {description = "go back", group = "tag"}
	),

	-- TODO: Will be used for toggling tabbed layout
    -- Layout manipulation
	-- Swap client
    awful.key(
		{ modkey, "Shift"},
		"a",
		function () awful.client.swap.byidx(1) end,
        {description = "swap with next client by index", group = "client"}
	),
    awful.key(
		{ modkey, "Shift"},
		"Left",
		function () awful.client.swap.byidx(1) end,
        {description = "swap with next client by index", group = "client"}
	),
    awful.key(
		{ modkey, "Shift"},
		"d",
		function () awful.client.swap.byidx(-1) end,
        {description = "swap with previous client by index", group = "client"}
	),
    awful.key(
		{ modkey, "Shift"},
		"Right",
		function () awful.client.swap.byidx(-1) end,
        {description = "swap with previous client by index", group = "client"}
	),
	-- Focus client
    awful.key(
		{ "Mod1"},
		"Tab",
        function ()
            awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key(
		{ "Mod1","Shift"}, 
		"Tab",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
	-- Relative focus
    awful.key(
		{ modkey, "Control" },
		"j",
		function () awful.screen.focus_relative(1) end,
        {description = "focus the next screen", group = "screen"}
	),
    awful.key(
		{ modkey, "Control" },
		"k",
		function () awful.screen.focus_relative(-1) end,
        {description = "focus the previous screen", group = "screen"}
	),
	-- Focus previous
    awful.key(
		{ modkey,},
		"Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}
	),
    awful.key(
		{ modkey,},
		"u", awful.client.urgent.jumpto,
        {description = "jump to urgent client", group = "client"}
	),

    -- Standard program
	awful.key(
		{modkey}, 
		'z',
		function()
			awful.util.spawn_with_shell("nemo")
		end,
		{description = 'open default file manager', group = 'launcher'}
	),
	awful.key(
		{modkey}, 
		'c',
		function()
			awful.util.spawn_with_shell("code")
		end,
		{description = 'open default code editor', group = 'launcher'}
	),
	awful.key(
		{modkey}, 
		'b',
		function()
			awful.util.spawn_with_shell("firefox")
		end,
		{description = 'open default web browser', group = 'launcher'}
	),
	awful.key(
		{modkey}, 
		'y',
		function()
			awful.util.spawn_with_shell("spotify")
		end,
		{description = 'open spotify', group = 'launcher'}
	),
    awful.key(
		{ modkey,},
		"t",
		function () awful.spawn(terminal) end,
        {description = "open a terminal", group = "launcher"}
	),
	awful.key(
		{ modkey,},
		"p",
		function () awful.util.spawn_with_shell("postman") end,
        {description = "open postman", group = "launcher"}
	),
    awful.key(
		{ modkey, "Control" },
		"r",
		awesome.restart,
        {description = "reload awesome", group = "awesome"}
	),
    awful.key(
		{ modkey, "Shift"},
		"q",
		function ()
			awesome.emit_signal('module::exit_screen:show')
		end,
        {description = "Launch exit screen", group = "launcher"}
	),
	awful.key({modkey}, 'o', awful.client.movetoscreen,
	{description = 'move window to next screen', group = 'client'}),
	-- Client resize master
    awful.key(
		{ "Mod1", "Shift"},
		"Right",
		function () awful.tag.incmwfact( 0.05) end,
        {description = "increase master width factor", group = "layout"}
	),
    awful.key({ "Mod1", "Shift"},
		"Left",
		function () awful.tag.incmwfact(-0.05) end,
        {description = "decrease master width factor", group = "layout"}
	),
	-- Client resize
    awful.key({ "Mod1", "Shift"},
		"Up",
		function () awful.client.incwfact(0.05) end,
        {description = "decrease master width factor", group = "layout"}
	),
    awful.key({ "Mod1", "Shift"},
		"Down",
		function () awful.client.incwfact(-0.05) end,
        {description = "decrease master width factor", group = "layout"}
	),
	-- Increase/Decrease numbers of master
    awful.key(
		{ modkey, "Shift"},
		"Right",
		function () awful.tag.incnmaster( 1, nil, true) end,
    	{description = "increase the number of master clients", group = "layout"}
	),
    awful.key(
		{ modkey, "Shift"},
		"Left",
		function () awful.tag.incnmaster(-1, nil, true) end,
        {description = "decrease the number of master clients", group = "layout"}
	),

	-- Increase/Decrease numbers of columns
    awful.key(
		{ modkey, "Control" },
		"+",
		function () awful.tag.incncol( 1, nil, true)    end,
        {description = "increase the number of columns", group = "layout"}
	),
    awful.key(
		{ modkey, "Control" },
		"-",
		function () awful.tag.incncol(-1, nil, true)    end,
        {description = "decrease the number of columns", group = "layout"}
	),

	-- Next layout
    awful.key(
		{ modkey,},
		"space",
		function () awful.layout.inc(1) end,
    	{description = "select next", group = "layout"}
	),

	-- Previous layout
    awful.key(
		{ modkey, "Control"},
		"space",
		function () awful.layout.inc(-1)                end,
        {description = "select previous", group = "layout"}
	),

    awful.key(
		{ modkey, "Control" },
		"n",
        function ()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
            	c:emit_signal(
                    "request::activate", "key.unminimize", {raise = true}
                )
            end
        end,
        {description = "restore minimized", group = "client"}
	),
	awful.key({modkey}, 'd', function()
		local flag = false
		for _, c in ipairs(mouse.screen.selected_tag:clients()) do
			if c.minimized == true then flag = true end
			c.minimized = true
		end
		for _, c in ipairs(mouse.screen.selected_tag:clients()) do
			if flag == true then c.minimized = false end
		end
	end, {description = 'minimize all clients', group = 'awesome'}),
	awful.key(
		{modkey}, 
		'w', 
		awful.tag.viewprev, 
		{description = 'view previous tag', group = 'tag'}
	),
	awful.key(
		{modkey}, 
		's', 
		awful.tag.viewnext, 
		{description = 'view next tag', group = 'tag'}
	),

    -- Prompt
    -- awful.key(
	-- 	{ modkey },
	-- 	"r",
	-- 	function () awful.screen.focused().mypromptbox:run() end,
    --     {description = "run prompt", group = "launcher"}
	-- ),

    awful.key(
		{ modkey }, 
		"x",
        function ()
            awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
    	{description = "lua execute prompt", group = "awesome"}
	),
	awful.key(
		{modkey},
		'F10',
		function()
			awful.util.spawn_with_shell('sh ~/.config/awesome/autostart/touchpad.sh',false)
		end,
		{description = 'Toggle Touchpad', group = 'hotkeys'}
	),
	-- My keybindings
	awful.key(
		{ modkey },
		"r",
		--function() awful.spawn("rofi -show drun -columns 2 -theme codeDark -no-show-icons") end
		function() awful.spawn(default_apps.app_menu, false) end,
		{description = "Application launcher", group = 'launcher'}
	),

	awful.key(
		{},
		'XF86AudioRaiseVolume',
		function()
			awful.spawn('amixer -D pulse sset Master 5%+', false)
			awesome.emit_signal("update::volume")
		end,
		{description = 'increase volume up by 5%', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86AudioLowerVolume',
		function()
			awful.spawn('amixer -D pulse sset Master 5%-', false)
			awesome.emit_signal("update::volume")
		end,
		{description = 'decrease volume up by 5%', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86AudioMute',
		function()
			awful.spawn('amixer -D pulse set Master 1+ toggle', false)
			awesome.emit_signal("toggle::mute")
		end,
		{description = 'toggle mute', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86MonBrightnessUp',
		function()
			awful.spawn('light -A 10', false)
			awesome.emit_signal("update::brigtness")
		end,
		{description = 'increase brightness by 10%', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86MonBrightnessDown',
		function()
			awful.spawn('light -U 10', false)
			awesome.emit_signal("update::brigtness")
		end,
		{description = 'decrease brightness by 10%', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86Display',
		function()
			awful.spawn.single_instance('kcmshell5 kcm_kscreen', false)
		end,
		{description = 'Display configuration', group = 'hotkeys'}
	),

	awful.key(
		{},
		'Print',
		function()
			awful.spawn.single_instance('spectacle', false)
		end,
		{description = 'Display configuration', group = 'hotkeys'}
	),
	awful.key(
		{ modkey, "Shift"},
		's',
		function()
			local c = client.focus
			if c.sticky then
				c.floating = not c.floating
				c.sticky = not c.sticky
				c.ontop = not c.ontop
			else
				c.sticky = true
				c.floating = true
				c.ontop = true
			end
		end,
		{description = 'Toggle client sticky', group = 'client'}
	)
)

return globalkeys
