local status_ok, configs = pcall(require, "nvim-tree")
if not status_ok then
    vim.notify("Not found nvim-tree")
    return
end

configs.setup {
    hijack_netrw = true,
    open_on_setup = true,
    hijack_cursor = true,
    open_on_tab = false,
    view = {
        signcolumn = "yes",
        width = 20,
        mappings = {
            list = {
                { key = "v", action = "vsplit" },
                { key = "t", action = "tabnew" },
                { key = "<leader>d", action = "cd" },
                { key = "h", action = "close_node" },
            },
        },
    },
    renderer = {
        icons = {
            webdev_colors = true,
            show = {
                folder = false,
                file = false,
            },
            glyphs = {
                git = {
                    unstaged = "M",
                    staged = "S",
                    renamed = "R",
                    untracked = "U",
                    deleted = "D",
                }
            }
        }
    },
    update_focused_file = {
        enable = true,
        ignore_list = {}
    }
}
