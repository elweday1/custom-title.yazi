--- @since 25.2.7

local function expand_env(s)
	return s:gsub("%$([%w_]+)", os.getenv):gsub("${([%w_]+)}", os.getenv)
end

local function setup(_, opts)
	opts = opts or {}
	local title = opts.title or "Yazi"

	Header.redraw = function(self)
		local display
		if type(title) == "function" then
			display = title() or "Yazi"
		else
			display = expand_env(tostring(title))
		end
		return {
			ui.Line(display):area(self._area):align(ui.Align.CENTER),
		}
	end
end

return { setup = setup }
