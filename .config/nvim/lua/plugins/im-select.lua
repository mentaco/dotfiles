local uname = vim.loop.os_uname()
local is_mac = uname.sysname == "Darwin"

if is_mac then
    return {
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({
                default_im_select = "com.apple.keylayout.ABC"
            })
        end,
    }
end
