--[[ plugins ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--[[ options ]]
local options = {
  -- 行番号を表示
  number = true,
  -- コマンドラインモードのステータス表示
  showmode = true,
  -- インデントのスペース数
  shiftwidth = 2,
  -- 検索時に入力と同時に結果がマッチする
  incsearch = true,
  -- 検索時にハイライト
  hlsearch = true,
  -- カーソルのある行をハイライト
  cursorline = true,
  -- カーソルのある列をハイライト
  cursorcolumn = true,
  -- カラースキームを正しく表示
  termguicolors = true,
}

-- options の適用
for key, value in pairs(options) do
  vim.opt[key] = value
end

require('lazy').setup({
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  {
    'nvim-tree/nvim-tree.lua'
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'catppuccin/nvim'
  }
})

--[[ treesitter highlight ]]
vim.api.nvim_create_autocmd('FileType', {
  callback = function() pcall(vim.treesitter.start) end
})

--[[ nvim-tree ]]
require('nvim-tree').setup({
  view = {
    width = 30
  }
})
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    require('nvim-tree.api').tree.open()
  end
})

--[[ bufferline ]]
require('bufferline').setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        separator = true
      }
    }
  }
})

--[[ colorscheme ]]
vim.cmd('colorscheme catppuccin-mocha')

--[[ keymap ]]
-- silent: コマンド表示を抑制
local opts = { silent = true }
-- Leaderキーを Space に設定
vim.g.mapleader = ' '
-- 関数名を短縮
local keymap = vim.keymap.set

keymap('i', 'jj', '<ESC>', opts)
keymap('n', '<Leader>f', ':Files<CR>', opts)
keymap('n', '<Leader>g', ':GFiles<CR>', opts)
keymap('n', '<Leader>G', ':GFiles?<CR>', opts)
keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)
keymap('n', '<Leader>r', ':Rg<CR>', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
keymap('n', '<Leader>w', ':bd<CR>', opts)
keymap('n', '<Leader>q', ':qa<CR>', opts)
