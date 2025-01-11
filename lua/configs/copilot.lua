  require("copilot").setup({
    panel = {
      enabled = true,
      auto_refresh = true,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>"
      },
      layout = {
        position = "bottom", -- | top | left | right | horizontal | vertical
        ratio = 0.4
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = true,
      debounce = 75,
      keymap = {
        accept = "<M-l>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      python = false,
      html = false,
      css = false,
      sh = false,
      tex = false,
      typescript = false,
      java = false,
      swift = false,
      cpp = false,
      hypr = false,
      ["."] = false,
    },
    copilot_node_command = 'node', -- Node.js version must be > 18.x
    server_opts_overrides = {},
    vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
      callback = function()
        vim.cmd( "CopilotChatSave AutoSave" )
      end,
    }),
    vim.api.nvim_create_autocmd( "VimEnter", {
      callback = function()
        vim.cmd( "CopilotChatLoad AutoSave" )
      end,
    }),
  })
