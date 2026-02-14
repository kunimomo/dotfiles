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

require('lazy').setup({
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' }
  }
})

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
}

-- options の適用
for key, value in pairs(options) do
  vim.opt[key] = value
end

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
