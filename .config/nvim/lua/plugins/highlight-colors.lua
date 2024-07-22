return {
    "brenoprata10/nvim-highlight-colors",
    config = function ()
        local highlight_colors = require('nvim-highlight-colors')
        highlight_colors.setup({
            render = 'virtual',
            virtual_symbol = '',
            virtual_symbol_prefix = ' ',
            virtual_symbol_suffix = ' ',
            virtual_symbol_position = 'eow',
        })
    end
}

