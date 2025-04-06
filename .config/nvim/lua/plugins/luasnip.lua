return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    config = function ()
        -- require("luasnip.loaders.from_lua").load()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local f = ls.function_node
        local i = ls.insert_node

        -- include guard snippet
        local function guard_macro_name(_, snip)
            local name = snip.snippet.env.TM_FILENAME
            return string.upper(name:gsub("[^%w]", "_"))
        end

        ls.add_snippets("cpp", {
            s("incg", {
                t("#ifndef "), f(guard_macro_name, {}),
                t({ "", "#define " }), f(guard_macro_name, {}),
                t({ "", "", ""}),
                i(0),
                t({ "", "", "#endif // " }), f(guard_macro_name, {}),
            }),
        })
    end
}
