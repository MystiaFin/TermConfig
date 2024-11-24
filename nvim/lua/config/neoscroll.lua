local M = {}

function M.setup()
    -- Setup configuration
    require('neoscroll').setup({
        mappings = {
            '<C-u>', '<C-d>',
            '<C-b>', '<C-f>',
            '<C-y>', '<C-e>',
            'zt', 'zz', 'zb',
        },
        hide_cursor = false,
    })

    -- Setup keymaps
    local neoscroll = require('neoscroll')
    local keymap = {
        ["<C-k>"] = function() neoscroll.ctrl_u({ duration = 150 }) end,
        ["<C-j>"] = function() neoscroll.ctrl_d({ duration = 150 }) end,
    }
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
    end
end

return M
