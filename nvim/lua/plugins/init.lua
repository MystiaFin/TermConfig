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
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue", "tsx", "jsx", "rescript",
      "xml",
      "php",
      "markdown",
      "astro", "glimmer", "handlebars", "hbs"
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    require('telescope').setup {
  defaults = {
    file_ignore_patterns = { -- add any file patterns you want to ignore
      "node_modules",
      ".git",
      "target",
      "dist",
    },
    path_display = {
      "smart", -- or "smart"
    },
  },
}
  },
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
}
