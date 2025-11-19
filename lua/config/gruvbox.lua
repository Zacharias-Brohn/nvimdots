require("gruvbox").setup({
    variant = "hard",
    dark_variant = "medium",
    dim_inactive_windows = false,
    extend_background_behind_borders = false,

    enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
    },

    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },

    groups = {
        border = "gray",
        link = "purple_lite",
        panel = "bg_second",

        error = "red_lite",
        hint = "aqua_lite",
        info = "blue_lite",
        ok = "green_lite",
        warn = "yellow_lite",
        note = "yellow_dark",
        todo = "aqua_dark",

        git_add = "green_dark",
        git_change = "yellow_dark",
        git_delete = "red_dark",
        git_dirty = "orange_dark",
        git_ignore = "gray",
        git_merge = "purple_dark",
        git_rename = "blue_dark",
        git_stage = "purple_dark",
        git_text = "yellow_lite",
        git_untracked = "bg2",

        h1 = "red_dark",
        h2 = "yellow_dark",
        h3 = "green_dark",
        h4 = "aqua_dark",
        h5 = "blue_dark",
        h6 = "purple_dark",
    },
})
