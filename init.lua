vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.showtabline = 0

-- Keymaps
vim.keymap.set('n', "<A-k>", ":m .-2<CR>==", { silent = true })
vim.keymap.set('n', "<A-j>", ":m .+1<CR>==", { silent = true })

vim.keymap.set('v', "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set('v', "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })

-- Install lazy.nvim if not installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
local plugins = require('plugins')
require('lazy').setup(plugins)
