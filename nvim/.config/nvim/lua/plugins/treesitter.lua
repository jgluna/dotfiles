return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  opts = {
    modules = {},
    ensure_installed = {
      "lua", "vim", "vimdoc", "query",
      "python", "javascript", "typescript",
      "go", "json", "html", "css"
    },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  }
}
