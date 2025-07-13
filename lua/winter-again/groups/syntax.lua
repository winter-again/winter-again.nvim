local colors = require("winter-again.colors").colors
local config = require("winter-again.config")

local M = {
    -- These groups are not listed as default vim groups,
    -- but they are suggested group names for syntax highlighting.
    Comment = vim.tbl_deep_extend("force", { fg = colors.fg_comment }, config.opts.text_styles.comments), -- any comment
    Constant = { fg = colors.moon, bold = true }, -- (preferred) any constant
    String = { fg = colors.green }, --   a string constant: "this is a string"
    Character = { fg = colors.yellow }, --  a character constant: 'c', '\n'
    Number = vim.tbl_deep_extend("force", { fg = colors.orange }, config.opts.text_styles.numbers), --   a number constant: 234, 0xff
    Boolean = vim.tbl_deep_extend("force", { fg = colors.yellow }, config.opts.text_styles.booleans), --  a boolean constant: TRUE, false
    Float = vim.tbl_deep_extend("force", { fg = colors.orange }, config.opts.text_styles.floats), -- a floating point constant: 2.3e10
    Identifier = { fg = colors.fg }, -- (preferred) any variable name
    Function = vim.tbl_deep_extend("force", { fg = colors.purple }, config.opts.text_styles.functions), -- function name (also: methods for classes) (TS: @function)
    Statement = { fg = colors.pink }, -- (preferred) any statement
    Conditional = { fg = colors.blue, bold = true }, --  if, then, else, endif, switch, etcolors.
    Repeat = { link = "Conditional" }, --   for, do, while, etcolors. (TS: @keyword.repeat)
    -- Label = {}, --    case, default, etcolors.
    Operator = { fg = colors.fg_dark }, -- "sizeof", "+", "*", etcolors. (also "==", "=", "->")
    -- NOTE: Keyword seems to take precedent over Statement
    Keyword = vim.tbl_deep_extend("force", { fg = colors.pink }, config.opts.text_styles.keywords), --  any other keyword like "local" in Lua and import in Python/Go
    Exception = { link = "Keyword" }, --  try, catch, throw
    PreProc = { fg = colors.purple }, -- (preferred) generic Preprocessor
    Include = { link = "PreProc" }, --  preprocessor #include
    Define = { link = "PreProc" }, --   preprocessor #define
    Macro = { link = "PreProc" }, --    same as Define
    PreCondit = { link = "PreProc" }, --  preprocessor #if, #else, #endif, etcolors.
    Type = vim.tbl_deep_extend("force", { fg = colors.blue }, config.opts.text_styles.types), -- (preferred) int, long, char, etcolors.
    -- StorageClass  = { }, -- static, register, volatile, etcolors.
    Structure = { link = "Type" }, --  struct, union, enum, etcolors.
    -- Typedef       = { }, --  A typedef
    Special = { fg = colors.blue }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    Tag = { fg = colors.blue }, --    you can use CTRL-] on this
    Delimiter = { fg = colors.fg_dark }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    -- Debug = { fg = colors.yellow }, --    debugging statements
    Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
    Bold = { bold = true },
    Italic = { italic = true },
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|
    Error = { fg = colors.red }, -- (preferred) any erroneous construct
    Todo = { fg = colors.purple }, -- (preferred) anything that needs extra attention; mostly the keywords ODO FIXME and XXX

    htmlH1 = { link = "markdownH1" },
    htmlH2 = { link = "markdownH2" },
    htmlH3 = { link = "markdownH3" },
    htmlH4 = { link = "markdownH4" },
    htmlH5 = { link = "markdownH5" },
    htmlItalic = { italic = true },
    htmlLink = { link = "markdownUrl" },

    markdownH1 = {
        fg = colors.purple,
        bg = config.opts.transparent and colors.none or colors.bg,
        bold = true,
        reverse = true,
    },
    markdownH1Delimiter = { fg = colors.purple, bg = config.opts.transparent and colors.none or colors.bg, bold = true }, -- the #s
    markdownH2 = {
        fg = colors.purple,
        bg = config.opts.transparent and colors.none or colors.bg,
        bold = true,
        reverse = true,
    },
    markdownH2Delimiter = { fg = colors.purple, bg = config.opts.transparent and colors.none or colors.bg, bold = true },
    markdownH3 = {
        fg = colors.purple,
        bg = config.opts.transparent and colors.none or colors.bg,
        bold = true,
        reverse = true,
    },
    markdownH3Delimiter = { fg = colors.purple, bg = config.opts.transparent and colors.none or colors.bg, bold = true },
    markdownH4 = {
        fg = colors.purple,
        bg = config.opts.transparent and colors.none or colors.bg,
        bold = true,
        reverse = true,
    },
    markdownH4Delimiter = { fg = colors.purple, bg = config.opts.transparent and colors.none or colors.bg, bold = true },
    markdownH5 = {
        fg = colors.purple,
        bg = config.opts.transparent and colors.none or colors.bg,
        bold = true,
        reverse = true,
    },
    markdownH5Delimiter = { fg = colors.purple, bg = config.opts.transparent and colors.none or colors.bg, bold = true },
    markdownH6 = {
        fg = colors.purple,
        bg = config.opts.transparent and colors.none or colors.bg,
        bold = true,
        reverse = true,
    },
    markdownH6Delimiter = { fg = colors.purple, bg = config.opts.transparent and colors.none or colors.bg, bold = true },
}

return M
