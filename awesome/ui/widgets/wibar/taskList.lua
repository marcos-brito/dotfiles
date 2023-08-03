local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

local taskListButtons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

local function createTaskList(s)
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = taskListButtons,
		style = {
			shape = beautiful.wibarItemsShape,
		},
		layout = {
			spacing = 8,
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			{
				{
					id = "clienticon",
					widget = awful.widget.clienticon,
				},
				margins = 5,
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
			create_callback = function(self, c, index, objects) --luacheck: no unused
				self:get_children_by_id("clienticon")[1].client = c
			end,
		},
	})

	local taskList = wibox.widget({
		{
			s.mytasklist,
			layout = wibox.layout.fixed.horizontal,
		},
		widget = wibox.container.place,
	})
	return taskList
end

return createTaskList
