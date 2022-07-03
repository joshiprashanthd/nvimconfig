local status_ok, configs = pcall(require, "which-key")
if not status_ok then
    vim.notify("Not found which-key")
    return
end

configs.setup {}
