local status, lualine = pcall(require, "lualine")

if not status then
    return
end
local horizon = require("lualine.themes.horizon")
local new_colors = {
    purple = "#BA94D1",
    blue = "#DAEAF1",
    red = "#F7A4A4",
    green = "#C4DFAA",
    black = "#000000",
    yellow = "#FFDA7B"
}

horizon.normal.a.bg = new_colors.purple 
horizon.insert.a.bg = new_colors.blue
horizon.visual.a.bg = new_colors.green
horizon.replace.a.bg = new_colors.red
horizon.command = {
    a = {
        gui = "bold",
        bg = new_colors.yellow,
        fg = new_colors.black
    },
}

lualine.setup({
    options = {
        theme = horizon
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename" },
        lualine_c = { "g:coc_status" },
        lualine_x = { "branch" },
        lualine_y = { "encoding" },
        lualine_z = { "location" }
    }
})
