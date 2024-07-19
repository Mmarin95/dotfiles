vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>') 
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>') 
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>') 
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Set highlight on search, but clear on pressing <Esc> in normal mode 
vim.opt.hlsearch = true 
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' }) 
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' }) 
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' }) 
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.opt.undofile = true
-- vim.opt.undodir = $HOME/.config/nvim/undo
-- set undolevels=10000
-- set undoreload=10000

vim.opt.mouse = 'a'
-- vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'

vim.opt.ignorecase = true 
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250 
-- Decrease mapped sequence wait time 
-- Displays which-key popup sooner 
vim.opt.timeoutlen = 300

vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.breakindent = true
vim.opt.inccommand = 'split'

vim.opt.scrolloff = 10
-- TODO: For tabstop, shiftwidth 'tpope/vim-sleuth'

