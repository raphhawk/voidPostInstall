vim.g["prettier#autoformat"] = 1
vim.g["prettier#autoformat_require_pragma"] = 0

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
