local colors = require("winter-again.colors").colors
local opts = require("winter-again.config").opts

---@type table<string, string>
local kinds = {
    Array = "@punctuation.bracket",
    Boolean = "@boolean",
    Class = "@type",
    Color = "Special",
    Constant = "@constant",
    Constructor = "@constructor",
    Enum = "@lsp.type.enum",
    EnumMember = "@lsp.type.enumMember",
    Event = "Special",
    Field = "@property",
    File = "Normal",
    Folder = "Directory",
    Function = "@function",
    Interface = "@lsp.type.interface",
    Key = "@property",
    Keyword = "@lsp.type.keyword",
    Method = "@method",
    Module = "@module",
    Namespace = "@module",
    Null = "@constant.builtin",
    Number = "@number",
    Object = "@constant",
    Operator = "@operator",
    Package = "@module",
    Property = "@property",
    Reference = "@markup.link",
    Snippet = "Conceal",
    String = "@string",
    Struct = "@lsp.type.struct",
    Unit = "@lsp.type.struct",
    Text = "Normal",
    TypeParameter = "@lsp.type.typeParameter",
    Variable = "@variable",
    Value = "@string",
}

-- NOTE: hacky because this relies on linked highlights being set first

--- Set BlinkCmpKind<...> highlights
local function set_kind_highlights()
    for kind, link in pairs(kinds) do
        local hl = ("BlinkCmpKind%s"):format(kind)
        local hl_link = vim.api.nvim_get_hl(0, { name = link, link = false })
        vim.api.nvim_set_hl(0, hl, { fg = hl_link.fg, bg = colors.none }) -- only retain fg color
    end
end

--- Override specific text settings for the given highlight definition
---@param default vim.api.keyset.highlight The default highlight definition
---@param config TextStyle A subset of highlight definition overrides
---@return vim.api.keyset.highlight
local function override_textstyle(default, config)
    return vim.tbl_deep_extend("force", default, config)
end

