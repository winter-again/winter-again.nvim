local colors = require("winter-again.colors")

local M = {}

-- see https://neovim.io/doc/user/syntax.html#highlight-groups

M.editor = {
    -- builtin highlighting groups
    -- ColorColumn    { }, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    CurSearch = { link = "IncSearch" }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    Cursor = { fg = colors.fg, bg = colors.bg, reverse = true }, -- char under cursor
    lCursor = { link = "Cursor" }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { link = "Cursor" }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { link = "CursorLine" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = colors.cursor_line }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    -- Directory      { }, -- Directory names (and other special names in listings)
    -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
    -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
    -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = colors.bg }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    WinSeparator = { fg = colors.gray1 }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    Folded = { fg = colors.blue, bg = colors.cursor_line, bold = true }, -- Line used for closed folds
    ErrorMsg = { fg = colors.red }, -- Error messages on the command line
    -- FoldColumn = { fg = colors.fg_comment, bg = colors.bg }, -- 'foldcolumn'
    -- SignColumn = { fg = colors.fg, bg = colors.cursor_line }, -- Column where |signs| are displayed
    IncSearch = { fg = colors.bg, bg = colors.search, bold = true }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    VertSplit = { link = "WinSeparator" }, -- Column separating vertically split windows
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    LineNr = { fg = colors.fg_dark }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove = {}, -- Line number for when the relativenumber option is set, above the cursor line
    -- LineNrBelow = {}, -- Line number for when the relativenumber option is set, below the cursor line
    CursorLineNr = { fg = colors.purple, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen = { bold = true }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    NonText = { fg = colors.fg_comment }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { bg = colors.none },
    NormalFloat = { fg = colors.fg, bg = colors.bg_float }, -- Normal text in floating windows.
    FloatBorder = { fg = colors.fg, bg = colors.bg_float }, -- Border of floating windows.
    FloatTitle = { fg = colors.fg, bg = colors.bg_float }, -- Title of floating windows.
    -- FloatFooter = {}, -- Footer of floating windows
    NormalNC = { bg = colors.none },

    Pmenu = { fg = colors.fg, bg = colors.bg_float }, -- Popup menu: Normal item.
    PmenuSel = { bg = colors.bg_visual }, -- Popup menu: Selected item.
    -- PmenuKind = {}, -- Popup menu: Normal item "kind"
    -- PmenuKindSel = {}, -- Popup menu: Selected item "kind"
    -- PmenuExtra = {}, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel = {}, -- Popup menu: Selected item "extra text"
    PmenuSbar = { bg = colors.gray2 }, -- Popup menu: Scrollbar.
    PmenuThumb = { bg = colors.gray1 }, -- Popup menu: Thumb of the scrollbar. (current pos)
    -- PmenuMatch = {}, -- Popup menu: Matched text in normal item Combined with hl-Pmenu
    -- PmenuMatchSel = {}, -- Popup menu: Matched text in selected item Combined with hl-PmenuMatch and hl-PmenuSel

    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { fg = colors.fg, bg = colors.bg_visual }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SnippetTabstop = {}, -- Tabstops in snippets
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = colors.fg, bg = colors.bg }, -- Status line of current window
    StatusLineNC = { fg = colors.fg, bg = colors.bg }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- StatusLineTerm = {}, -- Status line of terminal window
    -- StatusLineTermNC = {}, -- Status line of non-current terminal window
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    -- Title          { }, -- Titles for output from ":set all", ":autocmd" etcolors.
    Visual = { bg = colors.bg_visual, reverse = false }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg     { }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu = { fg = colors.red0, bg = colors.bg_float, reverse = true }, -- Current match in 'wildmenu' completion
    WinBar = { fg = colors.fg, bg = colors.bg }, -- Window bar of current window
    WinBarNC = { fg = colors.fg_dark, bg = colors.bg }, -- Window bar of not-current windows
    -- Menu = {}, -- Current font, background and foreground colors of the menus. Also used for the toolbar
    -- Scrollbar = {}, -- Current background and foreground of the main window's scrollbars.
    -- Tooltip = {}, -- Current font, background and foreground of the tooltips
}

