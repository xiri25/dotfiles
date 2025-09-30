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

--" Most VimTeX mappings rely on localleader and this can be changed with the
--" following line. The default is usually fine and is the symbol "\".
vim.g.maplocalleader = ","

require("lazy").setup({ { import = "josean.plugins" }, { import = "josean.plugins.lsp" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

vim.diagnostic.config({ virtual_text = true })
vim.cmd("colorscheme vague")
