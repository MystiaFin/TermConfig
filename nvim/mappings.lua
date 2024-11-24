
vim.g.mapleader = " " -- Set the leader key to space


-- Toggle NvimTree with <leader>e
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Re-indent and stay in visual mode
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Map Enter in normal mode to jump to the end of the line
vim.api.nvim_set_keymap("n", "<CR>", "$a", { noremap = true, silent = true })

-- Buffer map
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })
