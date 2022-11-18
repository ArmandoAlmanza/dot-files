-- auto install packer if not installed
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
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end


return packer.startup(function(use)

    -- packer can manage itself
    use("wbthomason/packer.nvim")
    
    use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

    use("EdenEast/nightfox.nvim") -- beauty colorscheme
    use ('folke/tokyonight.nvim') --tokyio nught
    use("szw/vim-maximizer") -- maximizes and restores current window
    -- Essential plugins
    use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
    use("numToStr/Comment.nvim") -- comment with cm
    use("nvim-tree/nvim-tree.lua") -- file explorer
    use("nvim-tree/nvim-web-devicons") -- vscode icons
    use("nvim-lualine/lualine.nvim") --StatusBar

  -- fuzzy finding w/ telescope
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

    -- autocompletion
    use("hrsh7th/nvim-cmp") -- completion plugin
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path") -- source for file system paths

    -- snippets

    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets


    if packer_bootstrap then
    require("packer").sync()
  end
end)
