require("lazydev").setup({
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" }},
        "LazyVim",
    },
    enabled = function(root_dir)
      return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
    end,
})
