local opt = vim.opt -- set a local variable for options

-- line numbers

opt.relativenumber = false
opt.number = true

-- tabs and indent

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping

opt.wrap = false

-- serach settings 
opt.ignorecase = true
opt.smartcase = true

-- apareance

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

--clipboard

opt.clipboard:append("unnamedplus")

-- split windows

opt.splitright = true
opt.splitbelow = true

--opt.iskeyword:append("-")

opt.encoding = "utf-8"

opt.mouse = "a"
