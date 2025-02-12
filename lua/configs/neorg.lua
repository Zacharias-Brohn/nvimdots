require("neorg").setup({
    load = {
        ["core.defaults"] = {}, -- Load all the default modules
        ["core.concealer"] = {}, -- Allows for use of icons
        ["core.highlights"] = {},
        ["core.autocommands"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.neorgcmd"] = {},
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    my_workspace = "~/neorg"
                }
            }
        },
        ["core.export"] = {}, -- Export functionality
        ["core.latex.renderer"] = {
            config = {
                render_on_enter = true,
            }
        }
    }
})
