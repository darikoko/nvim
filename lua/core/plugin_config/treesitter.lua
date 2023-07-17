require('nvim-treesitter.configs').setup {
  ensure_installed = {"c", "lua", "rust", "vim", "python"},
  syn_install = false,
  auto_install = true,
  hightlight = {
    enable = true,
  },
}
