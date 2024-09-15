require("catppuccin").setup({
	flavour = "macchiato", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
	show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		mason = true,
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- GITHUB LIGHT
require("github-theme").setup({
	options = {
		transparent = true, -- disables setting the background color.
	},
})

-- GRUVBOX BABY
-- Example config in Lua
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "italic"

-- Each highlight group must follow the structure:
-- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
-- See also :h highlight-guifg
-- Example:
-- vim.g.gruvbox_baby_highlights = { Normal = { fg = "#5da0c7", bg = "NONE", style = "underline" } }
vim.g.gruvbox_baby_highlights = { Normal = { fg = "#c76d5d", bg = "NONE", style = "underline" } }

-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 1

-- Enable transparent mode
vim.g.gruvbox_baby_transparent_mode = 1

-- GRUVBOX (NOT GRUVBOX BABY)
vim.o.background = "dark"
-- Default options:
require("gruvbox").setup({
	terminal_colors = true, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = true,
})
-- vim.g.gruvbox_transparent_bg = 1

-- Load the colorscheme
-- vim.cmd([[colorscheme gruvbox-baby]])

function ShadeItUp(colorChoice)
	local colors = { "catppuccin", "github_light_high_contrast", "gruvbox", "gruvbox-baby" }
	local color = colors[colorChoice or 1]

	print("Theme set to", color)

	-- setup must be called before loading
	vim.cmd.colorscheme(color)
end

function SetTheme()
	io.write("Which theme? Dark(d) or Light(l)?")
	local answer = io.read()
	answer = string.lower(answer or "d")
	if answer == "d" then
		ShadeItUp(1)
	elseif answer == "l" then
		ShadeItUp(2)
	end
end

SetTheme()
