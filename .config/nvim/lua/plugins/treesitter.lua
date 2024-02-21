return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "bash", "c", "cpp", "dart", "lua", "vim", "python" },
            highlight = { enable = true },
            indnet = { enable = true },
        })
    end
}
