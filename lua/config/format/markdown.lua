local opts = {}

opts = {
  file_types = { "markdown" },
  completions = {
    lsp = {
      enabled = true,
    },
  },
  render_modes = true,

  anti_conceal = {
    enabled = true,
    above = 1,
    below = 1,
  },

  code = {
    enabled = true,
    render_modes = false,
    sign = true,
    conceal_delimiters = true,
    language = true,
    position = "left",
    language_icon = true,
    language_name = true,
    language_info = true,
    language_pad = 0,
    width = "full",
    left_margin = 0,
    left_pad = 2,
    right_pad = 0,
    min_width = 40,
    border = "thick",
    language_border = "█",
    language_left = "",
    language_right = "",
    above = "▄",
    below = "▀",
    inline = true,
    inline_left = "",
    inline_right = "",
    inline_pad = 0,
    priority = 140,
    highlight = "RenderMarkdownCode",
    highlight_info = "RenderMarkdownCodeInfo",
    highlight_language = nil,
    highlight_border = "RenderMarkdownCodeBorder",
    highlight_fallback = "RenderMarkdownCodeFallback",
    highlight_inline = "RenderMarkdownCodeInline",
    style = "full",
  },
}

return opts
