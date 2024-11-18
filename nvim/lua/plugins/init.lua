return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- smooth scroll
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPost",
    config = function ()
      require('neoscroll').setup({
        mappings = {                 -- Keys to be mapped to their corresponding default scrolling animation
            '<C-u>', '<C-d>',
            '<C-b>', '<C-f>',
            '<C-y>', '<C-e>',
            'zt', 'zz', 'zb',
        },
        hide_cursor = false,
      })
      neoscroll = require('neoscroll')
      local keymap = {
        ["<C-k>"] = function() neoscroll.ctrl_u({ duration = 250 }) end;
        ["<C-j>"] = function() neoscroll.ctrl_d({ duration = 250 }) end;
      }
      local modes = { 'n', 'v', 'x'}
      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end
    end
  },
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require("presence").setup({
        neovim_image_text = "Elaina my beloved",
        main_image = "file",
      })
    end
  },
  {
    "nvim-lua/plenary.nvim",
    event = "VeryLazy",
  },
  {
    require("telescope").setup({
      defaults = {
        path_display = { "smart" },
        file_ignore_patterns = { "%.git/" }, -- Ignore `.git` folder
        cwd = vim.fn.getcwd(),
      },
    })
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      actions = {
        open_file = {
          quit_on_open = true
        }
      }
    },
  }
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
