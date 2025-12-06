# yugen-ash

A dark theme for nvim.

## Showcase

[]()

## Installation

[lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "qfioofa/yugen-ash.nvim",
    lazy = false,
    priority = 1000,
},
```

Fast integration

```lua
{
    "qfioofa/yugen-ash.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme yugen-ash")
    end
},
```


[packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use { "qfioofa/yugen-ash.nvim" }
```

## Usage

```lua
vim.cmd("colorscheme yugen-ash")
```


# Credits

This scheme based on 2 other schemes:
[yugen](https://github.com/bettervim/yugen.nvim)
[ash.nvim](https://github.com/drewxs/ash.nvim)
