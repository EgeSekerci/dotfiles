require'nvim-treesitter.configs'.setup {
  ensure_installed = {"html", "javascript", "typescript", "go", "c", "lua", "vim", "vimdoc", "query" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
    indent = {
        enable = true
    },
}
