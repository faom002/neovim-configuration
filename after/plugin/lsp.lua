local lsp_zero = require('lsp-zero')


lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

local lspconfig = require('lspconfig')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls", "pyright", "rust_analyzer", "clangd"
    },
    handlers = {
        lsp_zero.default_setup,
    },
})


lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

local cmp = require('cmp')



vim.api.nvim_set_hl(0, "MyNormal", { bg = "Black", fg = "White" })
vim.api.nvim_set_hl(0, "MyFloatBorder", { bg = "#000000", fg = "#988829" })
vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#988829", fg = "#000000" })


cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-B>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
    }),

    window = {


        completion = cmp.config.window.bordered({

            border = "double",
            winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder,CursorLine:MyCursorLine,Search:None",

        }),

    },

})


lspconfig.lua_ls.setup({
    filetypes = { "lua" }
})
lspconfig.pyright.setup({
    filetypes = { "python" }
})
lspconfig.rust_analyzer.setup({
    filetypes = { "rust" }
})
lspconfig.tsserver.setup({
    filetypes = { "javascript", "typescript" }
})
lspconfig.clangd.setup({
    filetypes = { "c", "cpp" }
})
lspconfig.emmet_language_server.setup({
    filetypes = { "html", "css", "jsx", "tsx", "javascript", "typescript", "javascriptreact", "typescriptreact" }
})
lspconfig.cssls.setup({
    filetypes = { "html", "css", "jsx", "tsx", "javascript", "typescript", "javascriptreact", "typescriptreact" }
})
lspconfig.tailwindcss.setup({
    filetypes = { "html", "css", "jsx", "tsx", "javascript", "typescript", "javascriptreact", "typescriptreact" }
})
require 'lspconfig'.intelephense.setup {}