M.syntax = {
    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- Commented out groups should link up to their "preferred" group by default

    Comment = { fg = colors.fg_comment, italic = true }, -- any comment
    Constant = { fg = colors.purple }, -- (preferred) any constant
    -- Constant = { fg = colors.blue }, -- (preferred) any constant
    String = { fg = colors.green1 }, --   a string constant: "this is a string"
    Character = { fg = colors.orange }, --  a character constant: 'c', '\n'
    Number = { fg = colors.orange, italic = true }, --   a number constant: 234, 0xff
    Boolean = { fg = colors.orange, italic = true }, --  a boolean constant: TRUE, false
    Float = { fg = colors.orange, italic = true }, --    a floating point constant: 2.3e10
    Identifier = { fg = colors.fg }, -- (preferred) any variable name
    Function = { fg = colors.purple, bold = true }, -- function name (also: methods for classes)
    -- Function = { fg = colors.blue, bold = true }, -- function name (also: methods for classes)
    Statement = { fg = colors.purple, bold = true }, -- (preferred) any statement
    Conditional = { fg = colors.blue, bold = true }, --  if, then, else, endif, switch, etcolors.
    -- Repeat        = { }, --   for, do, while, etcolors.
    -- Label         = { }, --    case, default, etcolors.
    Operator = { fg = colors.blue }, -- "sizeof", "+", "*", etcolors.
    -- Keyword = { fg = colors.blue, bold = false }, --  any other keyword like "local" in Lua
    Keyword = { fg = colors.purple, bold = false }, --  any other keyword like "local" in Lua
    -- Exception     = { }, --  try, catch, throw
    -- PreProc = { fg = colors.blue02 }, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etcolors.
    Type = { fg = colors.blue, italic = true }, -- (preferred) int, long, char, etcolors.
    -- StorageClass  = { }, -- static, register, volatile, etcolors.
    -- Structure     = { }, --  struct, union, enum, etcolors.
    -- Typedef       = { }, --  A typedef
    -- Special = { fg = colors.blue000 }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    -- Delimiter     = { }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    -- Debug = { fg = colors.orange }, --    debugging statements
    Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
    Bold = { bold = true },
    Italic = { italic = true },
    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|
    Error = { fg = colors.red }, -- (preferred) any erroneous construct
    -- Todo = { fg = colors.bg, bg = colors.blue }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- qfLineNr = { fg = colors.dark5 },
    -- qfFileName = { fg = colors.blue },
    -- htmlH1 = { fg = colors.magenta, bold = true },
    -- htmlH2 = { fg = colors.blue, bold = true },
    -- mkdHeading = { fg = colors.orange, bold = true },
    -- mkdCode = { bg = colors.terminal_black, fg = colors.fg },
    -- mkdCodeDelimiter = { bg = colors.terminal_black, fg = colors.fg },
    -- mkdCodeStart = { fg = colors.teal, bold = true },
    -- mkdCodeEnd = { fg = colors.teal, bold = true },
    -- mkdLink = { fg = colors.blue, underline = true },
    -- markdownHeadingDelimiter = { fg = colors.orange, bold = true },
    markdownCode = { fg = colors.green },
    markdownCodeBlock = { fg = colors.green },
    -- markdownH1 = { fg = colors.magenta, bold = true },
    -- markdownH2 = { fg = colors.blue, bold = true },
    -- markdownLinkText = { fg = colors.blue, underline = true },
    -- ['helpCommand'] = { bg = colors.terminal_black, fg = colors.blue },
    -- debugPC = { bg = colors.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    -- debugBreakpoint = { bg = util.darken(colors.info, 0.1), fg = colors.info }, -- used for breakpoint colors in terminal-debug
    -- dosIniLabel = { link = '@property' },

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = colors.Foo }, -- used for highlighting "text" references
    LspReferenceRead = { bg = colors.Foo }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = colors.Foo }, -- used for highlighting "write" references

    DiagnosticError = { fg = colors.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = colors.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = colors.blue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = colors.fg_dark }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = { fg = colors.fg_dark }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { fg = colors.red, bg = colors.bg_float }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = colors.bg_float }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = colors.bg_float }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { fg = colors.fg_dark, bg = colors.bg_float }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { undercurl = true, sp = colors.red }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.fg_dark }, -- Used to underline "Hint" diagnostics
}

