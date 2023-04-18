local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
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
			return require("packer.util").float({ border = "single" })
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
	use({ "wbthomason/packer.nvim" })
	-- Функции Lua для плагинов
	use({ "nvim-lua/plenary.nvim" })
	-- Иконки для плагинов
	use({ "nvim-tree/nvim-web-devicons" })
	-- Парные скобки
	use({ "windwp/nvim-autopairs" })
	-- Парные тэги
	use({ "windwp/nvim-ts-autotag" })
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	-- Разноцветные скобки
	use({ "mrjones2014/nvim-ts-rainbow" })
	-- Nvim-tree
	use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })
	-----------------------------------------------------------------
	-- Темы для Nvim
	-----------------------------------------------------------------
	use({ "olimorris/onedarkpro.nvim" })
	use({ "catppuccin/nvim" })
	use({ "bluz71/vim-nightfly-guicolors" })
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "folke/tokyonight.nvim" })
	use({ "rebelot/kanagawa.nvim" })
	use({ "EdenEast/nightfox.nvim" })
	use({ "rose-pine/neovim" })
	use({ "uloco/bluloco.nvim" })
	use({ "AlexvZyl/nordic.nvim" })
	use({ "savq/melange-nvim" })
	-----------------------------------------------------------------
	-- LSP и автодополнение
	-----------------------------------------------------------------
	-- Установщик LSP серввров
	use({ "williamboman/mason.nvim", run = ":MasonUpdate" })
	use({ "williamboman/mason-lspconfig.nvim" })
	-- Конфигурация LSP
	use({ "neovim/nvim-lspconfig" })
	-- Автодополнение
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "ray-x/cmp-treesitter" })
	-- Сниппеты
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "rafamadriz/friendly-snippets" })
	-- Форматирование
	use({ "jose-elias-alvarez/null-ls.nvim" })
	-----------------------------------------------------------------
	-- Внешний вид
	-----------------------------------------------------------------
	-- Табы
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	-- Строка состояния
	use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } })
	-----------------------------------------------------------------
	-- Мелочи
	-----------------------------------------------------------------
	-- Навигация по окнам
	use({ "christoomey/vim-tmux-navigator" })
	-- Комментарии по горячим клавишам
	use({ "numToStr/Comment.nvim" })
	-- Горячиe клавиши
	use({ "folke/which-key.nvim" })
	-- Замена парных символов
	use({ "kylechui/nvim-surround" })
	-- Иконки для автодополнения
	use({ "onsails/lspkind.nvim" })
	-- Telescope
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- Code action меню
	use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })
	-- Gitsigns
	use({ "lewis6991/gitsigns.nvim" })
	if packer_bootstrap then
		require("packer").sync()
	end
end)
