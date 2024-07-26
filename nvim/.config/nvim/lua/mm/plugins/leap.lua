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

			vim.keymap.set("n", "s", "<Plug>(leap)")
			vim.keymap.set("n", "S", "<Plug>(leap-from-window)")

			-- Example operator like df<pattern>, vf<pattern>, etc.
			-- Example for visual (x) mode, f<pattern>, F<pattern>, etc.
			vim.keymap.set({ "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "x", "o" }, "S", "<Plug>(leap-backward)")
		end,
	},
}
