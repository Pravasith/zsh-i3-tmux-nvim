require("telescope").setup({
	defaults = {
		path_display = { "truncate" }, -- Truncate long paths
	},
})

local builtin = require("telescope.builtin")

local flags = {
	additional_args = function()
		return {
			"--glob=!**/node_modules/**", -- Add = to combine flag + pattern
			"--glob=!**/vendor/**",
			"--glob=!**/third-party/**",
			"--glob=!**/submodules/**",
		}
	end,
}

vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({
		file_ignore_patterns = {
			"submodules/",
			"node_modules/",
			"%.git/", -- Escape dot with % for .git/
			"vendor/", --
		},
	})
end, {})
vim.keymap.set("n", "<leader>fl", function()
	builtin.live_grep(flags)
end, {})
