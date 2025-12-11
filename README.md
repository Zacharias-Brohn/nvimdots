<div align="center">
    <img src="/assets/neovim.png" width="600">
</div>

# Neovim Configuration

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

## Features

- **LSP**: Native LSP with Mason for language server management
- **Completion**: Blink.cmp with Copilot integration
- **Fuzzy Finding**: Telescope for files and grep
- **File Explorer**: Snacks.nvim explorer
- **Git**: Fugitive, Gitsigns, and GitHub integration
- **AI**: Copilot and CopilotChat
- **UI**: Bufferline, Lualine, Dropbar, and various colorschemes
- **Navigation**: Harpoon, Kitty navigator for splits
- **Editing**: Treesitter, autopairs, rainbow delimiters, visual-multi

## Key Mappings

| Key                 | Action                  |
| ------------------- | ----------------------- |
| `<leader>e`         | File explorer           |
| `<leader>f`         | Find files              |
| `<leader>g`         | Live grep               |
| `<Tab>` / `<S-Tab>` | Cycle buffers           |
| `<Alt-Arrow>`       | Navigate splits (Kitty) |
| `<Alt-c>`           | Toggle Copilot Chat     |
| `<C-q>`             | Toggle terminal         |
| `<leader>u`         | Undotree                |
| `<leader>ap`        | Code actions preview    |
| `<leader>sp`        | Colorscheme picker      |

## Requirements

- Neovim >= 0.10
- Git
- A [Nerd Font](https://www.nerdfonts.com/)
- ripgrep (for Telescope grep)

## Installation

```bash
git clone https://github.com/Zacharias-Brohn/nvimdots ~/.config/nvim
nvim
```

Plugins will be installed automatically on first launch.
