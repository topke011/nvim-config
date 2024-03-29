require("options")
require("keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.env.JAVA_HOME = '/Users/topke/Library/Java/JavaVirtualMachines/corretto-17.0.10/Contents/Home'

require("lazy").setup("plugins")
require("config.telescope")
require("config.lsp")
require("config.treesitter")
