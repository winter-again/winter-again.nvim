local colors = require('winter-again.colors')

local M = {}

-- from Folke's tokyonight
-- NOTE: can handle config overrides here
function M.setup()
    local theme = {}
    local options = {} -- this can take user options/overrides

    local c = colors
    theme.highlights = {
        -- See :h highlight-groups
        Comment = { fg = c.comment, italic = true }, -- any comment
        -- ColorColumn    { }, -- Columns set with 'colorcolumn'
        -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor = { fg = c.fg, bg = c.bg, reverse = true }, -- Character under the cursor
        IncSearch = { fg = c.yellow0, standout = true }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        CurSearch = { link = 'IncSearch' }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
        -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
        -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine = { bg = c.bg_highlight }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        -- Directory      { }, -- Directory names (and other special names in listings)
        -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
        -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
        -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
        -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer = { fg = c.bg }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        -- TermCursor     { }, -- Cursor in a focused terminal
        -- TermCursorNC   { }, -- Cursor in an unfocused terminal
        ErrorMsg = { fg = c.red0 }, -- Error messages on the command line
        VertSplit = { fg = c.fg }, -- Column separating vertically split windows
        Winseparator = { fg = c.fg, bold = true }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        -- Folded = { fg = c.blue1, bg = c.fg_dark, bold = true }, -- Line used for closed folds
        FoldColumn = { fg = c.comment, bg = c.bg }, -- 'foldcolumn'
        SignColumn = { fg = c.gutter, bg = c.bg }, -- Column where |signs| are displayed
        -- Substitute     { }, -- |:substitute| replacement text highlighting
        LineNr = { fg = c.gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        CursorLineNr = { fg = c.purple }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
        -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
        MatchParen = { fg = c.orange1, bold = true }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea        { }, -- Area for messages and cmdline
        -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        -- MoreMsg        { }, -- |more-prompt|
        NonText = { fg = c.dark3 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal = { fg = c.fg, bg = c.bg }, -- Normal text
        NormalFloat = { fg = c.fg, bg = c.bg }, -- Normal text in floating windows.
        FloatBorder = { fg = c.blue1, bg = c.bg_float }, -- Border of floating windows.
        FloatTitle = { fg = c.blue1, bg = c.bg_float }, -- Title of floating windows.
        NormalNC = { fg = c.bg, bg = c.bg }, -- normal text in non-current windows
        Pmenu = { fg = c.fg, bg = c.bg_float }, -- Popup menu: Normal item.
        PmenuSel = { bg = c.bg_visual }, -- Popup menu: Selected item.
        PmenuSbar = { bg = c.fg }, -- Popup menu: Scrollbar.
        PmenuThumb = { bg = c.gutter }, -- Popup menu: Thumb of the scrollbar.
        -- PmenuKind = {}, -- Popup menu: Normal item "kind"
        -- PmenuKindSel = {}, -- Popup menu: Selected item "kind"
        -- PmenuExtra = {}, -- Popup menu: Normal item "extra text"
        -- PmenuExtraSel = {}, -- Popup menu: Selected item "extra text"
        -- Question       { }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search = { fg = c.fg, bg = c.bg_visual }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine = { fg = c.fg_sidebar, bg = c.bg_float }, -- Status line of current window
        StatusLineNC = { fg = c.gutter, bg = c.bg_float }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        -- TabLine        { }, -- Tab pages line, not active tab page label
        -- TabLineFill    { }, -- Tab pages line, where there are no labels
        -- TabLineSel     { }, -- Tab pages line, active tab page label
        -- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
        Visual = { bg = c.bg_visual, reverse = true }, -- Visual mode selection
        -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
        -- WarningMsg     { }, -- Warning messages
        -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        -- WildMenu = { fg = c.red0, bg = c.bg_float, reverse = true }, -- Current match in 'wildmenu' completion
        WinBar = { fg = c.fg, bg = c.bg }, -- Window bar of current window
        WinBarNC = { fg = c.fg_gray, bg = c.bg }, -- Window bar of not-current windows

        -- These groups are not listed as default vim groups,
        -- but they are defacto standard group names for syntax highlighting.
        -- commented out groups should chain up to their "preferred" group by
        -- default,
        -- Uncomment and edit if you want more specific syntax highlighting.

        Constant = { fg = c.orange0 }, -- (preferred) any constant
        String = { fg = c.green1 }, --   a string constant: "this is a string"
        Character = { fg = c.green1 }, --  a character constant: 'c', '\n'
        -- Number        = { }, --   a number constant: 234, 0xff
        -- Boolean       = { }, --  a boolean constant: TRUE, false
        -- Float         = { }, --    a floating point constant: 2.3e10

        Identifier = { fg = c.purple0 }, -- (preferred) any variable name
        Function = { fg = c.blue0 }, -- function name (also: methods for classes)

        Statement = { fg = c.purple1, bold = true }, -- (preferred) any statement
        -- Conditional   = { }, --  if, then, else, endif, switch, etc.
        -- Repeat        = { }, --   for, do, while, etc.
        -- Label         = { }, --    case, default, etc.
        Operator = { fg = c.blue01 }, -- "sizeof", "+", "*", etc.
        Keyword = { fg = c.yellow0 }, --  any other keyword
        -- Exception     = { }, --  try, catch, throw

        -- NOTE: targets things like 'import' in Python
        PreProc = { fg = c.blue02 }, -- (preferred) generic Preprocessor
        -- Include       = { }, --  preprocessor #include
        -- Define        = { }, --   preprocessor #define
        -- Macro         = { }, --    same as Define
        -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

        -- Type = { fg = c.blue1 }, -- (preferred) int, long, char, etc.
        -- -- StorageClass  = { }, -- static, register, volatile, etc.
        -- -- Structure     = { }, --  struct, union, enum, etc.
        -- -- Typedef       = { }, --  A typedef
        --
        Special = { fg = c.blue000 }, -- (preferred) any special symbol
        -- SpecialChar   = { }, --  special character in a constant
        -- Tag           = { }, --    you can use CTRL-] on this
        -- Delimiter     = { }, --  character that needs attention
        -- SpecialComment= { }, -- special things inside a comment

        -- Debug = { fg = c.orange }, --    debugging statements

        Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
        Bold = { bold = true },
        Italic = { italic = true },

        -- ("Ignore", below, may be invisible...)
        -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

        -- Error = { fg = c.error }, -- (preferred) any erroneous construct
        -- Todo = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        --
        -- qfLineNr = { fg = c.dark5 },
        -- qfFileName = { fg = c.blue },
        --
        -- htmlH1 = { fg = c.magenta, bold = true },
        -- htmlH2 = { fg = c.blue, bold = true },
        --
        -- -- mkdHeading = { fg = c.orange, bold = true },
        -- -- mkdCode = { bg = c.terminal_black, fg = c.fg },
        -- mkdCodeDelimiter = { bg = c.terminal_black, fg = c.fg },
        -- mkdCodeStart = { fg = c.teal, bold = true },
        -- mkdCodeEnd = { fg = c.teal, bold = true },
        -- -- mkdLink = { fg = c.blue, underline = true },
        --
        -- markdownHeadingDelimiter = { fg = c.orange, bold = true },
        -- markdownCode = { fg = c.teal },
        -- markdownCodeBlock = { fg = c.teal },
        -- markdownH1 = { fg = c.magenta, bold = true },
        -- markdownH2 = { fg = c.blue, bold = true },
        -- markdownLinkText = { fg = c.blue, underline = true },
        --
        -- ['helpCommand'] = { bg = c.terminal_black, fg = c.blue },
        --
        -- debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
        -- debugBreakpoint = { bg = util.darken(c.info, 0.1), fg = c.info }, -- used for breakpoint colors in terminal-debug
        --
        -- dosIniLabel = { link = '@property' },
        --
        -- -- These groups are for the native LSP client. Some other LSP clients may
        -- -- use these groups, or use their own. Consult your LSP client's
        -- -- documentation.
        -- LspReferenceText = { bg = c.fg_gutter }, -- used for highlighting "text" references
        -- LspReferenceRead = { bg = c.fg_gutter }, -- used for highlighting "read" references
        -- LspReferenceWrite = { bg = c.fg_gutter }, -- used for highlighting "write" references

        DiagnosticError = { fg = c.red1 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticWarn = { fg = c.yellow0 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticInfo = { fg = c.dark3 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticHint = { fg = c.green2 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        -- DiagnosticUnnecessary = { fg = c.terminal_black }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

        DiagnosticVirtualTextError = { bg = c.bg_float, fg = c.red1 }, -- Used for "Error" diagnostic virtual text
        DiagnosticVirtualTextWarn = { bg = c.bg_float, fg = c.yellow0 }, -- Used for "Warning" diagnostic virtual text
        DiagnosticVirtualTextInfo = { bg = c.bg_float, fg = c.dark3 }, -- Used for "Information" diagnostic virtual text
        DiagnosticVirtualTextHint = { bg = c.bg_float, fg = c.green2 }, -- Used for "Hint" diagnostic virtual text

        -- DiagnosticUnderlineError = { undercurl = true, sp = c.error }, -- Used to underline "Error" diagnostics
        -- DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning }, -- Used to underline "Warning" diagnostics
        -- DiagnosticUnderlineInfo = { undercurl = true, sp = c.info }, -- Used to underline "Information" diagnostics
        -- DiagnosticUnderlineHint = { undercurl = true, sp = c.hint }, -- Used to underline "Hint" diagnostics
        --
        -- LspSignatureActiveParameter = { bg = util.darken(c.bg_visual, 0.4), bold = true },
        -- LspCodeLens = { fg = c.comment },
        -- LspInlayHint = { bg = util.darken(c.blue7, 0.1), fg = c.dark3 },
        --
        -- LspInfoBorder = { fg = c.border_highlight, bg = c.bg_float },
        --
        -- ALEErrorSign = { fg = c.error },
        -- ALEWarningSign = { fg = c.warning },
        --
        -- DapStoppedLine = { bg = util.darken(c.warning, 0.1) }, -- Used for "Warning" diagnostic virtual text
        --
        --
        -- NOTE: Treesitter
        --
        -- Misc.
        -- TODO:
        -- ["@comment.documentation"] = { },

        ['@operator'] = { fg = c.blue01 }, -- For any operator: `+`, but also `->` and `*` in C.

        --- Punctuation
        ['@punctuation.delimiter'] = { fg = c.blue01 }, -- For delimiters ie: `.`
        ['@punctuation.bracket'] = { fg = c.fg_dark }, -- For brackets and parens.
        ['@punctuation.special'] = { fg = c.Foo }, -- For special punctutation that does not fall in the catagories before.
        ['@punctuation.special.markdown'] = { fg = c.orange0, bold = true },

        --- Literals
        ['@string.documentation'] = { fg = c.yellow0 },
        ['@string.regex'] = { fg = c.green0 }, -- For regexes.
        ['@string.escape'] = { fg = c.purple0 }, -- For escape characters within a string.

        --- Functions
        ['@constructor'] = { fg = c.orange0 }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        ['@parameter'] = { fg = c.orange0 }, -- For parameters of a function.
        -- TODO:
        -- ["@parameter.builtin"] = {}, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

        --- Keywords
        ['@keyword'] = { fg = c.purple0, italic = true }, -- For keywords that don't fall in previous categories.
        -- TODO:
        -- ["@keyword.coroutine"] = { }, -- For keywords related to coroutines.
        ['@keyword.function'] = { fg = c.purple0 }, -- For keywords used to define a fuction.
        --
        -- ['@label'] = { fg = c.green500 }, -- For labels: `label:` in C and `:label:` in Lua.

        --- Types
        ['@type.builtin'] = { link = 'Type' },
        ['@field'] = { link = 'Identifier' }, -- For fields.
        ['@property'] = { link = 'Identifier' },

        --- Identifiers
        ['@variable'] = { fg = c.fg }, -- Any variable name that does not have another highlight.
        ['@variable.builtin'] = { fg = c.orange0 }, -- Variable names that are defined by the languages, like `this` or `self`.
        ['@namespace.builtin'] = { fg = c.orange0 }, -- Variable names that are defined by the languages, like `this` or `self`.
        --
        --- Text
        -- ['@text.literal.markdown'] = { fg = c.red500 },
        -- ['@text.literal.markdown_inline'] = { fg = c.yellow500, bg = c.green900 },
        -- ['@text.reference'] = { fg = c.blue500, underline = true },
        --
        -- ['@text.todo.unchecked'] = { fg = c.Foo }, -- For brackets and parens.
        -- ['@text.todo.checked'] = { fg = c.Foo }, -- For brackets and parens.
        -- ['@text.warning'] = { fg = c.yellow900, bg = c.yellow500 },
        -- ['@text.danger'] = { fg = c.red900, bg = c.red500 },
        --
        -- ['@text.diff.add'] = { link = 'DiffAdd' },
        -- ['@text.diff.delete'] = { link = 'DiffDelete' },
        --
        ['@namespace'] = { link = 'Include' },
        --
        -- -- tsx
        -- ['@tag.tsx'] = { fg = c.green500 },
        -- ['@constructor.tsx'] = { fg = c.blue500 },
        -- ['@tag.delimiter.tsx'] = { fg = c.orange500 },
        --
        -- LSP Semantic Token Groups (semantic highlighting)
        ['@lsp.type.boolean'] = { link = '@boolean' },
        ['@lsp.type.builtinType'] = { link = '@type.builtin' },
        ['@lsp.type.comment'] = { link = '@comment' },
        ['@lsp.type.enum'] = { link = '@type' },
        ['@lsp.type.enumMember'] = { link = '@constant' },
        ['@lsp.type.escapeSequence'] = { link = '@string.escape' },
        ['@lsp.type.formatSpecifier'] = { link = '@punctuation.special' },
        ['@lsp.type.interface'] = { fg = c.blue500 },
        ['@lsp.type.keyword'] = { link = '@keyword' },
        ['@lsp.type.namespace'] = { link = '@namespace' },
        ['@lsp.type.number'] = { link = '@number' },
        ['@lsp.type.operator'] = { link = '@operator' },
        ['@lsp.type.parameter'] = { link = '@parameter' },
        ['@lsp.type.property'] = { link = '@property' },
        ['@lsp.type.selfKeyword'] = { link = '@variable.builtin' },
        ['@lsp.type.string.rust'] = { link = '@string' },
        ['@lsp.type.typeAlias'] = { link = '@type.definition' },
        ['@lsp.type.unresolvedReference'] = { undercurl = true, sp = c.red0 },
        ['@lsp.type.variable'] = {}, -- use treesitter styles for regular variables
        ['@lsp.typemod.class.defaultLibrary'] = { link = '@type.builtin' },
        ['@lsp.typemod.enum.defaultLibrary'] = { link = '@type.builtin' },
        ['@lsp.typemod.enumMember.defaultLibrary'] = { link = '@constant.builtin' },
        ['@lsp.typemod.function.defaultLibrary'] = { link = '@function.builtin' },
        ['@lsp.typemod.keyword.async'] = { link = '@keyword.coroutine' },
        ['@lsp.typemod.macro.defaultLibrary'] = { link = '@function.builtin' },
        ['@lsp.typemod.method.defaultLibrary'] = { link = '@function.builtin' },
        ['@lsp.typemod.operator.injected'] = { link = '@operator' },
        ['@lsp.typemod.string.injected'] = { link = '@string' },
        ['@lsp.typemod.type.defaultLibrary'] = { fg = c.blue500 },
        ['@lsp.typemod.variable.defaultLibrary'] = { link = '@variable.builtin' },
        ['@lsp.typemod.variable.injected'] = { link = '@variable' },
        -- NOTE: maybe add these with distinct highlights?
        -- ["@lsp.typemod.variable.globalScope"] (global variables)

        -- plugins
        -- hlsearchlens
        HlSearchLens = { link = 'Search' }, -- tokyonight doesn't need?
        -- GitSigns
        GitSignsAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
        GitSignsChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
        GitSignsDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|
        -- indent blankline
        IblIndent = { fg = c.gutter, nocombine = true },
        IblScope = { fg = c.purple1, nocombine = true },
        -- Telescope
        TelescopeBorder = { fg = c.blue0, bg = c.bg_float },
        TelescopeNormal = { fg = c.fg, bg = c.bg_float },
        TelescopeSelection = { bg = c.bg_visual },
        -- NvimTree
        --     NvimTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
        --     NvimTreeWinSeparator = {
        --         fg = options.styles.sidebars == 'transparent' and c.border or c.bg_sidebar,
        --         bg = c.bg_sidebar,
        --     },
        --     NvimTreeNormalNC = { fg = c.fg_sidebar, bg = c.bg_sidebar },
        --     NvimTreeRootFolder = { fg = c.blue, bold = true },
        --     NvimTreeGitDirty = { fg = c.git.change },
        --     NvimTreeGitNew = { fg = c.git.add },
        --     NvimTreeGitDeleted = { fg = c.git.delete },
        --     NvimTreeOpenedFile = { bg = c.bg_highlight },
        --     NvimTreeSpecialFile = { fg = c.purple, underline = true },
        --     NvimTreeIndentMarker = { fg = c.fg_gutter },
        --     NvimTreeImageFile = { fg = c.fg_sidebar },
        --     NvimTreeSymlink = { fg = c.blue },
        --     NvimTreeFolderIcon = { bg = c.none, fg = c.blue },
        --     -- NvimTreeFolderName= { fg = c.fg_float },
        -- LspTrouble
        --     TroubleText = { fg = c.fg_dark },
        --     TroubleCount = { fg = c.magenta, bg = c.fg_gutter },
        --     TroubleNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
        -- diff
        --     diffAdded = { fg = c.git.add },
        --     diffRemoved = { fg = c.git.delete },
        --     diffChanged = { fg = c.git.change },
        --     diffOldFile = { fg = c.yellow },
        --     diffNewFile = { fg = c.orange },
        --     diffFile = { fg = c.blue },
        --     diffLine = { fg = c.comment },
        --     diffIndexLine = { fg = c.magenta },
        -- Alpha
        --     AlphaShortcut = { fg = c.orange },
        --     AlphaHeader = { fg = c.blue },
        --     AlphaHeaderLabel = { fg = c.orange },
        --     AlphaFooter = { fg = c.blue1 },
        --     AlphaButtons = { fg = c.cyan },
        -- LspSaga
        --     DiagnosticWarning = { link = 'DiagnosticWarn' },
        --     DiagnosticInformation = { link = 'DiagnosticInfo' },
        --
        --     LspFloatWinNormal = { bg = c.bg_float },
        --     LspFloatWinBorder = { fg = c.border_highlight },
        --     LspSagaBorderTitle = { fg = c.cyan },
        --     LspSagaHoverBorder = { fg = c.blue },
        --     LspSagaRenameBorder = { fg = c.green },
        --     LspSagaDefPreviewBorder = { fg = c.green },
        --     LspSagaCodeActionBorder = { fg = c.blue },
        --     LspSagaFinderSelection = { fg = c.bg_visual },
        --     LspSagaCodeActionTitle = { fg = c.blue1 },
        --     LspSagaCodeActionContent = { fg = c.purple },
        --     LspSagaSignatureHelpBorder = { fg = c.red },
        --     ReferencesCount = { fg = c.purple },
        --     DefinitionCount = { fg = c.purple },
        --     DefinitionIcon = { fg = c.blue },
        --     ReferencesIcon = { fg = c.blue },
        --     TargetWord = { fg = c.cyan },
        -- CMP
        --     CmpDocumentation = { fg = c.fg, bg = c.bg_float },
        --     CmpDocumentationBorder = { fg = c.border_highlight, bg = c.bg_float },
        --     CmpGhostText = { fg = c.terminal_black },
        --
        --     CmpItemAbbr = { fg = c.fg, bg = c.none },
        --     CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
        --     CmpItemAbbrMatch = { fg = c.blue1, bg = c.none },
        --     CmpItemAbbrMatchFuzzy = { fg = c.blue1, bg = c.none },
        --
        --     CmpItemMenu = { fg = c.comment, bg = c.none },
        --
        --     CmpItemKindDefault = { fg = c.fg_dark, bg = c.none },
        --
        --     CmpItemKindCodeium = { fg = c.teal, bg = c.none },
        --     CmpItemKindCopilot = { fg = c.teal, bg = c.none },
        --     CmpItemKindTabNine = { fg = c.teal, bg = c.none },
        --
        -- NeoVim
        --     healthError = { fg = c.error },
        --     healthSuccess = { fg = c.green1 },
        --     healthWarning = { fg = c.warning },
        --
        -- Lazy
        --     LazyProgressDone = { bold = true, fg = c.magenta2 },
        --     LazyProgressTodo = { bold = true, fg = c.fg_gutter },
        -- }
        --
        -- -- lsp symbol kind and completion kind highlights
        -- local kinds = {
        --     Array = '@punctuation.bracket',
        --     Boolean = '@boolean',
        --     Class = '@type',
        --     Color = 'Special',
        --     Constant = '@constant',
        --     Constructor = '@constructor',
        --     Enum = '@lsp.type.enum',
        --     EnumMember = '@lsp.type.enumMember',
        --     Event = 'Special',
        --     Field = '@field',
        --     File = 'Normal',
        --     Folder = 'Directory',
        --     Function = '@function',
        --     Interface = '@lsp.type.interface',
        --     Key = '@field',
        --     Keyword = '@lsp.type.keyword',
        --     Method = '@method',
        --     Module = '@namespace',
        --     Namespace = '@namespace',
        --     Null = '@constant.builtin',
        --     Number = '@number',
        --     Object = '@constant',
        --     Operator = '@operator',
        --     Package = '@namespace',
        --     Property = '@property',
        --     Reference = '@text.reference',
        --     Snippet = 'Conceal',
        --     String = '@string',
        --     Struct = '@lsp.type.struct',
        --     Unit = '@lsp.type.struct',
        --     Text = '@text',
        --     TypeParameter = '@lsp.type.typeParameter',
        --     Variable = '@variable',
        --     Value = '@string',
    }
    --
    -- local kind_groups = { 'NavicIcons%s', 'Aerial%sIcon', 'CmpItemKind%s', 'NoiceCompletionItemKind%s' }
    -- for kind, link in pairs(kinds) do
    --     local base = 'LspKind' .. kind
    --     theme.highlights[base] = { link = link }
    --     for _, plugin in pairs(kind_groups) do
    --         theme.highlights[plugin:format(kind)] = { link = base }
    --     end
    -- end

    return theme
end

return M
