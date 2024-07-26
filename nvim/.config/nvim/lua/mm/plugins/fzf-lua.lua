return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({})
			local fzf = require("fzf-lua")
			vim.keymap.set("n", "<C-\\>", fzf.buffers, { noremap = true, silent = true, desc = "FZF Buffers" })
			vim.keymap.set("n", "<C-k>", fzf.builtin, { noremap = true, silent = true, desc = "FZF Builtin" })
			vim.keymap.set("n", "<C-p>", fzf.files, { noremap = true, silent = true, desc = "FZF Files" })
			vim.keymap.set("n", "<C-l>", fzf.live_grep_glob, { noremap = true, silent = true, desc = "FZF Live Grep" })
			vim.keymap.set("n", "<C-g>", fzf.grep_project, { noremap = true, silent = true, desc = "FZF Grep Project" })
			vim.keymap.set("n", "<F1>", fzf.help_tags, { noremap = true, silent = true, desc = "FZF Help Tags" })

			-- fzf.utils.info("|<C-\\> buffers|<C-p> files|<C-g> grep|<C-l> live grep|<C-k> builtin|<F1> help|")
		end,
	},
}
