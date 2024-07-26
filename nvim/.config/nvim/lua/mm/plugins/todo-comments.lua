-- Disabled in favor of fzf-lua grep
return {
	{
		"folke/todo-comments.nvim",
		enabled = false,
		event = "BufRead",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				search = {
					command = "rg",
					args = {
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--hidden",
					},
					pattern = [[\b(KEYWORDS):]],
				},
			})

			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })
		end,
	},
}
