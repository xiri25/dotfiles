return {
--[[ 
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local bg = "#011628"
    local bg_dark = "#011423"
    local bg_highlight = "#143652"
    local bg_search = "#0A64AC"
    local bg_visual = "#275378"
    local fg = "#CBE0F0"
    local fg_dark = "#B4D0E9"
    local fg_gutter = "#627E97"
    local border = "#547998"

    require("tokyonight").setup({
      style = "night",
      on_colors = function(colors)
        colors.bg = bg
        colors.bg_dark = bg_dark
        colors.bg_float = bg_dark
        colors.bg_highlight = bg_highlight
        colors.bg_popup = bg_dark
        colors.bg_search = bg_search
        colors.bg_sidebar = bg_dark
        colors.bg_statusline = bg_dark
        colors.bg_visual = bg_visual
        colors.border = border
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_float = fg
        colors.fg_gutter = fg_gutter
        colors.fg_sidebar = fg_dark
      end
    })

    vim.cmd("colorscheme tokyonight")
  end
]]
--[[  "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            -- Recommended - see "Configuring" below for more config options
            transparent = true,
            italic_comments = false,
            hide_fillchars = true,
            borderless_telescope = true,
            terminal_colors = true,
        })
        vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
]]


  { "ellisonleao/gruvbox.nvim",
    priority = 1000 ,
    config = function ()
            require("gruvbox").setup(
                {
                    terminal_colors = true, -- add neovim terminal colors
                    undercurl = true,
                    underline = true,
                    bold = true,
                    italic = {
                        strings = true,
                        emphasis = true,
                        comments = true,
                        operators = false,
                        folds = true,
                    },
                    strikethrough = true,
                    invert_selection = false,
                    invert_signs = false,
                    invert_tabline = false,
                    invert_intend_guides = false,
                    inverse = true, -- invert background for search, diffs, statuslines and errors
                    contrast = "", -- can be "hard", "soft" or empty string
                    palette_overrides = {},
                    overrides = {},
                    dim_inactive = false,
                    transparent_mode = false,
                }
            )
    end,
    opts = ... },
    { "folke/tokyonight.nvim", priority = 1000,},
    { "rebelot/kanagawa.nvim" },
    { "catppuccin/nvim", name = "catppuccin", lazy = false },
    { "rose-pine/neovim", name = "rose-pine" },
    { "vague2k/vague.nvim", name = "vague" },
}
