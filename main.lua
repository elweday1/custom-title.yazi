--- @since 25.2.7

local function expand_env(s)
	return s:gsub("%$([%w_]+)", os.getenv):gsub("${([%w_]+)}", os.getenv)
end

local function setup(_, opts)
	opts = opts or {}
	local title = opts.title or "Yazi"
	local align = opts.align or "center"

	local align_map = {
		left = ui.Align.LEFT,
		center = ui.Align.CENTER,
		right = ui.Align.RIGHT,
	}
	local lua_align = align_map[align] or ui.Align.CENTER

	Header.redraw = function(self)
		local cwd = ""
		if cx and cx.active and cx.active.current then
			cwd = tostring(cx.active.current.cwd or "")
		end

		local display
		if type(title) == "function" then
			display = title() or "Yazi"
		else
			display = expand_env(tostring(title))
		end

		display = display:gsub("%%d", cwd)

		return {
			ui.Line(display):area(self._area):align(lua_align),
		}
	end
end

return { setup = setup }
