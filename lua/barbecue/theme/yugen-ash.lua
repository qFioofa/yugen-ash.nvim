-- utilyre/barbecue.nvim
--
-- Barbecue looks up a theme by `vim.g.colors_name` under
-- `lua/barbecue/theme/<name>.lua`, and reloads it on every ColorScheme event.
-- Shipping the palette-backed table here keeps the winbar in sync with every
-- yugen-ash variant instead of falling back to Barbecue's stock colors.

local ok, yugen = pcall(require, "yugen-ash")
local config = (ok and yugen.get_config and yugen.get_config()) or {}
local variant = config.variant or "main"
local p = require("yugen-ash.palette").get(variant)

local background_name = (config.groups or {}).background or "color700"
local background = config.transparent and p.none or (p[background_name] or background_name)

return {
	normal = { fg = p.color300, bg = background },

	ellipsis = { fg = p.color500 },
	separator = { fg = p.color500 },
	modified = { fg = p.amber, bold = true },

	dirname = { fg = p.color400 },
	basename = { fg = p.color200, bold = true },
	context = {},

	context_file = { fg = p.color300 },
	context_module = { fg = p.violet },
	context_namespace = { fg = p.violet },
	context_package = { fg = p.violet },
	context_class = { fg = p.gold },
	context_method = { fg = p.primary },
	context_property = { fg = p.color300 },
	context_field = { fg = p.color300 },
	context_constructor = { fg = p.gold },
	context_enum = { fg = p.gold },
	context_interface = { fg = p.gold },
	context_function = { fg = p.primary },
	context_variable = { fg = p.color200 },
	context_constant = { fg = p.tide },
	context_string = { fg = p.sage },
	context_number = { fg = p.violet },
	context_boolean = { fg = p.tide },
	context_array = { fg = p.color300 },
	context_object = { fg = p.color300 },
	context_key = { fg = p.color300 },
	context_null = { fg = p.violet },
	context_enum_member = { fg = p.tide },
	context_struct = { fg = p.gold },
	context_event = { fg = p.gold },
	context_operator = { fg = p.frost },
	context_type_parameter = { fg = p.amber },
}
