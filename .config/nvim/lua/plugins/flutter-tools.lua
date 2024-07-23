return {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim',
    },
    config = function()
        local flutter_tools = require("flutter-tools")
        flutter_tools.setup({
            dev_log = {
                open_cmd = "botright 10new",
            },
        })
    end,
}
