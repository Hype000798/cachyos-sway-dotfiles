return {
  -- Individual plugin configurations
  {
    "NvChad/nvim-colorizer.lua",
    event = "LazyFile",
    opts = {
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features
        css_fn = true, -- Enable all CSS functions
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
    end,
  },

  {
    "rest-nvim/rest.nvim",
    ft = "http",
    opts = {
      -- Open response in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response json
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({ "tidy", "-i", "-q" }, body)
          end,
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = ".env",
      custom_dynamic_variables = {},
      yank_dry_run = true,
    },
    keys = {
      { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run Request" },
      { "<leader>rl", "<cmd>Rest run last<cr>", desc = "Run Last Request" },
      { "<leader>rp", "<cmd>Rest run<cr>", desc = "Preview Request" },
    },
  },

  {
    "mfussenegger/nvim-dap",
    enabled = vim.fn.executable("debugpy") == 1,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "mxsdev/nvim-dap-vscode-js",
    },
    config = function()
      require("lazyvim.util").on_load("nvim-dap", function()
        require("dap").setup()
      end)
    end,
  },

  {
    "vuki656/package-info.nvim",
    ft = "json",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      colors = {
        up_to_date = { -- Optional, defaults to "#71DD37"
          fg = "#71DD37",
        },
        outdated = { -- Optional, defaults to "#FC5D4F"
          fg = "#FC5D4F",
        },
      },
      icons = {
        up_to_date = "✓", -- Optional, defaults to "✓"
        outdated = "✗", -- Optional, defaults to "✗"
      },
      package_manager = "npm", -- Optional, set to "yarn" or "pnpm" if applicable
    },
    config = function(_, opts)
      require("package-info").setup(opts)
    end,
  },
}