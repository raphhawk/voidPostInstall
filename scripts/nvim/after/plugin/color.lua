vim.g.nord_disable_background = true
--vim.g.gruvbox_contrast_dark="hard"
--vim.g.everforest_background="soft"
vim.g.everforest_transparent_background = 1
local function setPoimandres()
require('poimandres').setup {
  bold_vert_split = true, -- use bold vertical separators
  dim_nc_background = true, -- dim 'non-current' window backgrounds
  disable_background = false, -- disable background
  disable_float_background = true, -- disable background for floats
  disable_italics = false, -- disable italics
}
end

local function setCatppuccin()
  local present, catppuccin = pcall(require, "catppuccin")
  if not present then return end

  vim.opt.termguicolors = true

  catppuccin.setup {
    flavour = "mocha",
    term_colors = true,
    transparent_background = false,
    no_italic = false,
    no_bold = false,
    styles = {
      comments = { "italic" },
      conditionals = {},
      loops = {},
      functions = { "italic" },
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = { "bold" },
    },
    color_overrides = {
      mocha = {
        base = "#171717", -- background
        surface2 = "#9A9A9A", -- comments
        text = "#F6F6F6",
      },
    },
    highlight_overrides = {
      mocha = function(C)
        return {
          NvimTreeNormal = { bg = C.none },
          CmpBorder = { fg = C.surface2 },
          Pmenu = { bg = C.none },
          NormalFloat = { bg = C.none },
          TelescopeBorder = { link = "FloatBorder" },
        }
      end,
    },
  }
end

local function setColor(color)
	color = color or "carbonfox"
  require'colorizer'.setup()
  --	vim.api.nvim_set_hl(0, "Normal", {ctermbg = "none"})
  --	vim.api.nvim_set_hl(0, "NonText", {guibg = "none"})
  --	vim.api.nvim_set_hl(0, "NormalFloat", {ctermbg = "none"})

  if color == "catppuccin" then
    setCatppuccin()
  end
  if color == "poimandres" then
    setPoimandres()
  end

	vim.cmd.colorscheme(color)
end

setColor("nord")

vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
