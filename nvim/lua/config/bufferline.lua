local M = {}

function M.setup()
    -- setup configuration
    require('bufferline').setup({
      options = {
        mode = "buffers",
        numbers = "none",
        themable = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin",
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
        always_show_bufferline = true,
        indicator = {
          style = 'icon',
        },
      },
    })
end

return M
