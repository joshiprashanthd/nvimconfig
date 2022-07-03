local status_ok, configs = pcall(require, "telescope.nvim")
if not status_ok then
    vim.notify("Not found telescope.nvim")
    return
end

configs.setup {}
