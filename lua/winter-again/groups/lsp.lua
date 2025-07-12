local colors = require("winter-again.colors").colors
local config = require("winter-again.config")

local M = {
    -- see: https://neovim.io/doc/user/diagnostic.html#_highlights
    DiagnosticError = { fg = colors.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = colors.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = colors.blue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = colors.fg_dark }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticOk = { fg = colors.green }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    -- virtual text next to a diagnostic
    DiagnosticVirtualTextError = { fg = colors.red, bg = config.opts.transparent and colors.none or colors.bg }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = config.opts.transparent and colors.none or colors.bg }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { fg = colors.blue, bg = config.opts.transparent and colors.none or colors.bg }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = {
        fg = colors.fg_dark,
        bg = config.opts.transparent and colors.none or colors.bg,
    }, -- Used for "Hint" diagnostic virtual text
    DiagnosticVirtualTextOk = { fg = colors.green, bg = config.opts.transparent and colors.none or colors.bg }, -- Used for "Ok" diagnostic virtual text

    -- underline for diagnostics
    DiagnosticUnderlineError = { sp = colors.red, underdotted = true }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { sp = colors.yellow, underdotted = true }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { sp = colors.blue, underdotted = true }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { sp = colors.fg_dark, underdotted = true }, -- Used to underline "Hint" diagnostics
    DiagnosticUnderlineOk = { sp = colors.green, underdotted = true }, -- Used to underline "Ok" diagnostics

    -- text inside of floating window when getting more diagnostic info
    DiagnosticFloatingError = { fg = colors.red }, -- Used to color "Error" diagnostic messages in diagnostics float
    DiagnosticFloatingWarn = { fg = colors.yellow }, -- Used to color "Warn" diagnostic messages in diagnostics float
    DiagnosticFloatingInfo = { fg = colors.blue }, -- Used to color "Info" diagnostic messages in diagnostics float
    DiagnosticFloatingHint = { fg = colors.fg_dark }, -- Used to color "Hint" diagnostic messages in diagnostics float
    DiagnosticFloatingOk = { fg = colors.green }, -- Used to color "Ok" diagnostic messages in diagnostics float

    -- sign column
    DiagnosticSignError = { fg = colors.red }, -- Used for "Error" signs in sign column
    DiagnosticSignWarn = { fg = colors.yellow }, -- Used for "Warn" signs in sign column
    DiagnosticSignInfo = { fg = colors.blue }, -- Used for "Info" signs in sign column
    DiagnosticSignHint = { fg = colors.fg_dark }, -- Used for "Hint" signs in sign column
    DiagnosticSignOk = { fg = colors.green }, -- Used for "Ok" signs in sign column

    DiagnosticDeprecated = { fg = colors.fg_comment }, -- Used for deprecated or obsolete code
    -- e.g., unused import
    DiagnosticUnnecessary = { fg = colors.fg_comment }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = colors.bg_visual }, -- used for highlighting "text" references (e.g., highlight symbol under cursor)
    LspReferenceRead = { link = "LspReferenceText" }, -- used for highlighting "read" references
    LspReferenceWrite = { link = "LspReferenceText" }, -- used for highlighting "write" references

    LspSignatureActiveParameter = { bg = colors.gray1, bold = true },
    LspCodeLens = { fg = colors.fg_dark },
    LspInlayHint = { fg = colors.fg_dark },
    LspInfoBorder = { fg = colors.fg, bg = colors.bg_float },

    -- HACK: override when marksman LSP active
    ["@lsp.type.class.markdown"] = {},
    -- HACK: to highlight markdown tags with marksman LSP enabled
    ["@lsp.type.enumMember.markdown"] = { fg = colors.green, bold = true },

    -- LSP Semantic Token Groups (semantic highlighting)
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },

    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.lifetime"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { link = "Error" },
    ["@lsp.type.variable"] = { link = "@variable" },

    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.typeAlias.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.variable.callable"] = { link = "@function" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    ["@lsp.typemod.variable.static"] = { link = "@constant" },
}

return M
