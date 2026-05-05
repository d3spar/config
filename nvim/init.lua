vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ options ]]
-- :help option-list
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.wrap = false
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

--autocomplete
vim.o.autocomplete = true
vim.o.infercase = true
vim.o.completeopt = 'menuone,preinsert'
vim.o.pumborder = 'single'
vim.o.pumheight = 10
vim.o.pumwidth = 100

-- Folds (default behavior; see `:h Folding`)
vim.o.foldlevel = 1 -- Fold everything except top level
vim.o.foldmethod = 'indent' -- Fold based on indent level
vim.o.foldnestmax = 10 -- Limit number of fold levels

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set('i', '<C-[>', '<Esc>')
vim.keymap.set('n', '<leader>e', ':e $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>so', ':source $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>z', 'z=1<CR><CR>') --when spell is set pick first option(use [s and ]s to move next/prev spell err)
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')
vim.keymap.set('n', '\\', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>s.', ':FzfLua oldfiles<CR>')
vim.keymap.set('n', '<leader>sb', ':FzfLua buffers<CR>')
vim.keymap.set('n', '<leader>sc', ':FzfLua command_history<CR>')
vim.keymap.set('n', '<leader>sf', ':FzfLua files<CR>')
vim.keymap.set('n', '<leader>sg', ':FzfLua grep<CR>')
vim.keymap.set('n', '<leader>sh', ':FzfLua helptags<CR>')
vim.keymap.set('n', '<leader>sk', ':FzfLua keymaps<CR>')
vim.keymap.set('n', '<leader>sl', ':FzfLua live_grep<CR>')
vim.keymap.set('n', '<leader>sm', ':FzfLua marks<CR>')
vim.keymap.set('n', '<leader>sr', ':FzfLua registers<CR>')
vim.keymap.set('n', '<leader>su', ':FzfLua undotree<CR>')
--"by(y) yank to b reg/"pb paste reg b
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- vim.keymap.set('n', 'x', '"_x')

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
}
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[neovim builtin plugins]]
vim.cmd 'packadd nohlsearch'
vim.cmd 'packadd nvim.undotree'
vim.keymap.set('n', '<leader>u', '<cmd>Undotree<CR>', { desc = 'Undotree toggle' })
--experimental ui2
--TODO mess with this more
require('vim._core.ui2').enable { enable = true }

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

--/home/esh/.local/share/nvim/site -> pack/core/opt
vim.pack.add {
  'https://github.com/scottmckendry/cyberdream.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-treesitter/nvim-treesitter',
}

vim.cmd.colorscheme 'cyberdream'
require('nvim-web-devicons').setup()
require('fzf-lua').setup()
require('oil').setup()
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
require('mini.ai').setup { n_lines = 500 }
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require('mini.surround').setup()
local hipatterns = require 'mini.hipatterns'
hipatterns.setup {
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
}
local statusline = require 'mini.statusline'
statusline.setup { use_icons = vim.g.have_nerd_font }
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return '%2l:%-2v %P'
end

require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}
require('mason').setup()

--treesitter
local ensure_languages = {
  'bash',
  'c',
  'cpp',
  'cuda',
  'diff',
  'go',
  'html',
  'javascript',
  'json',
  'python',
  'rust',
  'typescript',
}
local isnt_installed = function(lang)
  return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
end
local to_install = vim.tbl_filter(isnt_installed, ensure_languages)
if #to_install > 0 then
  require('nvim-treesitter').install(to_install)
end

-- Ensure enabled
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    -- Enable treesitter highlighting and disable regex syntax
    pcall(vim.treesitter.start)
    -- Enable treesitter-based indentation
    -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

--autoformat
require('conform').setup {
  -- Map of filetype to formatters (:help conform.format)
  formatters_by_ft = {
    go = { 'gofmt' },
    javascript = { 'prettier' },
    json = { 'prettier' },
    lua = { 'stylua' },
    python = { 'black' },
  },
  default_format_opts = {
    lsp_format = 'fallback',
  },
  format_on_save = {
    lsp_format = 'fallback',
    timeout_ms = 500,
  },
}

--lsp
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = 'vim',
      },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
})
vim.lsp.enable {
  'clangd',
  'gopls',
  'lua_ls',
  'pyright',
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method 'textDocument/implementation' then
      -- Create a keymap for vim.lsp.buf.implementation ...
    end

    vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
  end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
