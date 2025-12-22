local function setup_before_colorscheme(theme)
	if theme == "gruvbox-baby" then
		vim.g.gruvbox_baby_function_style = "NONE"
		vim.g.gruvbox_baby_keyword_style = "italic"
		vim.g.gruvbox_baby_highlights = {
			Normal = { fg = "#c76d5d", bg = "NONE", style = "underline" },
		}
		vim.g.gruvbox_baby_telescope_theme = 1
		vim.g.gruvbox_baby_transparent_mode = 1
	elseif theme == "gruvbox" then
		vim.o.background = "dark"
		require("gruvbox").setup({
			terminal_colors = true,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			inverse = true,
			contrast = "soft",
			transparent_mode = true,
		})
	elseif theme == "catppuccin" then
		require("catppuccin").setup({
			flavour = "macchiato",
			transparent_background = true,
			no_italic = true,
			integrations = {
				mason = true,
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
			},
		})
	elseif theme == "github_light_high_contrast" then
		vim.opt.background = "light"
		require("github-theme").setup({
			options = { transparent = true },
		})
	elseif theme == "newpaper" then
		-- print("HELLO")
		require("newpaper").setup({
			style = "light",
			terminal = "bg",
			contrast_float = false,
			contrast_telescope = false,
			disable_background = true,
			borders = false,
			italic_strings = false,
		})
	end
end

local function setup_after_colorscheme(theme)
	if theme == "gruv-vsassist" then
		require("gruv-vsassist").setup({
			transparent = true,
			italic_comments = false,
			disable_nvimtree_bg = false,
			color_overrides = {
				vscLineNumber = "#FFFFFF",
			},
		})
	end
end

function ShadeItUp(colorChoice)
	local themes = {
		"catppuccin",
		"gruvbox",
		"gruvbox-baby",
		"darkrose",
		"gruv-vsassist",
		"colorbuddy",
		"github_light_high_contrast",
		"newpaper",
	}

	local theme = themes[colorChoice or 8]

	setup_before_colorscheme(theme)
	vim.cmd.colorscheme(theme)
	setup_after_colorscheme(theme)

	print("Theme set to", theme)
end

ShadeItUp(8)

-- function SetTheme()
-- 	vim.api.nvim_create_user_command("Theme", function(opts)
-- 		ShadeItUp(tonumber(opts.args) or 8)
-- 	end, { nargs = "?" })
-- end

-- SetTheme()
