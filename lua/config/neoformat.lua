local M = {}

M.plugin = {
  "sbdchd/neoformat",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- === formatter enablement (order = priority) ===
    vim.g.neoformat_enabled_lua = { "stylua" }
    vim.g.neoformat_enabled_python = { "black" }
    vim.g.neoformat_enabled_javascript = { "prettier" }
    vim.g.neoformat_enabled_typescript = { "prettier" }
    vim.g.neoformat_enabled_qml = { "qmlformat" }
    vim.g.neoformat_enabled_go = { "gofmt" }
    vim.g.neoformat_enabled_sh = { "shfmt" }
    vim.g.neoformat_enabled_bash = { "shfmt" }
    vim.g.neoformat_enabled_zsh = { "shfmt" }
    vim.g.neoformat_enabled_powershell = { "pwshfmt" } -- experimental

    -- === helper to prefer local prettier in cwd/node_modules/.bin ===
    local function prefer_local_prettier()
      local cwd = vim.fn.getcwd()
      local local_path = cwd .. "/node_modules/.bin/prettier"
      if vim.loop.fs_stat(local_path) then
        return local_path
      end
      local global = vim.fn.exepath("prettier")
      if global ~= "" then
        return global
      end
      return "prettier"
    end

    -- === neoformatters definitions ===
    vim.g.neoformatters_javascript = {
      prettier = {
        exe = prefer_local_prettier(),
        args = { "--stdin-filepath", "%:p" },
        stdin = 1,
      },
    }
    vim.g.neoformatters_typescript = vim.g.neoformatters_javascript
    vim.g.neoformatters_json = vim.g.neoformatters_javascript
    vim.g.neoformatters_markdown = vim.g.neoformatters_javascript

    vim.g.neoformatters_lua = {
      stylua = {
        exe = "stylua",
        args = { "-", "--stdin-filepath", "%:p" },
        stdin = 1,
      },
    }

    vim.g.neoformatters_python = {
      black = {
        exe = "black",
        args = { "-" },
        stdin = 1,
      },
    }

    vim.g.neoformatters_qml = {
      qmlformat = {
        exe = "qmlformat",
        args = { "-" },
        stdin = 1,
      },
    }

    vim.g.neoformatters_go = {
      gofmt = {
        exe = "gofmt",
        args = {},
        stdin = 1,
      },
    }

    vim.g.neoformatters_sh = {
      shfmt = {
        exe = "shfmt",
        args = { "-i", "2", "-ci" },
        stdin = 1,
      },
    }
    vim.g.neoformatters_bash = vim.g.neoformatters_sh
    vim.g.neoformatters_zsh = vim.g.neoformatters_sh

    vim.g.neoformatters_powershell = {
      pwshfmt = {
        exe = "pwsh",
        args = {
          "-NoProfile",
          "-Command",
          [[
            $in = [Console]::In.ReadToEnd();
            if (Get-Command Invoke-Formatter -ErrorAction SilentlyContinue) {
              Invoke-Formatter -ScriptDefinition $in | Out-String
            } else {
              $in
            }
          ]],
        },
        stdin = 1,
      },
    }

    -- === utility: check whether a path/exe exists ===
    local function is_executable(path)
      if not path or path == "" then
        return false
      end
      -- if it contains a slash or backslash, treat as path
      if path:match("[/\\]") then
        local stat = vim.loop.fs_stat(path)
        return stat and stat.type == "file"
      end
      -- otherwise check PATH
      return vim.fn.exepath(path) ~= ""
    end

    local function resolve_exe_field(exe_field)
      if type(exe_field) == "function" then
        local ok, res = pcall(exe_field)
        if ok then
          return res
        else
          return nil
        end
      end
      if type(exe_field) == "string" then
        return exe_field
      end
      return nil
    end

    -- === determine whether any configured formatter for ft is available ===
    local function has_formatter_for_ft(ft)
      if not ft or ft == "" then
        return false
      end

      -- 1) check explicit enabled list first
      local enabled_var = "neoformat_enabled_" .. ft
      local enabled = vim.g[enabled_var]
      local candidates = {}

      if enabled then
        if type(enabled) == "string" then
          candidates = { enabled }
        elseif type(enabled) == "table" then
          candidates = enabled
        end
      else
        -- 2) fallback to any entries defined in vim.g.neoformatters_<ft>
        local table_var = "neoformatters_" .. ft
        local tbl = vim.g[table_var]
        if type(tbl) == "table" then
          for name, _ in pairs(tbl) do
            table.insert(candidates, name)
          end
        end
      end

      if #candidates == 0 then
        return false
      end

      -- table of custom formatter definitions
      local formatter_table = vim.g["neoformatters_" .. ft]

      for _, name in ipairs(candidates) do
        -- if we have a definition with exe, check that exe
        if formatter_table and formatter_table[name] and formatter_table[name].exe then
          local exe_field = formatter_table[name].exe
          local exe = resolve_exe_field(exe_field)
          if exe and is_executable(exe) then
            return true
          end
        else
          -- otherwise, try to find a system executable by the formatter name
          if is_executable(name) then
            return true
          end
        end
      end

      return false
    end

    -- === safe format wrapper that no-ops when no formatter found ===
    local function neoformat_if_available(bufnr)
      bufnr = bufnr or 0
      local ft = vim.bo[bufnr].filetype
      if not has_formatter_for_ft(ft) then
        -- silent fallback: do nothing if no formatter is available
        return
      end
      -- run Neoformat in protected call to avoid blocking save on errors
      pcall(vim.cmd, "Neoformat")
    end

    -- === keymap and command using the safe wrapper ===
    vim.keymap.set("n", "<leader>f", function()
      neoformat_if_available()
    end, { noremap = true, silent = true })

    vim.api.nvim_create_user_command("NeoformatIfAvailable", function()
      neoformat_if_available()
    end, {})

    -- === autoreformat on save (uses safe wrapper) ===
    local format_on_save_filetypes = {
      lua = true,
      python = true,
      javascript = true,
      typescript = true,
      qml = true,
      go = true,
      sh = true,
      bash = true,
      zsh = true,
      powershell = false, -- keep off by default (experimental)
    }

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("NeoformatOnSave", { clear = true }),
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        if format_on_save_filetypes[ft] then
          neoformat_if_available(args.buf)
        end
      end,
    })

    -- === end config ===
  end,
}

return M
