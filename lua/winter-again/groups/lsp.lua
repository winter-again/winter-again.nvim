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
    -- ["@lsp.type.class.markdown"] = {},
    -- NOTE: tags in markdown
    ["@lsp.type.enumMember.markdown"] = { fg = colors.green, bold = true },

    -- LSP Semantic Token Groups (semantic highlighting)
    -- standard captures from docs (:h lsp-semantic-highlight)
    -- TODO: should not use @type because not specific enough?
    ["@lsp.type.class"] = { link = "@type" }, -- Identifiers that declare or reference a class type
    ["@lsp.type.comment"] = { link = "@comment" }, -- Tokens that represent a comment
    ["@lsp.type.decorator"] = { link = "@attribute" }, -- Identifiers that declare or reference decorators and annotations
    ["@lsp.type.enum"] = { link = "@type" }, -- Identifiers that declare or reference an enumeration type
    ["@lsp.type.enumMember"] = { link = "@variable.member" }, -- Identifiers that declare or reference an enumeration property, constant, or member
    ["@lsp.type.event"] = {}, -- Identifiers that declare an event property
    ["@lsp.type.function"] = { link = "@function" }, -- Identifiers that declare a function
    ["@lsp.type.interface"] = { link = "@type" }, -- Identifiers that declare or reference an interface type
    ["@lsp.type.keyword"] = { link = "@keyword" }, -- Tokens that represent a language keyword
    ["@lsp.type.macro"] = { link = "Macro" }, -- Identifiers that declare a macro
    ["@lsp.type.method"] = { link = "@function.method" }, -- Identifiers that declare a member function or method
    ["@lsp.type.modifier"] = {}, -- Tokens that represent a modifier
    ["@lsp.type.namespace"] = { link = "@module" }, -- Identifiers that declare or reference a namespace, module, or package
    ["@lsp.type.number"] = { link = "@number" }, -- Tokens that represent a number literal
    ["@lsp.type.operator"] = { link = "@operator" }, -- Tokens that represent an operator
    ["@lsp.type.parameter"] = { link = "@variable.parameter" }, -- Identifiers that declare or reference a function or method parameters
    ["@lsp.type.property"] = { link = "@property" }, -- Identifiers that declare or reference a member property, member field, or member variable
    ["@lsp.type.regexp"] = { link = "@string.regexp" }, -- Tokens that represent a regular expression literal
    ["@lsp.type.string"] = { link = "@string" }, -- Tokens that represent a string literal
    ["@lsp.type.struct"] = { link = "@type" }, -- Identifiers that declare or reference a struct type
    ["@lsp.type.type"] = { link = "@type" }, -- Identifiers that declare or reference a type that is not covered above
    ["@lsp.type.typeParameter"] = { link = "@type.definition" }, --  Identifiers that declare or reference a type parameter
    ["@lsp.type.variable"] = {}, -- Identifiers that declare or reference a local or global variable

    ["@lsp.mod.abstract"] = {}, --        Types and member functions that are abstract
    ["@lsp.mod.async"] = {}, --           Functions that are marked async
    ["@lsp.mod.declaration"] = {}, --     Declarations of symbols
    ["@lsp.mod.defaultLibrary"] = {}, --  Symbols that are part of the standard library
    ["@lsp.mod.definition"] = {}, --      Definitions of symbols, for example, in header files
    ["@lsp.mod.deprecated"] = {}, --      Symbols that should no longer be used
    ["@lsp.mod.documentation"] = {}, --   Occurrences of symbols in documentation
    ["@lsp.mod.modification"] = {}, --    Variable references where the variable is assigned to
    ["@lsp.mod.readonly"] = { link = "@constant" }, -- Readonly variables and member fields (constants)
    ["@lsp.mod.static"] = { link = "@constant" }, -- Class members (static members)

    ["@lsp.mod.global"] = { link = "@constant" },

    -- ["@lsp.type.boolean"] = { link = "@boolean" },
    -- ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    -- ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    -- ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    -- ["@lsp.type.lifetime"] = { link = "@keyword" },
    -- ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    -- ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
    -- ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    -- ["@lsp.type.unresolvedReference"] = { link = "Error" },
    -- ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    -- ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    -- ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    -- ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    -- ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    -- ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    -- ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    -- ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    -- ["@lsp.typemod.string.injected"] = { link = "@string" },
    -- ["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
    -- ["@lsp.typemod.typeAlias.defaultLibrary"] = { link = "@type.builtin" },
    -- ["@lsp.typemod.variable.callable"] = { link = "@function" },
    -- ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    -- ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    -- ["@lsp.typemod.variable.static"] = { link = "@constant" },
}

return M
