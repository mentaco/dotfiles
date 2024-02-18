return {
    {
        "Mofiqul/dracula.nvim",
        config = true,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "bash", "c", "cpp", "dart", "lua", "vim", "python" },
                highlight = { enable = true },
                indnet = { enable = true },
            })
        end
    },
}
