-- Install packer if does not exist
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local present
local packer

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }

  vim.cmd "packadd packer.nvim"

  present, packer = pcall(require, "packer")

  if present then
    print "Packer cloned successfully."
  else
    error(string.format(
      "Couldn't clone packer!\nPacker path: %s\n%s",
      install_path,
      packer
    ))

    return
  end
end

-- Regenerate compiled loader file on file save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


-- load plugins
packer = packer or require("packer")

return packer.startup(function(use)
    -- yo dawg, I heard you like plugin managers
    use "wbthomason/packer.nvim"

  -- fern.vim
  use {
    'lambdalisue/fern.vim',
    config = function() require("configs.fern") end,
  }
  -- colorscheme
  use {
    "rebelot/kanagawa.nvim",
    after = "packer.nvim",
    config = function() require("configs.colors") end,
  }
  -- Preview colors of hexcodes
  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function () require("colorizer").setup() end,
  }

  -- Support for plugins
  use {
    "tpope/vim-repeat",
    event = "BufRead",
  }

  -- Better syntax highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function () require("configs.treesitter") end,
  }

  -- comments
  use {
    "tpope/vim-commentary",
    after = "vim-repeat",
  }

  -- surround motions
  use {
    "tpope/vim-surround",
    after = "vim-repeat",
  }

  -- advanced substitution
  use {
    "tpope/vim-abolish",
    event = "BufRead",
  }

  -- better % support
  use {
    "andymass/vim-matchup",
    setup = function() require("helpers").packer_lazy_load("vim-matchup") end,
    config = function() require("configs.matchup") end,
  }

  -- coc
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  -- file finder
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    requires = {
      {
        "nvim-lua/plenary.nvim",
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
      },
      {
        "nvim-telescope/telescope-media-files.nvim",
        setup = function () require("mappings.telescope_media") end,
      },
    },
    config = function () require("configs.telescope") end,
    setup = function () require("mappings.telescope") end,
  }

  -- tmux integration
  use {
    "aserowy/tmux.nvim",
    config = function() require("configs.tmux") end,
  }

  -- snippet provider
  use {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  }

  -- status bar
  use {
    "nvim-lualine/lualine.nvim",
    after = "packer.nvim",
    config = function() require("configs.statusline") end,
  }
  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- fern icons enable
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'lambdalisue/glyph-palette.vim'
end)
