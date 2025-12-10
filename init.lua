if vim.g.neovide then
 vim.o.guifont = "DejaVu Sans Mono:16"
end
vim.cmd.colorscheme("lunaperche")
-- Carga de módulos personalizados (asegúrate de que existan en lua/)
require('basicSetup')
require('buscar')
require('toggle')
require('fzfConf')
require('neotree')
require('autocompletado')

-- Configuración de plugins con packer
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'     -- Packer se gestiona a sí mismo
  
use({
  "L3MON4D3/LuaSnip", -- motor de snippets moderno
  requires = { "rafamadriz/friendly-snippets" }, -- colección gigante de snippets
  config = function()
    -- Carga los snippets estilo VSCode (como los de HTML)
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
})
 -- Autocompletado
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'

  -- Indentación visual
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = false },
        exclude = {
          filetypes = { "help", "terminal", "dashboard", "lazy" },
        },
      })
    end
  }

  -- FZF con Lua
  use {
    "ibhagwan/fzf-lua",
    requires = { "nvim-tree/nvim-web-devicons" }
  }
  -- Explorador de archivos
 
use {
  "stevearc/oil.nvim",
  requires = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup()
  end
}
end)
