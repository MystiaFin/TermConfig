return {
  -- theme
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('config.dashboard').setup()
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
{
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {
          -- You can override specific color values if needed
        },
        overrides = {
          -- Custom highlights can go here
        },
      })
      -- Set colorscheme after setup
      vim.cmd.colorscheme "gruvbox"
    end
  },
  -- auto close
  {
    "m4xshen/autoclose.nvim",
    event = {"InsertEnter"},
  },
  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    config = function()
      require("nvim-tree").setup(require("config.nvim-tree"))
    end
  },
  -- smooth scroll
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPost",
    config = function()
      require("config.neoscroll").setup()
    end
  },
  -- Discord presence
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
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
    require('config.lualine').setup()
end
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup()
    end
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    lazy = true,
    config = function()
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim", "neovim/nvim-lspconfig"
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" },
      })
    end,
  },
{
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
      require('config.treesitter').setup()
    end
},
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufRead",
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        },
        per_filetype = {
          ["html"] = {
            enable_close = true
          },
          ["jsx"] = {
            enable_close = true
          }
        }
      })
    end
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("config.bufferline").setup()
    end
  },
  {
    'neogitorg/neogit',
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true
  },
  {
    'lewis6991/gitsigns.nvim',
    event = "BufRead",
    config = function()
      require('gitsigns').setup()
    end
  },
}
