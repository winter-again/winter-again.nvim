local colors = require("winter-again.colors").colors
local config = require("winter-again.config")

local M = {}

---@param group string
---@param hl table
local function set_highlight(group, hl)
    vim.api.nvim_set_hl(0, group, hl)
end

-- TODO: allow full hl overrides
function M._set_highlights()
    local overrider = config.opts.hl_overrides
    if overrider ~= nil then
        overrider(M.sets, colors)
    end

    for group, hl in pairs(M.sets) do
        set_highlight(group, hl)
    end
end

M.sets = {
    -- builtin highlighting groups
    -- see https://neovim.io/doc/user/syntax.html#highlight-groups

    -- ColorColumn    { }, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
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
    DiffText = { fg = colors.bg, bg = colors.blue }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = colors.fg_comment }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor = {}, -- Cursor in a focused terminal
    -- TermCursorNC = {}, -- Cursor in an unfocused terminal
    WinSeparator = { fg = colors.gray2, bg = config.opts.transparent and colors.none or colors.bg }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    Folded = { fg = colors.blue, bg = colors.gray4 }, -- Line used for closed folds
    ErrorMsg = { fg = colors.red }, -- Error messages on the command line
    -- FoldColumn = {}, -- 'foldcolumn'
    -- SignColumn = {}, -- Column where |signs| are displayed
    IncSearch = { fg = colors.bg, bg = colors.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    VertSplit = { link = "WinSeparator" }, -- Column separating vertically split windows
    Substitute = { fg = colors.bg, bg = colors.red, bold = true }, -- |:substitute| replacement text highlighting
    LineNr = { fg = colors.gray1 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove = {}, -- Line number for when the relativenumber option is set, above the cursor line
    -- LineNrBelow = {}, -- Line number for when the relativenumber option is set, below the cursor line
    CursorLineNr = { fg = colors.purple, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold = {}, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign = {}, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen = { bold = true }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = colors.fg_dark }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea = {}, -- Area for messages and cmdline
    -- MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = colors.purple }, -- |more-prompt|
    NonText = { fg = colors.fg_comment }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = colors.fg, bg = config.opts.transparent and colors.none or colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg_float }, -- Normal text in floating windows.
    FloatBorder = { fg = colors.fg, bg = colors.bg_float }, -- Border of floating windows.
    FloatTitle = { fg = colors.fg_dark, bg = colors.bg_float }, -- Title of floating windows.
    -- FloatFooter = {}, -- Footer of floating windows
    NormalNC = { bg = config.opts.transparent and colors.none or colors.bg },

    Pmenu = { fg = colors.fg, bg = colors.bg_float }, -- Popup menu: Normal item.
    PmenuSel = { bg = colors.bg_visual }, -- Popup menu: Selected item.
    -- PmenuKind = {}, -- Popup menu: Normal item "kind"
    -- PmenuKindSel = {}, -- Popup menu: Selected item "kind"
    -- PmenuExtra = {}, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel = {}, -- Popup menu: Selected item "extra text"
    PmenuSbar = { bg = colors.gray4 }, -- Popup menu: Scrollbar.
    PmenuThumb = { bg = colors.gray2 }, -- Popup menu: Thumb of the scrollbar. (current pos)
    PmenuMatch = { bold = true }, -- Popup menu: Matched text in normal item Combined with hl-Pmenu
    PmenuMatchSel = { bold = true }, -- Popup menu: Matched text in selected item Combined with hl-PmenuMatch and hl-PmenuSel

    Question = { fg = colors.blue }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine = {}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { fg = colors.yellow, bg = colors.gray3 }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out. Non-current search matches
    -- SnippetTabstop = {}, -- Tabstops in snippets
    -- SpecialKey = {}, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|

    SpellBad = { sp = colors.red, underdotted = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = colors.yellow, underdotted = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal = {}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.

    StatusLine = { fg = colors.fg, bg = colors.bg }, -- Status line of current window
    StatusLineNC = { fg = colors.fg, bg = colors.bg }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- StatusLineTerm = {}, -- Status line of terminal window
    -- StatusLineTermNC = {}, -- Status line of non-current terminal window

    -- TabLine = {}, -- Tab pages line, not active tab page label
    -- TabLineFill = {}, -- Tab pages line, where there are no labels
    -- TabLineSel = {}, -- Tab pages line, active tab page label
    -- Title = {}, -- Titles for output from ":set all", ":autocmd" etcolors.

    Visual = { bg = colors.bg_visual, reverse = false }, -- Visual mode selection
    -- VisualNOS = {}, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = colors.yellow }, -- Warning messages
    -- Whitespace = {}, -- "nbsp", "space", "tab" and "trail" in 'listchars'

    -- WildMenu = {}, -- Current match in 'wildmenu' completion

    WinBar = { fg = colors.fg_mid, bg = colors.none }, -- Window bar of current window
    WinBarNC = { fg = colors.fg_dark, bg = colors.none }, -- Window bar of not-current windows

    -- Menu = {}, -- Current font, background and foreground colors of the menus. Also used for the toolbar
    -- Scrollbar = {}, -- Current background and foreground of the main window's scrollbars.
    -- Tooltip = {}, -- Current font, background and foreground of the tooltips

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

    -- These groups are not listed as default vim groups,
    -- but they are suggested group names for syntax highlighting.
    Comment = vim.tbl_deep_extend("force", { fg = colors.fg_comment }, config.opts.text_styles.comments), -- any comment
    Constant = { fg = colors.yellow }, -- (preferred) any constant
    String = { fg = colors.green }, --   a string constant: "this is a string"
    Character = { fg = colors.yellow }, --  a character constant: 'c', '\n'
    Number = vim.tbl_deep_extend("force", { fg = colors.orange }, config.opts.text_styles.numbers), --   a number constant: 234, 0xff
    Boolean = vim.tbl_deep_extend("force", { fg = colors.yellow }, config.opts.text_styles.booleans), --  a boolean constant: TRUE, false
    Float = vim.tbl_deep_extend("force", { fg = colors.orange }, config.opts.text_styles.floats), -- a floating point constant: 2.3e10
    Identifier = { fg = colors.fg }, -- (preferred) any variable name
    Function = vim.tbl_deep_extend("force", { fg = colors.purple }, config.opts.text_styles.functions), -- function name (also: methods for classes) (TS: @function)
    Statement = vim.tbl_deep_extend("force", { fg = colors.purple }, config.opts.text_styles.statements), -- (preferred) any statement
    Conditional = { fg = colors.blue, bold = true }, --  if, then, else, endif, switch, etcolors.
    Repeat = { link = "Conditional" }, --   for, do, while, etcolors. (TS: @keyword.repeat)
    -- Label = { fg = colors.Magenta }, --    case, default, etcolors.
    Operator = { fg = colors.fg_dark }, -- "sizeof", "+", "*", etcolors. (also "==", "=", "->")
    Keyword = vim.tbl_deep_extend("force", { fg = colors.purple }, config.opts.text_styles.keywords), --  any other keyword like "local" in Lua and import in Python/Go
    Exception = { link = "Keyword" }, --  try, catch, throw
    PreProc = { fg = colors.purple }, -- (preferred) generic Preprocessor
    Include = { link = "PreProc" }, --  preprocessor #include
    Define = { link = "PreProc" }, --   preprocessor #define
    Macro = { link = "PreProc" }, --    same as Define
    PreCondit = { link = "PreProc" }, --  preprocessor #if, #else, #endif, etcolors.
    -- todo: colors.blue or colors.cyan?
    Type = vim.tbl_deep_extend("force", { fg = colors.cyan }, config.opts.text_styles.types), -- (preferred) int, long, char, etcolors.
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

    qfLineNr = { fg = colors.fg_dark },
    qfFileName = { fg = colors.fg },

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

    -- see https://neovim.io/doc/user/treesitter#treesitter-highlight-groups
    ["@variable"] = { link = "Identifier" }, -- various variable names
    ["@variable.builtin"] = { fg = colors.red, italic = true }, -- built-in variable names (e.g., this, self)
    ["@variable.parameter"] = { fg = colors.fg }, -- parameters of a function
    ["@variable.parameter.reference"] = { link = "@variable.parameter" }, -- parameters of a function
    -- ["@variable.parameter.builtin"] = {}, -- special parameters (e.g., _, it)
    ["@variable.member"] = { fg = colors.fg }, -- object and struct fields.

    ["@constant"] = { link = "Constant" }, -- constant identifiers
    ["@constant.builtin"] = { link = "Constant" }, -- built-in constant values
    ["@constant.macro"] = { link = "Constant" }, -- constants defined by the preprocessor

    ["@module"] = { fg = colors.blue, bold = true }, -- module or namespaces (like main in package main in Go)
    ["@module.builtin"] = { link = "@variable.builtin" }, -- built-in modules or namespaces
    ["@label"] = { link = "Label" }, -- GOTO and other labels (e.g., label: in C), including heredoc labels
    ["@label.markdown"] = { fg = colors.fg_dark }, -- GOTO and other labels (e.g., label: in C), including heredoc labels

    ["@string"] = { link = "String" }, -- string literals
    ["@string.documentation"] = { link = "String" }, -- string documenting code (e.g., Python docstrings)
    ["@string.regexp"] = { link = "Character" }, -- regular expressions
    ["@string.escape"] = { link = "Character" }, -- escape sequences
    ["@string.special"] = { link = "Character" }, -- other special strings (e.g., dates)
    ["@string.special.symbol"] = { link = "Character" }, -- symbols or atoms
    ["@string.special.path"] = { italic = true }, -- filenames
    ["@string.special.url"] = { link = "@string.special.path" }, -- URIs (e.g., hyperlinks)

    ["@character"] = { link = "Character" }, -- character literals
    ["@character.special"] = { link = "Character" }, -- special characters (e.g., wildcards)

    ["@boolean"] = { link = "Boolean" }, -- boolean literals
    ["@number"] = { link = "Number" }, -- numeric literals
    ["@number.float"] = { link = "Float" }, -- floating-point number literals

    ["@type"] = { link = "Type" }, -- type or class definitions and annotations
    ["@type.builtin"] = { link = "Type" }, -- built-in types
    ["@type.definition"] = { link = "Type" }, -- identifiers in type definitions (e.g., typedef <type> <identifier> in C)
    ["@type.qualifier"] = { link = "Type" }, -- identifiers in type definitions (e.g., typedef <type> <identifier> in C)

    ["@attribute"] = { link = "Constant" }, -- attribute annotations (e.g., Python decorators, Rust lifetimes)
    ["@attribute.builtin"] = { link = "@variable.builtin" }, -- built-in annotations (e.g., @property in Python)
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
    ["@keyword.operator"] = { fg = colors.blue, italic = false }, -- operators that are English words (e.g., and, or, not)
    ["@keyword.import"] = { link = "Keyword" }, -- keywords for including or exporting modules (e.g., import, from in Python)
    ["@keyword.type"] = { fg = colors.pink }, -- keywords describing namespaces and composite types (e.g., struct, enum)
    ["@keyword.modifier"] = { fg = colors.purple, bold = true }, -- keywords modifying other constructs (e.g., const, static, public)
    ["@keyword.repeat"] = { link = "Repeat" }, -- keywords related to loops (e.g., for, while)
    ["@keyword.return"] = { fg = colors.purple, bold = true }, -- keywords like return and yield
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

    ["@markup.strong"] = { bold = true }, -- bold text
    ["@markup.italic"] = { italic = true }, -- italic text
    ["@markup.strikethrough"] = { strikethrough = true }, -- struck-through text
    ["@markup.underline"] = { underline = true }, -- underlined text (only for literal underline markup!)
    ["@markup.heading"] = { bold = true }, -- headings, titles (including markers)
    -- ["@markup.heading.1"] = {}, -- top-level heading
    -- ["@markup.heading.2"] = {}, -- section heading
    -- ["@markup.heading.3"] = {}, -- subsection heading
    -- ["@markup.heading.4"] = {}, -- and so on
    -- ["@markup.heading.5"] = {}, -- and so forth
    -- ["@markup.heading.6"] = {}, -- six levels ought to be enough for anybody
    ["@markup.quote"] = { italic = true }, -- block quotes
    ["@markup.math"] = { italic = true }, -- math environments (e.g., $ ... $ in LaTeX)
    ["@markup.link"] = { italic = true }, -- text references, footnotes, citations, etc.
    ["@markup.link.label"] = { link = "@markup.linnk" }, -- link, reference descriptions
    ["@markup.link.url"] = { link = "@string.special.url" }, -- URL-style links
    -- ["@markup.raw"] = {}, -- literal or verbatim text (e.g., inline code)
    -- ["@markup.raw.block"] = {}, -- literal or verbatim text as a stand-alone block
    ["@markup.list"] = { fg = colors.fg }, -- list markers
    ["@markup.list.checked"] = { fg = colors.fg_dark }, -- checked todo-style list markers
    ["@markup.list.unchecked"] = { fg = colors.fg }, -- unchecked todo-style list markers

    -- ["@diff.plus"] = {}, -- added text (for diff files)
    -- ["@diff.minus"] = {}, -- deleted text (for diff files)
    -- ["@diff.delta"] = {}, -- changed text (for diff files)

    ["@tag"] = { link = "Keyword" }, -- XML-style tag names (e.g., in XML, HTML, etc.)
    ["@tag.builtin"] = { fg = colors.red }, -- builtin tag names (e.g., HTML5 tags)
    ["@tag.attribute"] = { link = "Function" }, -- XML-style tag attributes
    ["@tag.delimiter"] = { link = "Delimiter" }, -- XML-style tag delimiters

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
    -- ["@lsp.type.string.rust"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { link = "Error" },
    ["@lsp.type.variable"] = { link = "@variable" },
    -- ["@lsp.type.variable"] = { link = "Constant" },

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

    -- health
    healthError = { fg = colors.red },
    healthSuccess = { fg = colors.green },
    healthWarning = { fg = colors.yellow },

    -- lazy
    LazyProgressTodo = { fg = colors.gray1 },
    LazyProgressDone = { fg = colors.purple },
    LazyInfo = { fg = colors.purple },
    LazyH1 = { fg = colors.bg, bg = colors.purple },

    -- treesitter-context
    TreesitterContext = { link = "Folded" },
    TreesitterContextLineNumber = { fg = colors.gray0, bold = true },

    -- hlsearchlens
    HlSearchLens = { link = "Search" },

    -- gitsigns
    -- todo: change color shouldn't be blue?
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.blue },
    GitSignsDelete = { fg = colors.red },
    GitSignsAddPreview = { fg = colors.green, bg = colors.bg_float },
    GitSignsChangePreview = { fg = colors.blue, bg = colors.bg_float },
    GitSignsDeletePreview = { fg = colors.red, bg = colors.gray2 },

    -- indent-blankline
    IblIndent = { fg = colors.fg_comment },
    IblScope = { fg = colors.purple },

    -- nvim-cmp (see :h cmp-highlight)
    CmpItemAbbr = { fg = colors.fg_dark }, -- unmatched characters of each completion field
    CmpItemAbbrDeprecated = { fg = colors.fg_comment, strikethrough = true }, -- unmatchedd characters of each deprecated completion field
    CmpItemAbbrMatch = { fg = colors.purple, bold = true }, -- matched characters of each completion field
    CmpItemAbbrMatchFuzzy = { fg = colors.blue }, -- fuzzy-matched characters of each completion field
    CmpItemKind = { fg = colors.fg }, -- kind of the field (the symbol after each completion option)
    CmpItemMenu = { fg = colors.fg_dark }, -- menu field's higlight group (cmp source in brackets)

    -- lsp saga
    -- SagaTitle = { fg = colors.Magenta },

    -- telescope (see: https://github.com/nvim-telescope/telescope.nvim/blob/85922dde3767e01d42a08e750a773effbffaea3e/plugin/telescope.lua)
    -- selected items within picker
    TelescopeSelection = { link = "Visual" },
    TelescopeSelectionCaret = { link = "TelescopeSelection" },
    TelescopeMultiSelection = { fg = colors.green },
    TelescopeMultiIcon = { fg = colors.green },

    -- floating windows
    TelescopeNormal = { fg = colors.fg_dark, bg = colors.bg_float },
    TelescopePreviewNormal = { bg = colors.bg },
    TelescopePromptNormal = { bg = colors.bg },
    TelescopeResultsNormal = { link = "TelescopeNormal" },

    -- borders
    TelescopeBorder = { bg = colors.bg_float },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopePreviewNormal" },

    -- titles
    TelescopeTitle = { fg = colors.bg, bg = colors.purple },
    TelescopePromptTitle = { link = "TelescopeTitle" },
    TelescopeResultsTitle = {},
    TelescopePreviewTitle = { fg = colors.bg, bg = colors.blue },

    TelescopePromptCounter = { fg = colors.blue, bg = colors.bg }, -- result counter
    TelescopeMatching = { fg = colors.purple }, -- matched chars

    -- fzf-lua
    FzfLuaNormal = { fg = colors.fg_dark, bg = colors.bg_float },
    -- FzfLuaCursorLine = { link = "CursorLine" },
    -- FzfLuaCursorLineNr = { link = "CursorLineNr" },

    -- nvim-tree
    NvimTreeNormal = { fg = colors.fg_dark, bg = colors.bg_float },
    NvimTreeNormalFloat = { fg = colors.fg_dark, bg = colors.bg_float },
    NvimTreeNormalNC = { fg = colors.fg_dark, bg = colors.bg_float },
    NvimTreeIndentMarker = { fg = colors.fg_comment },
    NvimTreeGitDirty = { fg = colors.blue },
    NvimTreeGitNew = { fg = colors.green },
    NvimTreeGitDeleted = { fg = colors.red },
    NvimTreeGitIgnored = { fg = colors.fg_dark },
    NvimTreeFolderIcon = { fg = colors.purple },
    NvimTreeWinSeparator = { fg = colors.fg_dark, bg = colors.bg_float },
    NvimTreeRootFolder = { fg = colors.fg_dark, bold = true },
    NvimTreeSpecialFile = { fg = colors.fg_dark, underline = true },
    NvimTreeSymlink = { fg = colors.green },
    NvimTreeOpenedFile = { fg = colors.blue },
    NvimTreeOpenedFolderName = { fg = colors.blue },
    NvimTreeImageFile = { fg = colors.yellow },
    NvimTreeFolderName = { fg = colors.fg_dark },
    NvimTreeWindowPicker = { fg = colors.bg, bg = colors.blue },

    -- trouble
    TroubleText = { fg = colors.purple },
    TroubleCount = { fg = colors.bg, bg = colors.purple },
    TroubleNormal = { bg = config.opts.transparent and colors.none or colors.bg },
    TroubleNormalNC = { bg = config.opts.transparent and colors.none or colors.bg },

    -- todo-comments (not comprehensive)
    TodoFgTodo = { fg = colors.purple },
    TodoBgTodo = { fg = colors.bg, bg = colors.purple, bold = true },
    TodoFgNote = { fg = colors.gray1 },
    TodoBgNote = { fg = colors.bg, bg = colors.gray1, bold = true },
    TodoFgWarn = { fg = colors.yellow },
    TodoBgWarn = { fg = colors.bg, bg = colors.yellow, bold = true },
    TodoFgFix = { fg = colors.red },
    TodoBgFix = { fg = colors.bg, bg = colors.red, bold = true },

    -- alpha
    -- AlphaHeader = { fg = colors.Magenta },
    -- AlphaHeaderLabel = { fg = colors.Red },
    -- AlphaShortcut = { fg = colors.Lime },
    -- AlphaFooter = { fg = colors.Magenta },
    -- AlphaButtons = { fg = colors.Lime },

    -- mason
    MasonNormal = { fg = colors.fg, bg = colors.bg_float },
    MasonHeader = { fg = colors.bg, bg = colors.purple },
    MasonHighlight = { fg = colors.green },
    MasonHighlightBlock = { fg = colors.green },
    MasonHighlightBlockBold = { fg = colors.bg, bg = colors.purple },
    MasonHighlightSecondary = { fg = colors.green },
    MasonHighlightBlockSecondary = { fg = colors.bg, bg = colors.blue },
    MasonHighlightBlockBoldSecondary = { fg = colors.bg, bg = colors.blue },
    MasonHeaderSecondary = { fg = colors.bg, bg = colors.blue },
    MasonMuted = { fg = colors.gray1, bg = colors.bg_float },
    MasonMutedBlock = { fg = colors.gray1, bg = colors.gray3 },

    -- incline
    InclineNormal = { fg = colors.fg_mid, bg = colors.bg, italic = true },
    InclineNormalNC = { fg = colors.fg_dark, bg = colors.bg, italic = true },
}

-- todo: improve
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
    M.sets[base] = { link = link }
    for _, plugin in pairs(kind_groups) do
        M.sets[plugin:format(kind)] = { link = base }
    end
end

return M
