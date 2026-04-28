# yugen-ash.nvim

A minimal dark theme for Neovim.

## Installation

**lazy.nvim:**
```lua
{
    "qfioofa/yugen-ash.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("yugen_ash").setup({ variant = "muted" })
        vim.cmd("colorscheme yugen-ash")
    end,
}
```

**packer.nvim:**
```lua
use { "qfioofa/yugen-ash.nvim" }
```

## Usage

```lua
require("yugen_ash").setup({ variant = "muted" })
vim.cmd("colorscheme yugen-ash")
```

## Options

```lua
{
    variant = "main",      -- main, rich, muted, vibrant
    transparent = false,
    transparent_statusline = false,
    disable_italics = false,
    dim_nc_background = false,
    bold_vert_split = false,
}
```

## Preview

| Lua | Svelte |
|-----|--------|
| ![Lua](./images/lua.png) | ![Svelte](./images/svelte.png) |

| Bash | Elixir |
|------|--------|
| ![Bash](./images/bash.png) | ![Elixir](./images/elixir.png) |

## Credits

Based on:
- [yugen.nvim](https://github.com/bettervim/yugen.nvim)
- [ash.nvim](https://github.com/drewxs/ash.nvim)