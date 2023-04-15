local nightfly = "colorscheme nightfly"

local one_theme = {
  onedark  = "colorscheme onedark",
  onelight = "colorscheme onelight",
}

local catppuccin = {
  latte     = "colorscheme catppuccin-latte",
  frappe    = "colorscheme catppuccin-frappe",
  macchiato = "colorscheme catppuccin-macchiato",
  mocha     = "colorscheme catppuccin-mocha",
}

local tokyonight = {
  night = "colorscheme tokyonight-night",
  storm = "colorscheme tokyonight-storm",
  day   = "colorscheme tokyonight-day",
  moon  = "colorscheme tokyonight-moon",
}

local rose_pine = {
  default = "colorscheme rose-pine",
  moon    = "colorscheme rose-pine-moon",
  dawn    = "colorscheme rose-pine-dawn",
}

local nightfox = {
  night  = "colorscheme nightfox",
  day    = "colorscheme dayfox",
  dawn   = "colorscheme dawnfox",
  dusk   = "colorscheme duskfox",
  nord   = "colorscheme nordfox",
  tera   = "colorscheme terafox",
  carbon = "colorscheme carbonfox",
}

local kanagawa = {
  wave   = "colorscheme kanagawa-wave",
  dragon = "colorscheme kanagawa-dragon",
  lotus  = "colorscheme kanagawa-lotus",
}

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

local status, theme = pcall(vim.cmd, kanagawa["wave"]) 
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

