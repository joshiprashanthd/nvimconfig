local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    vim.notify("Not found nvim-lsp-installer")
    return
end

lsp_installer.setup {}

local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("Not found lspconfig")
    return
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    vim.notify("Not found cmp_nvim_lsp")
    return
end


local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gf', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', 'gc',
        '<cmd>lua vim.diagnostic.open_float(0, {scope="line", border="rounded", source="always", focusable=false})<CR>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" }})<CR>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" }})<CR>', opts)
    vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist({open = true})<CR>", opts)
end

local lsp_flags = {
    debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local servers = { "pyright", "sumneko_lua", "jsonls" }

for _, lsp in ipairs(servers) do
    lsp_config[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
    }
end
