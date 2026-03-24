# Dilmune

A clean, opinionated Neovim configuration built on [NvChad v2.5](https://github.com/NvChad/NvChad).

Dark theme with warm orange accents. Batteries included.

## Features

- Custom **Dilmune** dark theme with carefully tuned syntax highlighting
- **50+ plugins** — LSP, Treesitter, Telescope, Copilot, Flash, Harpoon, and more
- **Format on save** via conform.nvim (Prettier, Stylua, Black, rustfmt, gofumpt)
- **Language support** — Lua, TypeScript, Python, Rust, Go, HTML/CSS, Docker, Bash
- **Git integration** — LazyGit, Gitsigns (inline blame), Diffview
- **AI assistance** — GitHub Copilot + Avante
- **Smart defaults** — relative line numbers, system clipboard, auto-save on focus loss

## Install

Back up your existing config, then clone:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/Dilmune/dilmune.git ~/.config/nvim
nvim
```

Lazy.nvim will auto-install all plugins on first launch. Run `:Mason` to verify LSP servers.

## Keybindings

| Key | Action |
|-----|--------|
| `Space` | Leader |
| `s` / `S` | Flash jump / Treesitter |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>gg` | LazyGit |
| `<leader>1-4` | Harpoon slots |
| `<leader>ha` | Harpoon add |
| `<leader>aa` | AI ask |
| `<leader>ae` | AI edit |
| `-` | Oil file browser |
| `<A-i>` | Floating terminal |
| `<leader>fm` | Format file |

Full list: `:NvCheatsheet`

## Theme

The Dilmune theme is a dark, minimal color scheme:

- Background: `#0d0d0d`
- Accent: `#d97756` (warm orange)
- Toggle light mode: `<leader>th` and select `one_light`

## License

MIT - [Dilmune](https://dilmune.com)