M.treesitter = {
    -- see https://neovim.io/doc/user/treesitter#treesitter-highlight-groups
    -- for standard captures

    ["@variable"] = { link = "Identifier" }, -- various variable names
    ["@variable.builtin"] = { fg = colors.pink, italic = true }, -- built-in variable names (e.g., this, self)
    ["@variable.parameter"] = {}, -- parameters of a function
    ["@variable.parameter.builtin"] = {}, -- special parameters (e.g., _, it)
    ["@variable.member"] = { link = "Identifier" }, -- object and struct fields.

    ["@constant"] = { link = "Constant" }, -- constant identifiers
    ["@constant.builtin"] = { fg = colors.yellow }, -- built-in constant values
    ["@constant.macro"] = {}, -- constants defined by the preprocessor

    ["@module"] = { fg = colors.pink }, -- module or namespaces (like main in package main in Go)
    ["@module.builtin"] = { fg = colors.Foo }, -- built-in modules or namespaces
    ["@label"] = { fg = colors.Foo }, -- GOTO and other lables (e.g., label: in C), including heredoc labels

    ["@string"] = { link = "String" }, -- string literals
    ["@string.documentation"] = { link = "String" }, -- string documenting code (e.g., Python docstrings)
    ["@string.regexp"] = { fg = colors.Foo }, -- regular expressions
    ["@string.escape"] = { fg = colors.orange }, -- escape sequences
    ["@string.special"] = {}, -- other special strings (e.g., dates)
    ["@string.special.symbol"] = {}, -- symbols or atoms
    ["@string.special.path"] = { italic = true }, -- filenames
    ["@string.special.url"] = {}, -- URIs (e.g., hyperlinks)

    ["@character"] = { link = "Character" }, -- character literals
    ["@character.special"] = {}, -- special characters (e.g., wildcards)

    ["@boolean"] = { link = "Boolean" }, -- boolean literals
    ["@number"] = { link = "Number" }, -- numeric literals
    ["@number.float"] = { link = "Float" }, -- floating-point number literals

    ["@type"] = { link = "Type" }, -- type or class definitions and annotations
    ["@type.builtin"] = { link = "Type" }, -- built-in types
    ["@type.definition"] = {}, -- identifiers in type definitions (e.g., typedef <type> <identifier> in C)

    ["@attribute"] = { italic = true }, -- attribute annotations (e.g., Python decorators, Rust lifetimes)
    ["@attribute.builtin"] = { italic = true }, -- built-in annotations (e.g., @property in Python)
    ["@property"] = { fg = colors.blue }, -- the key in key-value pairs
    -- ["@property"] = { fg = colors.purple },

    ["@function"] = { link = "Function" }, -- function definitions
    ["@function.builtin"] = { link = "Function" }, -- built-in functions
    ["@function.call"] = { link = "Function" }, -- function calls
    ["@function.macro"] = {}, -- preprocessor macros

    ["@function.method"] = { link = "Function" }, -- method definitions
    ["@function.method.call"] = { link = "Function" }, -- method calls

    ["@constructor"] = { fg = colors.purple }, -- constructor calls and definitions
    ["@operator"] = { link = "Operator" }, -- symbolic operators (e.g., +, *)

    ["@keyword"] = { link = "Keyword" }, -- keywords not fitting into specific categories
    ["@keyword.coroutine"] = { fg = colors.pink, bold = true }, -- keywords related to coroutines (e.g., go in Go, async/await in Python)
    ["@keyword.function"] = { fg = colors.pink, bold = true }, -- keywords that define a function (e.g., func in Go, def in Python)
    ["@keyword.operator"] = { fg = colors.pink }, -- operators that are English words (e.g., and, or, not)
    ["@keyword.import"] = { link = "Keyword" }, -- keywords for including or exporting modules (e.g., import, from in Python)
    ["@keyword.type"] = { fg = colors.pink }, -- keywords describing namespaces and composite types (e.g., struct, enum)
    ["@keyword.modifier"] = { fg = colors.purple, bold = true }, -- keywords modifying other constructs (e.g., const, static, public)
    ["@keyword.repeat"] = { fg = colors.purple, bold = true }, -- keywords related to loops (e.g., for, while)
    ["@keyword.return"] = { fg = colors.purple, bold = true }, -- keywords like return and yield
    ["@keyword.debug"] = {}, -- keywords related to debugging
    ["@keyword.exception"] = {}, -- keywords releated to exceptions (e.g., throw, catch)

    ["@keyword.conditional"] = { link = "Conditional" }, -- keywords related to conditionals (e.g., if, else)
    ["@keyword.conditional.ternary"] = {}, -- ternary operator (e.g., ?, :)

    ["@keyword.directive"] = {}, -- various preprocessor directives and shebangs
    ["@keyword.directive.define"] = {}, -- preprocessor definition directives

    ["@punctuation.delimiter"] = { fg = colors.fg_dark }, -- delimiters (e.g., ;, ., ,)
    ["@punctuation.bracket"] = { fg = colors.fg_dark }, -- brackets (e.g., (), {}, [])
    ["@punctuation.special"] = { fg = colors.blue }, -- special symbols (e.g., {} in string interpolation)

    ["@comment"] = { link = "Comment" }, -- line and block comments
    ["@comment.documentation"] = { link = "Comment" }, -- comments documenting code
    ["@comment.error"] = {}, -- error-type comments (e.g., ERROR, FIXME, DEPRECATED)
    ["@comment.warning"] = {}, -- warning-type comments (e.g., WARNING, FIX, HACK)
    ["@comment.todo"] = {}, -- todo-type comments (e.g., TODO, WIP)
    ["@comment.note"] = {}, -- note-type comments (e.g., NOTE, INFO, XXX)

    ["@markup.strong"] = { bold = true }, -- bold text
    ["@markup.italic"] = { italic = true }, -- italic text
    ["@markup.strikethrough"] = { strikethrough = true }, -- struck-through text
    ["@markup.underline"] = { underline = true }, -- underlined text (only for literal underline markup!)

    ["@markup.heading"] = { bold = true }, -- headings, titles (including markers)
    ["@markup.heading.1"] = {}, -- top-level heading
    ["@markup.heading.2"] = {}, -- section heading
    ["@markup.heading.3"] = {}, -- subsection heading
    ["@markup.heading.4"] = {}, -- and so on
    ["@markup.heading.5"] = {}, -- and so forth
    ["@markup.heading.6"] = {}, -- six levels ought to be enough for anybody

    ["@markup.quote"] = { italic = true }, -- block quotes
    ["@markup.math"] = { italic = true }, -- math environments (e.g., $ ... $ in LaTeX)

    ["@markup.link"] = { italic = true }, -- text references, footnotes, citations, etc.
    ["@markup.link.label"] = { italic = true }, -- link, reference descriptions
    ["@markup.link.url"] = {}, -- URL-style links

    ["@markup.raw"] = {}, -- literal or verbatim text (e.g., inline code)
    ["@markup.raw.block"] = {}, -- literal or verbatim text as a stand-alone block

    ["@markup.list"] = {}, -- list markers
    ["@markup.list.checked"] = {}, -- checked todo-style list markers
    ["@markup.list.unchecked"] = {}, -- unchecked todo-style list markers

    ["@diff.plus"] = {}, -- added text (for diff files)
    ["@diff.minus"] = {}, -- deleted text (for diff files)
    ["@diff.delta"] = {}, -- changed text (for diff files)

    ["@tag"] = {}, -- XML-style tag names (e.g., in XML, HTML, etc.)
    ["@tag.builtin"] = {}, -- builtin tag names (e.g., HTML5 tags)
    ["@tag.attribute"] = {}, -- XML-style tag attributes
    ["@tag.delimiter"] = {}, -- XML-style tag delimiters

    -- other??
    ["@parameter"] = { fg = colors.blue }, -- For parameters of a function.
    -- ["@parameter.builtin"] = {}, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
    -- ['@label'] = { fg = colors.green500 }, -- For labels: `label:` in C and `:label:` in Lua.
    ["@namespace"] = { link = "Include" },
    ["@namespace.builtin"] = { fg = colors.pink }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@text"] = { fg = colors.blue },
    -- ['@text.literal.markdown'] = { fg = colors.red500 },
    -- ['@text.literal.markdown_inline'] = { fg = colors.yellow500, bg = colors.green900 },
    -- ['@text.reference'] = { fg = colors.blue500, underline = true },

    -- ['@text.todo.unchecked'] = { fg = colors.Foo }, -- For brackets and parens.
    -- ['@text.todo.checked'] = { fg = colors.Foo }, -- For brackets and parens.
    -- ['@text.warning'] = { fg = colors.yellow900, bg = colors.yellow500 },
    -- ['@text.danger'] = { fg = colors.red900, bg = colors.red500 },

    -- ['@text.diff.add'] = { link = 'DiffAdd' },
    -- ['@text.diff.delete'] = { link = 'DiffDelete' },

    -- tsx
    -- ['@tag.tsx'] = { fg = colors.green500 },
    -- ['@constructor.tsx'] = { fg = colors.blue500 },
    -- ['@tag.delimiter.tsx'] = { fg = colors.orange500 },
    --
}

