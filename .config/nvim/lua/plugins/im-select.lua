local uname = vim.loop.os_uname()
local is_mac = uname.sysname == "Darwin"

local im = ""

if is_mac then
    im = "com.apple.keylayout.ABC"
else
    im = "xkb:us::eng"
end

return {
    "keaising/im-select.nvim",
    config = function()
        require("im_select").setup({
            default_im_select = im,
            set_default_events = { "VimEnter", "InsertLeave", "CmdlineLeave" }
        })
    end,
}
