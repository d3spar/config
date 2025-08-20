vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ options ]]
-- :help option-list
vim.o.number = true
-- vim.o.relativenumber = true
vim.o.wrap = false
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 400
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
-- Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set('i', '<C-[>', '<Esc>')
vim.keymap.set('n', '<leader>e', ':e $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>z', 'z=1<CR><CR>') --when spell is set pick first option(use [s and ]s to move next/prev spell err)
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')
vim.keymap.set('n', '\\', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>sf', ':Pick files<CR>')
vim.keymap.set('n', '<leader>sh', ':Pick help<CR>')
vim.keymap.set('n', '<leader>sg', ':Pick grep<CR>')
vim.keymap.set('n', '<leader>sl', ':Pick grep_live<CR>')
vim.keymap.set('n', '<leader>sb', ':Pick buffers<CR>')
vim.keymap.set('n', '<leader>sk', ':Pick keymaps<CR>')
vim.keymap.set('n', '<leader>sm', ':Pick marks<CR>')
vim.keymap.set('n', '<leader>s.', ':Pick oldfiles<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.pack.add {
  '',
}
