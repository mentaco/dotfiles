return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup({
            options = {
                indicator = {
                    style = "underline",
                },
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = function()
                          return vim.fn.getcwd()
                        end,
                        highlight = "Directory",
                    }
                },

            },
        })
    end
}
