return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspLog", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local on_attach = require("lsp.on_attach").on_attach
        local capabilities = cmp_nvim_lsp.default_capabilities()

        vim.lsp.config("bashls", {
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("bashls")

        vim.lsp.config("clangd", {
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("clangd")

        vim.lsp.config("cmake", {
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("cmake")

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
        vim.lsp.enable("lua_ls")

        vim.lsp.config("pyright", {
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("pyright")

        if vim.uv.os_uname().sysname == "Darwin" then
            vim.lsp.config("omnisharp", {
                cmd = { "dotnet", vim.fn.expand("~/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll") },
            })
            vim.lsp.enable("omnisharp")
        end
    end,
}
