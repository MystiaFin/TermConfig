local M = {}

function M.setup()
    -- Setup configuration
    require('nvim-treesitter').setup({
      ensure_installed = {
        "lua", "python", "rust", "html", "css", "javascript", "typescript", "tsx", "c", "cpp", "java"
      },
      highlight = {
        enable = true,
      },
      autotag = {
        enable = true,
      }
    })
    vim.cmd('TSEnable highlight')
end

return M
