local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fl", function()
	builtin.live_grep({
		additional_args = function()
			return {
				"--glob=!**/node_modules/**", -- Add = to combine flag + pattern
				"--glob=!**/vendor/**",
				"--glob=!**/third-party/**",
				"--glob=!**/submodules/**",
			}
		end,
	})
end, {})
