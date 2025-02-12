-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "one_light",
    theme_toggle = {
        "one_light",
        "one_light",
    },
    -- transparency = true,

    changed_themes = {
        one_light = {
            base_16 = {
                base0B = "#3b743b"
            }
        }
    }

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui = {
    statusline = {
        theme = "default",
        separator_style = "round",
    },

    tabufline = {
        enabled = true,
        lazyload = false,
    }
}

return M
