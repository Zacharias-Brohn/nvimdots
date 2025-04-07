local fn = vim.fn

local get_active_lsp = function()
    local msg = "🚫"
    local buf_ft = vim.api.nvim_get_option_value("filetype", {})
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if next(clients) == nil then
        return msg
    end

    for _, client in ipairs(clients) do
        ---@diagnostic disable-next-line: undefined-field
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return msg
end

local function spell()
    if vim.o.spell then
        return string.format("[SPELL]")
    end

    return ""
end

--- show indicator for Chinese IME
local function ime_state()
    if vim.g.is_mac then
        local layout = fn.libcall(vim.g.XkbSwitchLib, "Xkb_Switch_getXkbLayout", "")
        local res = fn.match(layout, [[\v(Squirrel\.Rime|SCIM.ITABC)]])
        if res ~= -1 then
            return "[CN]"
        end
    end

    return ""
end

local diff = function()
    local git_status = vim.b.gitsigns_status_dict
    if git_status == nil then
        return
    end

    local modify_num = git_status.changed
    local remove_num = git_status.removed
    local add_num = git_status.added

    local info = { added = add_num, modified = modify_num, removed = remove_num }
    -- vim.print(info)
    return info
end

local virtual_env = function()
    -- only show virtual env for Python
    if vim.bo.filetype ~= "python" then
        return ""
    end

    local conda_env = os.getenv("CONDA_DEFAULT_ENV")
    local venv_path = os.getenv("VIRTUAL_ENV")

    if venv_path == nil then
        if conda_env == nil then
            return ""
        else
            return string.format("  %s (conda)", conda_env)
        end
    else
        local venv_name = vim.fn.fnamemodify(venv_path, ":t")
        return string.format("  %s (venv)", venv_name)
    end
end

return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        -- Merge or replace LazyVim's opts with your custom settings
        opts.options = {
            icons_enabled = true,
            theme = "auto",
            globalstatus = true,
            component_separators = "",
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            always_divide_middle = true,
        }
        opts.sections = {
            lualine_a = { { "mode" } },
            lualine_b = {
                {
                    "branch",
                    fmt = function(name, _)
                        return string.sub(name, 1, 20)
                    end,
                    color = { gui = "italic,bold" },
                    separator = { right = "" },
                },
                {
                    virtual_env,
                    color = { fg = "black", bg = "#F1CA81" },
                },
            },
            lualine_c = {
                {
                    "filename",
                    symbols = { readonly = "[🔒]" },
                },
                {
                    "diff",
                    source = diff,
                },
                {
                    "%S",
                    color = { gui = "bold", fg = "cyan" },
                },
                {
                    spell,
                    color = { fg = "black", bg = "#a7c080" },
                },
            },
            lualine_x = {
                {
                    ime_state,
                    color = { fg = "black", bg = "#f46868" },
                },
                {
                    get_active_lsp,
                    icon = " LSP:",
                },
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    symbols = { error = "🆇 ", warn = "⚠️ ", info = "ℹ️ ", hint = " " },
                },
            },
            lualine_y = {
                { "encoding", fmt = string.upper },
                {
                    "fileformat",
                    symbols = {
                        unix = "",
                        dos = "",
                        mac = "",
                    },
                },
                "filetype",
            },
            lualine_z = { "progress" },
        }
        opts.inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        }
        opts.tabline = {}
        opts.extensions = { "quickfix", "fugitive", "nvim-tree" }
    end,
}
