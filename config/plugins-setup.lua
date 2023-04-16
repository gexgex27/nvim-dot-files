local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local conf = {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
	},
}

local status, packer = pcall(require, "packer")
if not status then
  return
end

packer.init(conf)

return packer.startup(function(use)
  -----------------------------------------------------------------
  -- Минимальная конфигурация
  -----------------------------------------------------------------
  use { "wbthomason/packer.nvim" }
  -- Функции Lua для плагинов
  use { "nvim-lua/plenary.nvim" }
  -- Иконки для плагинов
  use { "nvim-tree/nvim-web-devicons" }
  -----------------------------------------------------------------
  -- Темы для Nvim
  -----------------------------------------------------------------
  use { "olimorris/onedarkpro.nvim" }
  use { "catppuccin/nvim" }
  use { "bluz71/vim-nightfly-guicolors" }
  use { "ellisonleao/gruvbox.nvim" }
  use { "folke/tokyonight.nvim" }
  use { "rebelot/kanagawa.nvim" }
  use { "EdenEast/nightfox.nvim" }
  use { "rose-pine/neovim" }
  use { "uloco/bluloco.nvim" }
  use { "AlexvZyl/nordic.nvim" }
  use { "savq/melange-nvim" }
  -----------------------------------------------------------------
  -- LSP и автодополнение
  -----------------------------------------------------------------
  -- Установщик LSP серввров
  use { "williamboman/mason.nvim", run = ":MasonUpdate" }
  use { "williamboman/mason-lspconfig.nvim" }
  -- Конфигурация LSP
  use { "neovim/nvim-lspconfig" }
  -- Автодополнение
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-buffer" }
  -- Сниппеты
  use { "L3MON4D3/LuaSnip" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "rafamadriz/friendly-snippets" }
  -----------------------------------------------------------------
  -- Внешний вид
  -----------------------------------------------------------------
  -- Табы
  use { "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" }
  -- Строка состояния
  use { "nvim-lualine/lualine.nvim" }
  -----------------------------------------------------------------
  -- Мелочи
  -----------------------------------------------------------------
  -- Навигация по окнам
  use { "christoomey/vim-tmux-navigator" }
  -- Комментарии по горячим клавишам
  use { "numToStr/Comment.nvim" }
  -- Горячик клавиши
  use { "folke/which-key.nvim" }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
