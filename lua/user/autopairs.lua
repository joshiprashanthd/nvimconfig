local status_ok, configs = pcall(require, "nvim-autopairs")
if not status_ok then
    vim.notify("Not found nvim-autopairs")
    return
end

configs.setup {}
