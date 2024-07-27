return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local fzf = require("fzf-lua")
			require("fzf-lua").setup({})

			vim.keymap.set("n", "<C-\\>", fzf.buffers, { noremap = true, silent = true, desc = "FZF Buffers" })
			vim.keymap.set("n", "<leader>k", fzf.builtin, { noremap = true, silent = true, desc = "FZF Builtin" })
			vim.keymap.set("n", "<C-p>", fzf.files, { noremap = true, silent = true, desc = "FZF Files" })
			vim.keymap.set("n", "<leader>lg", fzf.live_grep_glob,
				{ noremap = true, silent = true, desc = "FZF Live Grep" })
			vim.keymap.set("n", "<leader>g", fzf.grep_project,
				{ noremap = true, silent = true, desc = "FZF Grep Project" })
			vim.keymap.set("n", "<F1>", fzf.help_tags, { noremap = true, silent = true, desc = "FZF Help Tags" })

			vim.keymap.set("n", "<leader>td", function()
				fzf.grep({ search = "TODO:|HACK:|PERF:|FIX:|FIXME:", no_esc = true })
			end, { noremap = true, silent = true, desc = "FZF Todo" })

			local function search_dotfiles()
				fzf.files({
					cwd = "~/.dotfiles",
					fd_opts = "--type f --hidden --exclude .git",
				})
			end

			vim.keymap.set("n", "<leader>df", search_dotfiles, { noremap = true, silent = true, desc = "FZF Dotfiles" })

			-- fzf.utils.info("|<C-\\> buffers|<C-p> files|<C-g> grep|<C-l> live grep|<C-k> builtin|<F1> help|")
		end,
	},
}
