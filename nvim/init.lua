vim.cmd('source ' .. vim.fn.stdpath('config') .. '/mappings.lua')
vim.loader.enable()
vim.o.guicursor = 'n-v-c:block'
vim.opt.synmaxcol = 240
vim.opt.lazyredraw = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300


-- indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- intitialize lazy.nvim
require("config.lazy")

--load plugin
require("autoclose").setup()

vim.wo.relativenumber = true
vim.opt.number = true

vim.opt.clipboard = "unnamed"

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


local lspconfig = require('lspconfig')
-- Rust
lspconfig.rust_analyzer.setup {}

-- Python
lspconfig.pyright.setup {}

-- HTML
lspconfig.html.setup {}


-- Lua
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false }
    }
  }
}

-- C++
lspconfig.clangd.setup {}

-- Create undo directory if it doesn't exist
vim.fn.mkdir(vim.fn.expand('~/.vim/undodir'), 'p')

-- Enable persistent undo
vim.o.undofile = true
vim.o.undodir = vim.fn.expand('~/.vim/undodir')
vim.o.undolevels = 10000
vim.o.undoreload = 10000
