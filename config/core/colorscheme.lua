local nightfly = "colorscheme nightfly"

local one_theme = function(color)
  if color == "dark" then
    return "colorscheme onedark"
  elseif color == "light" then
    return "colorscheme onelight"
  else
    print("Неверные параметры темы")
    return
  end
end

local catppuccin = function(color)
  if color == "latte" then
    return "colorscheme catppuccin-latte"
  elseif color == "frappe" then
    return "colorscheme catppuccin-frappe"
  elseif color == "macchiato" then
    return "colorscheme catppuccin-macchiato"
  elseif color == "mocha" then
    return "colorscheme catppuccin-mocha"
  else
    print("Неверные параметры темы")
    return
  end
end

local tokyonight = function(color)
  if color == "night" then
    return "colorscheme tokyonight-night"
  elseif color == "storm" then
    return "colorscheme tokyonight-storm"
  elseif color == "day" then
    return "colorscheme tokyonight-day"
  elseif color == "moon" then
    return "colorscheme tokyonight-moon"
  else
    print("Неверные параметры темы")
    return
  end
end

local rosepine = function(color)
  if color == "default" then
    return "colorscheme rose-pine"
  elseif color == "moon" then
    return "colorscheme rose-pine-moon"
  elseif color == "dawn" then
    return "colorscheme rose-pine-dawn"
  else
    print("Неверные параметры темы")
  return
  end
end

local nightfox = function(color)
  if color == "night" then
    return "colorscheme nightfox"
  elseif color == "day" then
    return "colorscheme dayfox"
  elseif color == "dawn" then
    return "colorscheme dawnfox"
  elseif color == "dusk" then
    return "colorscheme duskfox"
  elseif color == "nord" then
    return "colorscheme nordfox"
  elseif color == "tera" then
    return "colorscheme terafox"
  elseif color == "carbon" then
    return "colorscheme carbonfox"
  else
    print("Неверные параметры темы")
    return
  end
end

local kanagawa = function(color)
  if color == "wave" then
    return "colorscheme kanagawa-wave"
  elseif color == "dragon" then
    return "colorscheme kanagawa-dragon"
  elseif color == "lotus" then
    return "colorscheme kanagawa-lotus"
  else
    print("Неверные параметры темы")
    return
  end
end

local gruvbox = function(color)
  if color == "light" then
    vim.o.background = "light"
  elseif color == "dark" then
    vim.o.background = "dark"
  else
    print("Неверные параметры темы")
    return
  end
  return "colorscheme gruvbox"
end

local melange = function(color)
  if color == "light" then
    vim.o.background = "light"
  elseif color == "dark" then
    vim.o.background = "dark"
  else
    print("Неверные параметры темы")
    return
  end
  return "colorscheme melange"
end

local status, theme = pcall(vim.cmd, kanagawa("wave"))
if not status then
  print("Тема не найдена!")
  return
end
