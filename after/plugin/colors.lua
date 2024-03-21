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
	transparent_background = true, -- disables setting the background color.
})

-- GRUVBOX BABY
-- Example config in Lua
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "italic"

-- Each highlight group must follow the structure:
-- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
-- See also :h highlight-guifg
-- Example:
vim.g.gruvbox_baby_highlights = { Normal = { fg = "#5da0c7", bg = "NONE", style = "underline" } }
-- vim.g.gruvbox_baby_highlights = { Normal = { fg = "#c76d5d", bg = "NONE", style = "underline" } }

-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 1

-- Enable transparent mode
vim.g.gruvbox_baby_transparent_mode = 1

-- Load the colorscheme
vim.cmd([[colorscheme gruvbox-baby]])

function ShadeItUp(colorChoice)
	local colors = { "catppuccin", "github_light_high_contrast", "gruvbox-baby" }
	local color = colors[colorChoice or 1]

	print("Theme set to", color)

	-- setup must be called before loading
	vim.cmd.colorscheme(color)
end

function SetTheme()
	local current_time = tonumber(os.date("%H")) -- Format: Hour:Minute:Second

	-- Time is less than 5 p.m.
	if current_time < 17 then
		ShadeItUp(2)
	else
		ShadeItUp(1)
	end
end

SetTheme()
