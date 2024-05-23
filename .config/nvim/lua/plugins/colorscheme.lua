return {
    -- {
    --     "Mofiqul/dracula.nvim",
    --     config = true,
    -- },
    -- {
    --     "bluz71/vim-nightfly-colors",
    --     name = "nightfly",
    --     lazy = false,
    --     priority = 1000,
    -- },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                transparent = true,
            })
        end
    },
}
