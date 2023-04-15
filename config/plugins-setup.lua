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
  use { "wbthomason/packer.nvim" }
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
  if packer_bootstrap then
    require('packer').sync()
  end
end)
