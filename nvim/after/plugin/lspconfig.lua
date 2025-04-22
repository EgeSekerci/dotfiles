local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
lspconfig.html.setup({
    filetypes = { 'html', 'html.ejs', 'gohtml' },
    settings = {
        html = {
            suggest = {
                html5 = true,
                angular1 = true,
                ionic = true
            }
        }
    },
})

lspconfig.ts_ls.setup({
    filetypes = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'html', 'gohtml' },
})

lspconfig.eslint.setup({
    filetypes = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'html', 'gohtml' },
})

lspconfig.gopls.setup {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", "git"),
    settings = {
        gopls = {
            completeUnimported = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
}

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    end,
})
