return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      color_overrides = {
        mocha = {
          -- Explicitly define mocha as the primary theme
          rosewater = "#f5e0dc",
          flamingo = "#f2cdcd",
          pink = "#f5c2e7",
          mauve = "#cba6f7",
          red = "#f38ba8",
          maroon = "#eba0ac",
          peach = "#fab387",
          yellow = "#f9e2af",
          green = "#a6e3a1",
          teal = "#94e2d5",
          sky = "#89dceb",
          sapphire = "#74c7ec",
          blue = "#89b4fa",
          lavender = "#b4befe",
          text = "#cdd6f4",
          subtext1 = "#bac2de",
          subtext0 = "#a6adc8",
          overlay2 = "#9399b2",
          overlay1 = "#7f849c",
          overlay0 = "#6c7086",
          surface2 = "#585b70",
          surface1 = "#45475a",
          surface0 = "#313244",
          base = "#1e1e2e",
          mantle = "#181825",
          crust = "#11111b",
        },
      },
      transparent_background = true,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For other integrations, check the documentation
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}