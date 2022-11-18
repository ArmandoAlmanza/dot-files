local status, _ = pcall(vim.cmd, "colorscheme Nordfox")

if not status then 
    print("Colorscheme not found")
    return
end