-- see :h highlight
---@type table<string, table<string, vim.api.keyset.highlight>>
local highlights = {
    -- builtin editor highlight groups
    -- :h highlight-groups
    base = {
        ColorColumn = { bg = colors.bg_visual }, -- Columns set with 'colorcolumn'
        Conceal = { fg = colors.fg_comment }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        CurSearch = { fg = colors.bg, bg = colors.yellow, bold = true }, -- Highlighting a search pattern under the cursor (see 'hlsearch'); current search result
        Cursor = { fg = colors.fg, bg = colors.bg, reverse = true }, -- char under cursor
        lCursor = { link = "Cursor" }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        CursorIM = { link = "Cursor" }, -- Like Cursor, but used when in IME mode |CursorIM|
        CursorColumn = { link = "CursorLine" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine = { bg = colors.cursor_line }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory = { fg = colors.blue }, -- Directory names (and other special names in listings)
        DiffAdd = { fg = colors.green }, -- Diff mode: Added line |diff.txt|
        DiffChange = { fg = colors.blue }, -- Diff mode: Changed line |diff.txt|
        DiffDelete = { fg = colors.red }, -- Diff mode: Deleted line |diff.txt|
        DiffText = { fg = colors.none, bg = colors.bg_visual }, -- Diff mode: Changed text within a changed line |diff.txt|
        -- DiffTextAdd = {}, -- Diff mode: Added text within a changed line. Linked to hl-DiffText by default
        EndOfBuffer = { fg = colors.fg_comment }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        TermCursor = { link = "Cursor" }, -- Cursor in a focused terminal
        OkMsg = { fg = colors.green }, -- Success messages
        WarningMsg = { fg = colors.yellow }, -- Warning messages
        ErrorMsg = { fg = colors.red }, -- Error messages
        -- StderrMsg = {}, -- Messages in stderr from shell commands
        -- StdoutMsg = {}, -- Messages in stdout from shell commands
        WinSeparator = { fg = colors.gray2, bg = opts.transparent and colors.none or colors.bg }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        Folded = { fg = colors.blue, bg = colors.gray4 }, -- Line used for closed folds
        FoldColumn = { link = "LineNr" }, -- 'foldcolumn'
        SignColumn = { link = "LineNr" }, -- Column where |signs| are displayed
        IncSearch = { fg = colors.bg, bg = colors.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        Substitute = { fg = colors.bg, bg = colors.red }, -- |:substitute| replacement text highlighting
        LineNr = { fg = colors.gray1 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        -- LineNrAbove = {}, -- Line number for when the relativenumber option is set, above the cursor line
        -- LineNrBelow = {}, -- Line number for when the relativenumber option is set, below the cursor line
        CursorLineNr = { fg = colors.purple, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        -- CursorLineFold = {}, -- Like FoldColumn when 'cursorline' is set for the cursor line
        -- CursorLineSign = {}, -- Like SignColumn when 'cursorline' is set for the cursor line
        MatchParen = { bg = colors.cursor_line, italic = true }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg = { fg = colors.fg_dark }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea = {}, -- Area for messages and cmdline
        -- MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg = { fg = colors.purple }, -- |more-prompt|
        NonText = { fg = colors.fg_comment }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal = { fg = colors.fg, bg = opts.transparent and colors.none or colors.bg },
        NormalFloat = { fg = colors.fg, bg = colors.bg_float }, -- Normal text in floating windows.
        FloatBorder = { fg = colors.fg, bg = colors.bg_float }, -- Border of floating windows.
        -- FloatShadow = {}, -- Blended areas when border is "shadow"
        -- FloatShadowThrough  = {}, -- Shadow corners when border is "shadow"
        FloatTitle = { fg = colors.fg_dark, bg = colors.bg_float }, -- Title of floating windows.
        -- FloatFooter = {}, -- Footer of floating windows
        -- NormalNC = { bg = opts.transparent and colors.none or colors.bg },
        Pmenu = { fg = colors.fg, bg = colors.bg_float }, -- Popup menu: Normal item.
        PmenuSel = { bg = colors.bg_visual }, -- Popup menu: Selected item.
        -- PmenuKind = {}, -- Popup menu: Normal item "kind"
        -- PmenuKindSel = {}, -- Popup menu: Selected item "kind"
        -- PmenuExtra = {}, -- Popup menu: Normal item "extra text"
        -- PmenuExtraSel = {}, -- Popup menu: Selected item "extra text"
        -- PmenuSbar = {}, -- Popup menu: Scrollbar.
        -- PmenuThumb = {}, -- Popup menu: Thumb of the scrollbar. (current pos)
        -- PmenuMatch = {}, -- Popup menu: Matched text in normal item Combined with hl-Pmenu
        -- PmenuMatchSel = {}, -- Popup menu: Matched text in selected item Combined with hl-PmenuMatch and hl-PmenuSel
        -- PmenuBorder = {},
        -- PmenuShadow = {},
        -- PmenuShadowThrough = {},
        -- ComplMatchIns = {},
        -- PreInsert = {},
        -- ComplHint = {},
        -- ComplHintMore = {},
        Question = { fg = colors.purple }, -- |hit-enter| prompt and yes/no questions
        QuickFixLine = { fg = colors.purple, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search = { fg = colors.gray3, bg = colors.yellow, reverse = true }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out. Non-current search matches
        -- SnippetTabstop = {}, -- Tabstops in snippets
        -- SnippetTabstopActive = {}, -- Tabstops in snippets
        -- SpecialKey = {}, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad = { sp = colors.red, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap = { sp = colors.yellow, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal = { sp = colors.red, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare = { sp = colors.red, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine = { bg = colors.bg }, -- Status line of current window
        StatusLineNC = { link = "StatusLine" }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        StatusLineTerm = { link = "StatusLine" }, -- Status line of terminal window
        StatusLineTermNC = { link = "StatusLine" }, -- Status line of non-current terminal window
        -- TabLine = {}, -- Tab pages line, not active tab page label
        -- TabLineFill = {}, -- Tab pages line, where there are no labels
        -- TabLineSel = {}, -- Tab pages line, active tab page label
        -- Title = {}, -- Titles for output from ":set all", ":autocmd" etcolors.
        Visual = { bg = colors.cursor_line }, -- Visual mode selection
        -- VisualNOS = {}, -- Visua bold = true l mode selection when vim is "Not Owning the Selection".
        -- Whitespace = {}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        -- WildMenu = {}, -- Current match in 'wildmenu' completion
        WinBar = { fg = colors.fg_mid, bg = colors.none }, -- Window bar of current window
        WinBarNC = { fg = colors.fg_dark, bg = colors.none }, -- Window bar of not-current windows
        -- Menu = {}, -- Current font, background and foreground colors of the menus. Also used for the toolbar
        -- Scrollbar = {}, -- Current background and foreground of the main window's scrollbars.
        -- Tooltip = {}, -- Current font, background and foreground of the tooltips
    },
    blink = {
        BlinkCmpMenu = { bg = colors.bg_float }, -- The completion menu window
        BlinkCmpMenuBorder = { bg = colors.bg_float }, -- The completion menu window border
        BlinkCmpMenuSelection = { link = "PmenuSel" }, -- The completion menu window selected item
        BlinkCmpScrollBarThumb = { link = "PmenuThumb" }, -- The scrollbar thumb
        BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
        BlinkCmpLabel = { fg = colors.fg_dark, bg = colors.none }, -- Label of the completion item
        BlinkCmpLabelDeprecated = { fg = colors.fg_dark, strikethrough = true }, -- Deprecated label of the completion item
        BlinkCmpLabelMatch = { fg = colors.purple, bg = colors.none, bold = true }, -- (Apparently unused but works) Label of the completion item when it matches the query
        BlinkCmpLabelDetail = { fg = colors.fg_dark }, -- Label description of the completion item
        BlinkCmpLabelDescription = { fg = colors.fg_dark }, -- Label description of the completion item
        -- BlinkCmpKind = {}, -- Kind icon/text of the completion item
        BlinkCmpSource = { fg = colors.fg_dark }, -- source of the completion item
        BlinkCmpGhostText = { link = "NonText" }, -- preview item with ghost text
        BlinkCmpDoc = { fg = colors.fg_dark, bg = colors.bg_float }, -- documentation window
        BlinkCmpDocBorder = { bg = colors.bg_float }, -- documentation window border
        BlinkCmpDocSeparator = { bg = colors.bg_float }, -- the documentation separator between doc and detail
        BlinkCmpDocCursorLine = { link = "CursorLine" }, -- doc window cursorline
        BlinkSignatureHelp = { bg = colors.bg_float }, -- signature help window
        BlinkSignatureHelpBorder = { bg = colors.bg_float }, -- signature help window border
        BlinkCmpSignatureHelpActiveParameter = { bg = colors.bg_visual, bold = true }, -- active param of the signature help
    },
    diagnostic = {
        -- diagnostic highlights
        -- see :h diagnostic-highlights
        -- and: https://neovim.io/doc/user/diagnostic.html#diagnostic-highlights
        DiagnosticError = { fg = colors.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticWarn = { fg = colors.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticInfo = { fg = colors.blue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticHint = { fg = colors.fg_dark }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticOk = { fg = colors.green }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

        -- virtual text next to a diagnostic
        DiagnosticVirtualTextError = { fg = colors.red, bg = opts.transparent and colors.none or colors.bg }, -- Used for "Error" diagnostic virtual text
        DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = opts.transparent and colors.none or colors.bg }, -- Used for "Warning" diagnostic virtual text
        DiagnosticVirtualTextInfo = { fg = colors.blue, bg = opts.transparent and colors.none or colors.bg }, -- Used for "Information" diagnostic virtual text
        DiagnosticVirtualTextHint = {
            fg = colors.fg_dark,
            bg = opts.transparent and colors.none or colors.bg,
        }, -- Used for "Hint" diagnostic virtual text
        DiagnosticVirtualTextOk = { fg = colors.green, bg = opts.transparent and colors.none or colors.bg }, -- Used for "Ok" diagnostic virtual text

        -- virtual lines
        DiagnosticVirtualLinesError = { fg = colors.red, bg = opts.transparent and colors.none or colors.bg }, -- Used for "Error" diagnostic virtual text
        DiagnosticVirtualLinesWarn = { fg = colors.yellow, bg = opts.transparent and colors.none or colors.bg }, -- Used for "Warning" diagnostic virtual text
        DiagnosticVirtualLinesInfo = { fg = colors.blue, bg = opts.transparent and colors.none or colors.bg }, -- Used for "Information" diagnostic virtual text
        DiagnosticVirtualLinesHint = {
            fg = colors.fg_dark,
            bg = opts.transparent and colors.none or colors.bg,
        }, -- Used for "Hint" diagnostic virtual text
        DiagnosticVirtualLinesOk = { fg = colors.green, bg = opts.transparent and colors.none or colors.bg }, -- Used for "Ok" diagnostic virtual text

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
    },
    fzf = {
        FzfLuaNormal = { fg = colors.fg, bg = colors.bg_float },
        FzfLuaHeaderBind = { fg = colors.green, bg = colors.bg_float },
        FzfLuaHeaderText = { fg = colors.green, bg = colors.bg_float },

        -- NOTE: these don't apply to rg output in live_grep
        FzfLuaPathLineNr = { fg = colors.green },
        FzfLuaBufFlagCur = { fg = colors.purple },
        FzfLuaBufFlagAlt = { fg = colors.blue },
        FzfLuaPathColNr = { fg = colors.yellow },
    },
    gitsigns = {
        GitSignsAdd = { fg = colors.green },
        GitSignsChange = { fg = colors.blue },
        GitSignsDelete = { fg = colors.red },

        GitSignsAddPreview = { fg = colors.none, bg = colors.green_diff },
        GitSignsAddInline = { fg = colors.bg, bg = colors.green },

        GitSignsChangePreview = { fg = colors.none, bg = colors.blue_diff },
        GitSignsChangeInline = { fg = colors.bg, bg = colors.blue },

        GitSignsDeletePreview = { fg = colors.none, bg = colors.red_diff },
        GitSignsDeleteInline = { fg = colors.bg, bg = colors.red },
    },
    hlslens = {
        HlSearchLens = { link = "Search" },
    },
    incline = {
        InclineNormal = { fg = colors.fg_mid, bg = colors.bg, italic = true },
        InclineNormalNC = { fg = colors.fg_dark, bg = colors.bg, italic = true },
    },
    indent_blankline = {
        IblIndent = { fg = colors.fg_comment },
        IblScope = { fg = colors.purple },
    },
    lazy = {
        LazyProgressTodo = { fg = colors.gray1 },
        LazyProgressDone = { fg = colors.purple },
        LazyInfo = { fg = colors.purple },
        LazyH1 = { fg = colors.bg, bg = colors.purple },
    },
    lsp = {
        -- These groups are for the native LSP client. Some other LSP clients may
        -- use these groups, or use their own. Consult your LSP client's documentation.
        -- see :h lsp-highlight
        LspReferenceText = { bg = colors.bg_visual }, -- used for highlighting "text" references (e.g., highlight symbol under cursor)
        LspReferenceRead = { link = "LspReferenceText" }, -- used for highlighting "read" references
        LspReferenceWrite = { link = "LspReferenceText" }, -- used for highlighting "write" references
        LspReferenceTarget = { link = "LspReferenceText" }, -- used for highlighting reference targets (e.g., in a hover range)
        LspInlayHint = { fg = colors.fg_dark },
        LspCodeLens = { fg = colors.fg_dark },
        LspCodeLensSeparator = { fg = colors.fg_dark },
        LspSignatureActiveParameter = { bg = colors.bg_visual, bold = true },

        -- NOTE: match foreground but set bg to none: override when marksman LSP active
        -- ["@lsp.type.class.markdown"] = {},

        -- LSP Semantic Token Groups (semantic highlighting)
        -- see :h lsp-semantic-highlight
        -- and https://neovim.io/doc/user/lsp.html#lsp-semantic-highlight
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
        -- ["@lsp.type.variable"] = {}, -- Identifiers that declare or reference a local or global variable

        -- ["@lsp.mod.abstract"] = {}, --        Types and member functions that are abstract
        -- ["@lsp.mod.async"] = {}, --           Functions that are marked async
        -- ["@lsp.mod.declaration"] = {}, --     Declarations of symbols
        -- ["@lsp.mod.defaultLibrary"] = {}, --  Symbols that are part of the standard library
        -- ["@lsp.mod.definition"] = {}, --      Definitions of symbols, for example, in header files
        -- ["@lsp.mod.deprecated"] = {}, --      Symbols that should no longer be used
        -- ["@lsp.mod.documentation"] = {}, --   Occurrences of symbols in documentation
        -- ["@lsp.mod.modification"] = {}, --    Variable references where the variable is assigned to
        ["@lsp.mod.readonly"] = { link = "@constant" }, -- Readonly variables and member fields (constants)
        ["@lsp.mod.static"] = { link = "@constant" }, -- Class members (static members)

        -- NOTE: I don't think below highlights are needed
        -- ["@lsp.mod.global"] = { link = "@constant" },

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
    },
    markdown = {
        -- NOTE: no longer in docs?
        markdownH1 = {
            fg = colors.purple,
            bg = opts.transparent and colors.none or colors.bg,
            bold = true,
        },
        markdownH1Delimiter = {
            fg = colors.purple,
            bg = opts.transparent and colors.none or colors.bg,
            bold = true,
        }, -- the #s
        markdownH2 = {
            fg = colors.purple,
            bg = opts.transparent and colors.none or colors.bg,
            bold = true,
        },
        markdownH2Delimiter = {
            fg = colors.purple,
            bg = opts.transparent and colors.none or colors.bg,
            bold = true,
        },
        markdownH3 = {
            fg = colors.purple,
            bg = opts.transparent and colors.none or colors.bg,
            bold = true,
        },
        markdownH3Delimiter = {
            fg = colors.purple,
            bg = opts.transparent and colors.none or colors.bg,
            bold = true,
        },
        markdownH4 = {
            fg = colors.purple,
            bg = opts.transparent and colors.none or colors.bg,
            bold = true,
        },
        markdownH4Delimiter = {
            fg = colors.purple,
            bg = opts.transparent and colors.none or colors.bg,
            bold = true,
        },
        markdownH5 = {
            fg = colors.purple,
            bg = opts.transparent and colors.none or colors.bg,
            bold = true,
        },
        markdownH5Delimiter = {
            fg = colors.purple,
            bg = opts.transparent and colors.none or colors.bg,
            bold = true,
        },
        markdownH6 = {
            fg = colors.purple,
            bg = opts.transparent and colors.none or colors.bg,
            bold = true,
        },
        markdownH6Delimiter = {
            fg = colors.purple,
            bg = opts.transparent and colors.none or colors.bg,
            bold = true,
        },
    },
    oil = {
        OilSize = { fg = colors.yellow },
        OilModTime = { fg = colors.pink },
        OilDir = { fg = colors.blue, bold = true },
    },
    statusline = {
        StatuslineModeNormal = { fg = colors.gray0, bg = colors.gray4, bold = true },
        StatuslineModeInsert = { fg = colors.bg, bg = colors.purple, bold = true },
        StatuslineModeVisual = { fg = colors.bg, bg = colors.green, bold = true },
        StatuslineModeCommand = { fg = colors.bg, bg = colors.blue, bold = true },
        StatuslineModePending = { link = "StatuslineModeNormal" },
        StatuslineModeOther = { link = "StatuslineModeNormal" },

        StatuslineGitHead = { fg = colors.gray0, bg = colors.gray3, bold = true },

        StatuslineSectionInner = { fg = colors.gray0, bg = colors.gray3 },
        StatuslineSectionOuter = { fg = colors.gray0, bg = colors.gray4 },
    },
    syntax = {
        -- Suggested syntax highlight group names
        -- :h group-name
        Comment = override_textstyle({ fg = colors.fg_comment }, opts.text_styles.comments), -- any comment
        Constant = { fg = colors.moon, bold = true }, -- (preferred) any constant
        String = { fg = colors.green }, --   a string constant: "this is a string"
        Character = { fg = colors.yellow }, --  a character constant: 'c', '\n'
        Number = override_textstyle({ fg = colors.orange }, opts.text_styles.numbers), --   a number constant: 234, 0xff
        Boolean = override_textstyle({ fg = colors.yellow }, opts.text_styles.booleans), --  a boolean constant: TRUE, false
        Float = override_textstyle({ fg = colors.orange }, opts.text_styles.floats), -- a floating point constant: 2.3e10
        Identifier = { fg = colors.fg }, -- (preferred) any variable name
        Function = override_textstyle({ fg = colors.purple }, opts.text_styles.functions), -- function name (also: methods for classes) (TS: @function)
        Statement = { fg = colors.pink }, -- (preferred) any statement
        Conditional = { fg = colors.blue, bold = true }, --  if, then, else, endif, switch, etcolors.
        Repeat = { link = "Conditional" }, --   for, do, while, etcolors. (TS: @keyword.repeat)
        -- Label = {}, --    case, default, etcolors.
        Operator = { fg = colors.fg_dark }, -- "sizeof", "+", "*", etcolors. (also "==", "=", "->")
        -- NOTE: Keyword seems to take precedent over Statement
        Keyword = override_textstyle({ fg = colors.pink }, opts.text_styles.keywords), --  any other keyword like "local" in Lua and import in Python/Go
        Exception = { link = "Keyword" }, --  try, catch, throw
        PreProc = { fg = colors.purple }, -- (preferred) generic Preprocessor
        Include = { link = "PreProc" }, --  preprocessor #include
        Define = { link = "PreProc" }, --   preprocessor #define
        Macro = { link = "PreProc" }, --    same as Define
        PreCondit = { link = "PreProc" }, --  preprocessor #if, #else, #endif, etcolors.
        Type = override_textstyle({ fg = colors.pink }, opts.text_styles.types), -- (preferred) int, long, char, etcolors.
        -- StorageClass  = {}, -- static, register, volatile, etcolors.
        Structure = { link = "Type" }, --  struct, union, enum, etcolors.
        -- Typedef       = {}, --  A typedef
        Special = { fg = colors.blue }, -- (preferred) any special symbol
        -- SpecialChar   = {}, --  special character in a constant
        Tag = { fg = colors.blue }, --    you can use CTRL-] on this
        Delimiter = { fg = colors.fg_dark }, --  character that needs attention
        -- SpecialComment= {}, -- special things inside a comment
        -- Debug = {}, --    debugging statements
        Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
        -- Ignore = {}, -- (preferred) left blank, hidden  |hl-Ignore|
        Error = { fg = colors.red }, -- (preferred) any erroneous construct
        Todo = { fg = colors.purple }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        Added = { link = "DiffAdd" },
        Changed = { link = "DiffChange" },
        Removed = { link = "DiffDelete" },
    },
    todo_comments = {
        TodoFgTodo = { fg = colors.purple },
        TodoBgTodo = { fg = colors.bg, bg = colors.purple, bold = true },
        TodoFgNote = { fg = colors.gray1 },
        TodoBgNote = { fg = colors.bg, bg = colors.gray1, bold = true },
        TodoFgWarn = { fg = colors.yellow },
        TodoBgWarn = { fg = colors.bg, bg = colors.yellow, bold = true },
        TodoFgFix = { fg = colors.red },
        TodoBgFix = { fg = colors.bg, bg = colors.red, bold = true },
    },
    -- :h standard captures
    treesitter = {
        ["@variable"] = { link = "Identifier" }, -- various variable names (didn't match anything else)
        ["@variable.builtin"] = { fg = colors.moon, italic = true }, -- built-in variable names (e.g., this, self)
        ["@variable.parameter"] = { fg = colors.fg }, -- parameters of a function
        ["@variable.parameter.builtin"] = { fg = colors.moon }, -- special parameters (e.g., _, it)
        ["@variable.member"] = { fg = colors.blue }, -- object and struct fields.

        ["@constant"] = { link = "Constant" }, -- constant identifiers
        ["@constant.builtin"] = { link = "Constant" }, -- built-in constant values
        ["@constant.macro"] = { link = "Constant" }, -- constants defined by the preprocessor

        ["@module"] = { fg = colors.blue, bold = true }, -- module or namespaces (like main in package main in Go)
        ["@module.builtin"] = { link = "@module" }, -- built-in modules or namespaces
        ["@label"] = { link = "Label" }, -- GOTO and other labels (e.g., label: in C), including heredoc labels

        ["@string"] = { link = "String" }, -- string literals
        ["@string.documentation"] = { link = "String" }, -- string documenting code (e.g., Python docstrings)
        ["@string.regexp"] = { link = "Character" }, -- regular expressions
        ["@string.escape"] = { link = "Character" }, -- escape sequences
        ["@string.special"] = { link = "Character" }, -- other special strings (e.g., dates)
        ["@string.special.symbol"] = { link = "Character" }, -- symbols or atoms
        ["@string.special.path"] = { fg = colors.yellow, italic = true }, -- filenames
        ["@string.special.url"] = { link = "@string.special.path" }, -- URIs (e.g., hyperlinks)

        ["@character"] = { link = "Character" }, -- character literals
        ["@character.special"] = { link = "Character" }, -- special characters (e.g., wildcards)

        ["@boolean"] = { link = "Boolean" }, -- boolean literals
        ["@number"] = { link = "Number" }, -- numeric literals
        ["@number.float"] = { link = "Float" }, -- floating-point number literals

        ["@type"] = { link = "Type" }, -- type or class definitions and annotations
        ["@type.builtin"] = { link = "Type" }, -- built-in types
        ["@type.definition"] = { link = "Type" }, -- identifiers in type definitions (e.g., typedef <type> <identifier> in C)

        ["@attribute"] = { link = "Constant" }, -- attribute annotations (e.g., Python decorators, Rust lifetimes)
        ["@attribute.builtin"] = { link = "Constant" }, -- built-in annotations (e.g., @property in Python)
        ["@property"] = { fg = colors.blue }, -- the key in key-value pairs, Lua tables

        ["@function"] = { link = "Function" }, -- function definitions (name of the function)
        ["@function.builtin"] = { link = "Function" }, -- built-in functions like require() or print()
        ["@function.call"] = { link = "Function" }, -- function calls
        ["@function.macro"] = { link = "Function" }, -- preprocessor macros
        ["@function.method"] = { link = "Function" }, -- method definitions
        ["@function.method.call"] = { link = "Function" }, -- method calls
        ["@constructor"] = { link = "Function" }, -- constructor calls and definitions
        ["@operator"] = { link = "Operator" }, -- symbolic operators (e.g., +, *)

        ["@keyword"] = { link = "Keyword" }, -- keywords not fitting into specific categories
        ["@keyword.coroutine"] = { fg = colors.pink, bold = true }, -- keywords related to coroutines (e.g., go in Go, async/await in Python)
        ["@keyword.function"] = { fg = colors.pink, bold = true }, -- keywords that define a function (e.g., func in Go, def in Python)
        ["@keyword.operator"] = { fg = colors.yellow, italic = true }, -- operators that are English words (e.g., and, or, not)
        ["@keyword.import"] = { link = "PreProc" }, -- keywords for including or exporting modules (e.g., import, from in Python)
        ["@keyword.type"] = { fg = colors.pink }, -- keywords describing namespaces and composite types (e.g., struct, enum)
        ["@keyword.modifier"] = { fg = colors.purple, bold = true }, -- keywords modifying other constructs (e.g., const, static, public)
        ["@keyword.repeat"] = { link = "Repeat" }, -- keywords related to loops (e.g., for, while)
        ["@keyword.return"] = { link = "@keyword.function" }, -- keywords like return and yield
        ["@keyword.debug"] = { link = "Keyword" }, -- keywords related to debugging
        ["@keyword.exception"] = { link = "Exception" }, -- keywords releated to exceptions (e.g., throw, catch)

        ["@keyword.conditional"] = { link = "Conditional" }, -- keywords related to conditionals (e.g., if, else)
        ["@keyword.conditional.ternary"] = { link = "Conditional" }, -- ternary operator (e.g., ?, :)

        ["@keyword.directive"] = { link = "PreProc" }, -- various preprocessor directives and shebangs
        ["@keyword.directive.define"] = { link = "PreProc" }, -- preprocessor definition directives

        ["@punctuation.delimiter"] = { link = "Delimiter" }, -- delimiters (e.g., ;, ., ,)
        ["@punctuation.bracket"] = { link = "Delimiter" }, -- brackets (e.g., (), {}, [])
        ["@punctuation.special"] = { link = "Special" }, -- special symbols (e.g., {} in string interpolation)

        ["@comment"] = { link = "Comment" }, -- line and block comments
        ["@comment.documentation"] = { link = "Comment" }, -- comments documenting code

        -- ["@comment.error"] = {}, -- error-type comments (e.g., ERROR, FIXME, DEPRECATED)
        -- ["@comment.warning"] = {}, -- warning-type comments (e.g., WARNING, FIX, HACK)
        -- ["@comment.todo"] = {}, -- todo-type comments (e.g., TODO, WIP)
        -- ["@comment.note"] = {}, -- note-type comments (e.g., NOTE, INFO, XXX)

        ["@markup.strong"] = { fg = colors.pink, bold = true }, -- bold text
        ["@markup.italic"] = { fg = colors.pink, italic = true }, -- italic text
        ["@markup.strikethrough"] = { strikethrough = true }, -- struck-through text
        ["@markup.underline"] = { fg = colors.pink, underline = true }, -- underlined text (only for literal underline markup!)

        ["@markup.heading"] = { link = "markdownH1" },
        ["@markup.heading.1"] = { link = "markdownH1" }, -- headings, titles (including markers)
        ["@markup.heading.1.marker"] = { link = "markdownH1Delimiter" }, -- top-level heading
        ["@markup.heading.2"] = { link = "markdownH2" }, -- section heading
        ["@markup.heading.2.marker"] = { link = "markdownH2Delimiter" },
        ["@markup.heading.3"] = { link = "markdownH3" }, -- subsection heading
        ["@markup.heading.3.marker"] = { link = "markdownH3Delimiter" },
        ["@markup.heading.4"] = { link = "markdownH4" }, -- and so on
        ["@markup.heading.4.marker"] = { link = "markdownH4Delimiter" },
        ["@markup.heading.5"] = { link = "markdownH5" }, -- and so forth
        ["@markup.heading.5.marker"] = { link = "markdownH5Delimiter" },
        ["@markup.heading.6"] = { link = "markdownH6" }, -- six levels ought to be enough for anybody
        ["@markup.heading.6.marker"] = { link = "markdownH6Delimiter" },

        ["@markup.quote"] = { fg = colors.green, italic = true }, -- block quotes
        ["@markup.math"] = { fg = colors.yellow, italic = true }, -- math environments (e.g., $ ... $ in LaTeX)

        ["@markup.link"] = { fg = colors.purple, italic = true }, -- text references, footnotes, citations, etc.
        ["@markup.link.label"] = { fg = colors.purple, underline = true }, -- link, reference descriptions (the link label for markdown links)
        ["@markup.link.url"] = { fg = colors.purple, italic = true }, -- URL-style links (the actual url for markdown link)

        ["@markup.raw"] = { fg = colors.blue, bg = colors.bg_float }, -- literal or verbatim text (e.g., inline code)
        ["@markup.raw.block"] = { bg = colors.none }, -- literal or verbatim text as a stand-alone block

        ["@markup.list"] = {}, -- list markers
        ["@markup.list.checked"] = { fg = colors.fg_dark, strikethrough = false }, -- checked todo-style list markers -> top item only
        ["@markup.list.unchecked"] = { fg = colors.blue }, -- unchecked todo-style list markers

        ["@diff.plus"] = { link = "DiffAdd" }, -- added text (for diff files)
        ["@diff.minus"] = { link = "DiffDelete" }, -- deleted text (for diff files)
        ["@diff.delta"] = { link = "DiffChange" }, -- changed text (for diff files)

        ["@tag"] = { link = "Keyword" }, -- XML-style tag names (e.g., in XML, HTML, etc.)
        ["@tag.builtin"] = { fg = colors.red }, -- builtin tag names (e.g., HTML5 tags)
        ["@tag.attribute"] = { link = "Function" }, -- XML-style tag attributes
        ["@tag.delimiter"] = { link = "Delimiter" }, -- XML-style tag delimiters
    },
    treesitter_context = {
        TreesitterContext = { link = "Folded" },
        TreesitterContextLineNumber = { fg = colors.gray0, bold = true },
    },
    -- trouble = {
    --     TroubleText = { fg = colors.purple },
    --     TroubleCount = { fg = colors.bg, bg = colors.purple },
    --     TroubleNormal = { bg = opts.transparent and colors.none or colors.bg },
    --     TroubleNormalNC = { bg = opts.transparent and colors.none or colors.bg },
    -- },
}

local M = {}

--- Wrapper function for setting highlights
---@param group string
---@param hl vim.api.keyset.highlight
local function set_highlight(group, hl)
    vim.api.nvim_set_hl(0, group, hl)
end

--- Set all colorscheme highlights
function M.set_highlights()
    ---@type table<string, vim.api.keyset.highlight>
    local highlights_flat = {}
    for _, set in pairs(highlights) do
        for group, hl in pairs(set) do
            highlights_flat[group] = hl
        end
    end

    local hl_overrides = opts.hl_overrides
    if hl_overrides ~= nil then
        hl_overrides(highlights_flat, colors)
    end

    for group, hl in pairs(highlights_flat) do
        set_highlight(group, hl)
    end

    -- NOTE: this relies on the main highlights being set
    set_kind_highlights()
end

return M
