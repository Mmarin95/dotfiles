-- [[
-- Integration with 'JoosepAlviste/nvim-ts-context-commentstring'
--
-- vim.cmd is there to try. gcc should comment with "
-- -> uncomment with gcc, comment echo line with gcc
-- and lua code should be commented with --
-- ]]

-- vim.cmd([[
-- echo 'Hello World!'
-- ]])

return {
	-- { "numToStr/Comment.nvim", opts = {} },
	{
		"numToStr/Comment.nvim",
		opts = {
			pre_hook = function()
				return vim.bo.commentstring
			end,
		},
	},
}
