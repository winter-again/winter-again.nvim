# winter-again.nvim

Personal colorscheme. Heavily inspired by the [mountain-theme](https://github.com/mountain-theme/Mountain/).

## Installation

```lua
{
    "winter-again/winter-again.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("winter-again").setup({
            -- default values:
            transparent = true,
            saturation = 0,
            lightness = 0,
            text_styles = {
                booleans = { italic = true },
                comments = { italic = true },
                floats = { italic = true },
                functions = { bold = true },
                numbers = { italic = true },
                keywords = { bold = true },
                types = { italic = true },
            },
            hl_overrides = function(highlights, colors) end,
        })
    end
}
```

## Override highlights

Use the `hl_overrides` option. It takes a function that has 2 parameters (table of highlights and table of colors). Can even add completely new highlight groups:

```lua
require("winter-again").setup({
    hl_overrides = function(highlights, colors)
        -- this will replace full highlight spec
        highlights["CursorLineNr"] = { fg = colors.blue, bold = false, }
        -- this will only override the given options
        highlights["BlinkCmpSource"] =
            vim.tbl_deep_extend("force", highlights["BlinkCmpSource"], { italic = true })
    end,
})
```
