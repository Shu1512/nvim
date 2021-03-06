local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then return end

ts_config.setup {
  ensure_installed = {
    "vim",
    "lua",

    "html",
    "javascript",
    "typescript",
    "vue",
    "tsx",
    "svelte",
    "astro",
    "prisma",

    "dart",
    "php",
    "go",
    "gomod",
  },

  highlight = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = "gnn",
      node_incremental  = "grn",
      scope_incremental = "grc",
      node_decremental  = "grm",
    },
  },

  indent = {
    enable = true,
  },
}
