-- TODO: Add options like columns and so on
return {
	{
		"stevearc/oil.nvim",
		opts = {
			columns = { "icon", "permissions", "size", "mtime" },
		},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
}
