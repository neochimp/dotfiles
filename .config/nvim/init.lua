-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.termguicolors = true
vim.b.completion = false
vim.diagnostic.enable(false)
vim.g.autoformat = false

vim.opt.tabstop = 4 -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each indentation
vim.opt.expandtab = true -- Use spaces instead of tabs
