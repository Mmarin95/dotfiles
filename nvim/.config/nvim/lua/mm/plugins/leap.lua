return {
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		enabled = false,
		name = "leap",
		config = function()
			require("leap").setup({})
			-- vim.keymap.set({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
			-- vim.keymap.set({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
			-- vim.keymap.set({ "n", "x", "o" }, "gf", "<Plug>(leap-from-window)")

			vim.keymap.set("n", "<leader><leader>", "<Plug>(leap)")
			vim.keymap.set("n", "<leader>\\", "<Plug>(leap-from-window)")

			-- Example operator like dt<pattern>, vt<pattern>, etc.
			-- Example for visual (x) mode, t<pattern>, T<pattern>, etc.
			vim.keymap.set({ "x", "o" }, "t", "<Plug>(leap-forward)")
			vim.keymap.set({ "x", "o" }, "T", "<Plug>(leap-backward)")
		end,
	},
}
