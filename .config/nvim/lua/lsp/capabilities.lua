M = {}

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	M.capabilities = cmp_nvim_lsp.default_capabilities()
else
	print("[capabilities] cmp_nvim_lsp could not be loaded:", cmp_nvim_lsp)
end

return M
