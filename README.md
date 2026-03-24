# nvim.dilmune

Dilmune's interpretation of Neovim. Clean, opinionated, and ready to go.

Built on [NvChad v2.5](https://github.com/NvChad/NvChad) with a custom dark theme and 50+ curated plugins.

> [nvim.dilmune.com](https://nvim.dilmune.com) — coming soon

## Features

- Custom **Dilmune** dark theme — warm orange accents on deep black
- LSP, Treesitter, Telescope, Copilot, Flash, Harpoon, and more
- Format on save — Prettier, Stylua, Black, rustfmt, gofumpt
- Languages — Lua, TypeScript, Python, Rust, Go, HTML/CSS, Docker, Bash
- Git — LazyGit, Gitsigns (inline blame), Diffview
- AI — GitHub Copilot + Avante
- Smart defaults — relative line numbers, system clipboard, auto-save on focus loss

## Install

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/Dilmune/nvim.dilmune.git ~/.config/nvim
nvim
```

Plugins auto-install on first launch. Run `:Mason` to verify LSP servers.

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

- Background: `#0d0d0d`
- Accent: `#d97756` (warm orange)
- Toggle light mode: `<leader>th` → `one_light`

## License

MIT - [Dilmune](https://dilmune.com)
