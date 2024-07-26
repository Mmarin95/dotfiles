return {
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		name = "leap",
		config = function()
			require("leap").setup({})
			-- vim.keymap.set({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
			-- vim.keymap.set({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
			-- vim.keymap.set({ "n", "x", "o" }, "gf", "<Plug>(leap-from-window)")

			vim.keymap.set("n", "f", "<Plug>(leap)")
			vim.keymap.set("n", "F", "<Plug>(leap-from-window)")

			-- Example operator like df<pattern>, vf<pattern>, etc.
			-- Example for visual (x) mode, f<pattern>, F<pattern>, etc.
			vim.keymap.set({ "x", "o" }, "f", "<Plug>(leap-forward)")
			vim.keymap.set({ "x", "o" }, "F", "<Plug>(leap-backward)")
		end,
	},
}