M.lsp = {
    LspSignatureActiveParameter = { bg = colors.Foo, bold = true },
    LspCodeLens = { fg = colors.comment },
    LspInlayHint = { fg = colors.comment, bg = colors.Bar },
    LspInfoBorder = { fg = colors.fg, bg = colors.bg_float },

    -- ALEErrorSign = { fg = c.error },
    -- ALEWarningSign = { fg = c.warning },

    -- DapStoppedLine = { bg = util.darken(c.warning, 0.1) }, -- Used for "Warning" diagnostic virtual text

    -- LSP Semantic Token Groups (semantic highlighting)
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.type.interface"] = { fg = colors.Foo },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string.rust"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = colors.red },
    -- ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = colors.Foo },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    ["@lsp.type.regexp"] = { fg = colors.Foo },
    -- ["@lsp.typemod.variable.globalScope"] (global variables)
}

M.plugins = {
    -- treesitter-context
    TreesitterContext = { bg = colors.bg_float },

    -- hlsearchlens
    HlSearchLens = { link = "Search" },

    -- GitSigns
    GitSignsAdd = { fg = colors.green }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = colors.blue }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = colors.red }, -- diff mode: Deleted line |diff.txt|

    -- indent blankline
    IblIndent = { fg = colors.fg_comment, nocombine = true },
    IblScope = { fg = colors.purple, nocombine = true },

    -- nvim-cmp (see :h cmp-highlight)
    CmpItemAbbr = { fg = colors.fg_dark }, -- unmatched characters of each completion field
    CmpItemAbbrDeprecated = { fg = colors.fg_comment, strikethrough = true }, -- unmatchedd characters of each deprecated completion field
    CmpItemAbbrMatch = { fg = colors.purple }, -- matched characters of each completion field
    CmpItemAbbrMatchFuzzy = { fg = colors.blue }, -- fuzzy-matched characters of each completion field
    CmpItemKind = { fg = colors.Foo }, -- kind of the field (the symbol after each completion option)
    CmpItemMenu = { fg = colors.fg_dark }, -- menu field's higlight group (cmp source in brackets)

    -- telescope
    TelescopeNormal = { fg = colors.fg_dark, bg = colors.bg_float },
    -- TelescopeBorder = { fg = colors.Foo, bg = colors.bg_float },
    TelescopeMatching = { fg = colors.purple, bg = colors.bg_float },
    TelescopeSelection = { bg = colors.bg_visual },
    TelescopeSelectionCaret = { fg = colors.purple },
    TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_float },
    TelescopePromptCounter = { fg = colors.fg_dark, bg = colors.bg_float },

    -- NvimTree
    -- NvimTreeNormal = { fg = colors.fg_sidebar, bg = colors.bg_sidebar },
    -- -- NvimTreeWinSeparator = {
    -- --     fg = options.styles.sidebars == "transparent" and colors.border or colors.bg_sidebar,
    -- --     bg = colors.bg_sidebar,
    -- -- },
    -- NvimTreeNormalNC = { fg = colors.fg_sidebar, bg = colors.bg_sidebar },
    -- NvimTreeRootFolder = { fg = colors.blue, bold = true },
    -- NvimTreeGitDirty = { fg = colors.git.change },
    -- NvimTreeGitNew = { fg = colors.git.add },
    -- NvimTreeGitDeleted = { fg = colors.git.delete },
    -- NvimTreeOpenedFile = { bg = colors.bg_highlight },
    -- NvimTreeSpecialFile = { fg = colors.purple, underline = true },
    -- NvimTreeIndentMarker = { fg = colors.fg_gutter },
    -- NvimTreeImageFile = { fg = colors.fg_sidebar },
    -- NvimTreeSymlink = { fg = colors.blue },
    -- NvimTreeFolderIcon = { bg = colors.none, fg = colors.blue },
    -- NvimTreeFolderName = { fg = colors.fg_float },

    -- trouble
    TroubleText = { fg = colors.purple },
    TroubleCount = { fg = colors.purple, bg = colors.bg },
    TroubleNormal = { bg = colors.none },
    TroubleNormalNC = { bg = colors.none },

    -- todo-comments (not comprehensive)
    TodoFgTodo = { fg = colors.purple },
    TodoBgTodo = { fg = colors.bg, bg = colors.purple, bold = true },
    TodoFgNote = { fg = colors.fg_comment },
    TodoBgNote = { fg = colors.bg, bg = colors.fg_comment, bold = true },
    TodoFgWarn = { fg = colors.yellow },
    TodoBgWarn = { fg = colors.bg, bg = colors.yellow, bold = true },

    -- diff
    --     diffAdded = { fg = colors.git.add },
    --     diffRemoved = { fg = colors.git.delete },
    --     diffChanged = { fg = colors.git.change },
    --     diffOldFile = { fg = colors.yellow },
    --     diffNewFile = { fg = colors.orange },
    --     diffFile = { fg = colors.blue },
    --     diffLine = { fg = colors.comment },
    --     diffIndexLine = { fg = colors.magenta },

    -- Alpha
    --     AlphaShortcut = { fg = colors.orange },
    --     AlphaHeader = { fg = colors.blue },
    --     AlphaHeaderLabel = { fg = colors.orange },
    --     AlphaFooter = { fg = colors.blue1 },
    --     AlphaButtons = { fg = colors.cyan },

    -- LspSaga
    --     DiagnosticWarning = { link = 'DiagnosticWarn' },
    --     DiagnosticInformation = { link = 'DiagnosticInfo' },
    --
    --     LspFloatWinNormal = { bg = colors.bg_float },
    --     LspFloatWinBorder = { fg = colors.border_highlight },
    --     LspSagaBorderTitle = { fg = colors.cyan },
    --     LspSagaHoverBorder = { fg = colors.blue },
    --     LspSagaRenameBorder = { fg = colors.green },
    --     LspSagaDefPreviewBorder = { fg = colors.green },
    --     LspSagaCodeActionBorder = { fg = colors.blue },
    --     LspSagaFinderSelection = { fg = colors.bg_visual },
    --     LspSagaCodeActionTitle = { fg = colors.blue1 },
    --     LspSagaCodeActionContent = { fg = colors.purple },
    --     LspSagaSignatureHelpBorder = { fg = colors.red },
    --     ReferencesCount = { fg = colors.purple },
    --     DefinitionCount = { fg = colors.purple },
    --     DefinitionIcon = { fg = colors.blue },
    --     ReferencesIcon = { fg = colors.blue },
    --     TargetWord = { fg = colors.cyan },

    -- health
    healthError = { fg = colors.red },
    healthSuccess = { fg = colors.green },
    healthWarning = { fg = colors.yellow },

    -- lazy
    LazyProgressTodo = { fg = colors.gray1 },
    LazyProgressDone = { fg = colors.purple },
}

-- lsp symbol kind and completion kind highlights
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
    Field = "@field",
    File = "Normal",
    Folder = "Directory",
    Function = "@function",
    Interface = "@lsp.type.interface",
    Key = "@field",
    Keyword = "@lsp.type.keyword",
    Method = "@method",
    Module = "@namespace",
    Namespace = "@namespace",
    Null = "@constant.builtin",
    Number = "@number",
    Object = "@constant",
    Operator = "@operator",
    Package = "@namespace",
    Property = "@property",
    Reference = "@text.reference",
    Snippet = "Conceal",
    String = "@string",
    Struct = "@lsp.type.struct",
    Unit = "@lsp.type.struct",
    Text = "@text",
    TypeParameter = "@lsp.type.typeParameter",
    Variable = "@variable",
    Value = "@string",
}
local kind_groups = { "NavicIcons%s", "Aerial%sIcon", "CmpItemKind%s", "NoiceCompletionItemKind%s" }

for kind, link in pairs(kinds) do
    local base = "LspKind" .. kind
    M.plugins[base] = { link = link }
    for _, plugin in pairs(kind_groups) do
        M.plugins[plugin:format(kind)] = { link = base }
    end
end

return M
