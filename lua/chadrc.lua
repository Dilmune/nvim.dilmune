---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "dilmune",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    CursorLine = { bg = "#1a1a1a" },
    CursorLineNr = { fg = "#d97756", bold = true },
    LineNr = { fg = "#4a4a4a" },
    FloatBorder = { fg = "#d97756" },
    NvDashAscii = { fg = "#d97756" },
    NvDashButtons = { fg = "#8a8a8a" },
  },
  transparency = false,
  theme_toggle = { "dilmune", "one_light" },
}

M.ui = {
  cmp = {
    style = "default",
    icons_left = true,
  },
  statusline = {
    theme = "default",
    separator_style = "round",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
  },
  tabufline = {
    enabled = true,
    lazyload = false,
    order = { "treeOffset", "buffers", "tabs", "btns" },
  },
  telescope = {
    style = "bordered",
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "",
    " ██████╗ ██╗██╗     ███╗   ███╗██╗   ██╗███╗   ██╗███████╗",
    " ██╔══██╗██║██║     ████╗ ████║██║   ██║████╗  ██║██╔════╝",
    " ██║  ██║██║██║     ██╔████╔██║██║   ██║██╔██╗ ██║█████╗  ",
    " ██║  ██║██║██║     ██║╚██╔╝██║██║   ██║██║╚██╗██║██╔══╝  ",
    " ██████╔╝██║███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║███████╗",
    " ╚═════╝ ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝",
    "                  N E O V I M                              ",
    "",
  },
  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "  Bookmarks", keys = "ma", cmd = "Telescope marks" },
    { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. math.floor(stats.startuptime) .. " ms"
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

M.term = {
  float = {
    border = "rounded",
    row = 0.1,
    col = 0.1,
    width = 0.8,
    height = 0.8,
  },
}

M.lsp = { signature = true }
M.cheatsheet = { theme = "simple" }

return M
