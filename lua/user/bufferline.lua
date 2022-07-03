local status_ok, configs = pcall(require, "bufferline")
if not status_ok then
    vim.notify("Not found bufferline")
    return
end

configs.setup {
    options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
        show_buffer_icons = false,
        show_buffer_default_icon = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
            }
        },
        sort_by = "insert_after_current",
    }
}
