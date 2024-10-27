local colors = require("winter-again.colors")
local config = require("winter-again.config")

local M = {}

---@param group string
---@param hl table
local function set_highlight(group, hl)
    vim.api.nvim_set_hl(0, group, hl)
end

function M._set_highlights()
    for _, hl_set in pairs(M.sets) do
        for group, hl in pairs(hl_set) do
            set_highlight(group, hl)
        end
    end
end

M.sets = {
    editor = {
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
        -- DiffAdd = {}, -- Diff mode: Added line |diff.txt|
        -- DiffChange = {}, -- Diff mode: Changed line |diff.txt|
        -- DiffDelete = {}, -- Diff mode: Deleted line |diff.txt|
        -- DiffText = {}, -- Diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer = { fg = colors.fg_dark }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        -- TermCursor = {}, -- Cursor in a focused terminal
        -- TermCursorNC = {}, -- Cursor in an unfocused terminal
        WinSeparator = { fg = colors.gray1, bg = config.opts.transparent and colors.none or colors.bg }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        Folded = { fg = colors.blue, bg = colors.cursor_line }, -- Line used for closed folds
        ErrorMsg = { fg = colors.red }, -- Error messages on the command line
        -- FoldColumn = {}, -- 'foldcolumn'
        -- SignColumn = {}, -- Column where |signs| are displayed
        IncSearch = { fg = colors.bg, bg = colors.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        VertSplit = { link = "WinSeparator" }, -- Column separating vertically split windows
        Substitute = { fg = colors.pink }, -- |:substitute| replacement text highlighting
        LineNr = { fg = colors.fg_dark }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
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
        FloatTitle = { fg = colors.fg, bg = colors.bg_float }, -- Title of floating windows.
        -- FloatFooter = {}, -- Footer of floating windows
        NormalNC = { bg = config.opts.transparent and colors.none or colors.bg },

        Pmenu = { fg = colors.fg, bg = colors.bg_float }, -- Popup menu: Normal item.
        PmenuSel = { bg = colors.bg_visual }, -- Popup menu: Selected item.
        -- PmenuKind = {}, -- Popup menu: Normal item "kind"
        -- PmenuKindSel = {}, -- Popup menu: Selected item "kind"
        -- PmenuExtra = {}, -- Popup menu: Normal item "extra text"
        -- PmenuExtraSel = {}, -- Popup menu: Selected item "extra text"
        PmenuSbar = { bg = colors.gray2 }, -- Popup menu: Scrollbar.
        PmenuThumb = { bg = colors.gray1 }, -- Popup menu: Thumb of the scrollbar. (current pos)
        PmenuMatch = { bold = true }, -- Popup menu: Matched text in normal item Combined with hl-Pmenu
        PmenuMatchSel = { bold = true }, -- Popup menu: Matched text in selected item Combined with hl-PmenuMatch and hl-PmenuSel

        Question = { fg = colors.blue }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine = {}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search = { fg = colors.yellow, bg = colors.gray2 }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out. Non-current search matches
        -- SnippetTabstop = {}, -- Tabstops in snippets
        -- SpecialKey = {}, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|

        SpellBad = { sp = colors.red, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap = { sp = colors.yellow, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
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
        -- WarningMsg = {}, -- Warning messages
        -- Whitespace = {}, -- "nbsp", "space", "tab" and "trail" in 'listchars'

        -- WildMenu = {}, -- Current match in 'wildmenu' completion

        WinBar = { fg = colors.fg_dark, bg = colors.bg }, -- Window bar of current window
        WinBarNC = { fg = colors.fg_dark, bg = colors.bg }, -- Window bar of not-current windows

        -- Menu = {}, -- Current font, background and foreground colors of the menus. Also used for the toolbar
        -- Scrollbar = {}, -- Current background and foreground of the main window's scrollbars.
        -- Tooltip = {}, -- Current font, background and foreground of the tooltips
    },
    syntax = {
        -- These groups are not listed as default vim groups,
        -- but they are suggested group names for syntax highlighting.
        Comment = { fg = colors.fg_comment, italic = true }, -- any comment
        Constant = { fg = colors.yellow }, -- (preferred) any constant
        String = { fg = colors.green }, --   a string constant: "this is a string"
        Character = { fg = colors.yellow }, --  a character constant: 'c', '\n'
        Number = { fg = colors.yellow, italic = false }, --   a number constant: 234, 0xff
        Boolean = { fg = colors.yellow, italic = true }, --  a boolean constant: TRUE, false
        Float = { fg = colors.yellow, italic = false }, --    a floating point constant: 2.3e10
        Identifier = { fg = colors.fg }, -- (preferred) any variable name
        Function = { fg = colors.purple, bold = true }, -- function name (also: methods for classes) (TS: @function)
        Statement = { fg = colors.purple, bold = true }, -- (preferred) any statement
        Conditional = { fg = colors.blue, bold = true }, --  if, then, else, endif, switch, etcolors.
        Repeat = { link = "Conditional" }, --   for, do, while, etcolors. (TS: @keyword.repeat)
        -- Label = { fg = colors.Magenta }, --    case, default, etcolors.
        Operator = { fg = colors.fg_dark }, -- "sizeof", "+", "*", etcolors. (also "==", "=", "->")
        Keyword = { fg = colors.purple, italic = false }, --  any other keyword like "local" in Lua and import in Python/Go
        Exception = { link = "Keyword" }, --  try, catch, throw
        PreProc = { fg = colors.purple }, -- (preferred) generic Preprocessor
        Include = { link = "PreProc" }, --  preprocessor #include
        Define = { link = "PreProc" }, --   preprocessor #define
        Macro = { link = "PreProc" }, --    same as Define
        PreCondit = { link = "PreProc" }, --  preprocessor #if, #else, #endif, etcolors.
        Type = { fg = colors.blue, italic = true }, -- (preferred) int, long, char, etcolors.
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
        -- ("Ignore", below, may be invisible...)
        -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|
        Error = { fg = colors.red }, -- (preferred) any erroneous construct
        -- Todo = { fg = colors.bg, bg = colors.purple }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

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
        -- Commented out groups should link up to their "preferred" group by default?
    },
    treesitter = {
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
        -- for standard captures
    },
    lsp = {
        -- These groups are for the native LSP client. Some other LSP clients may
        -- use these groups, or use their own. Consult your LSP client's
        -- documentation.
        LspReferenceText = { bg = colors.bg_visual }, -- used for highlighting "text" references (e.g., highlight symbol under cursor)
        LspReferenceRead = { link = "LspReferenceText" }, -- used for highlighting "read" references
        LspReferenceWrite = { link = "LspReferenceText" }, -- used for highlighting "write" references

        DiagnosticError = { fg = colors.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticWarn = { fg = colors.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticInfo = { fg = colors.blue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticHint = { fg = colors.fg_dark }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticUnnecessary = { fg = colors.fg_dark }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

        DiagnosticSignError = { fg = colors.red }, -- Used for "Error" signs in sign column
        DiagnosticSignWarn = { fg = colors.yellow }, -- Used for "Warn" signs in sign column
        DiagnosticSignInfo = { fg = colors.blu }, -- Used for "Info" signs in sign column
        DiagnosticSignHint = { fg = colors.fg_dark }, -- Used for "Hint" signs in sign column

        DiagnosticVirtualTextError = { fg = colors.red, bg = config.opts.transparent and colors.none or colors.bg }, -- Used for "Error" diagnostic virtual text
        DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = config.opts.transparent and colors.none or colors.bg }, -- Used for "Warning" diagnostic virtual text
        DiagnosticVirtualTextInfo = { fg = colors.blue, bg = config.opts.transparent and colors.none or colors.bg }, -- Used for "Information" diagnostic virtual text
        DiagnosticVirtualTextHint = { fg = colors.fg_dark, bg = config.opts.transparent and colors.none or colors.bg }, -- Used for "Hint" diagnostic virtual text

        DiagnosticUnderlineError = { undercurl = true, sp = colors.red }, -- Used to underline "Error" diagnostics
        DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow }, -- Used to underline "Warning" diagnostics
        DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue }, -- Used to underline "Information" diagnostics
        DiagnosticUnderlineHint = { undercurl = true, sp = colors.fg_dark }, -- Used to underline "Hint" diagnostics

        LspSignatureActiveParameter = { bg = colors.Lime, bold = true },
        LspCodeLens = { fg = colors.comment },
        LspInlayHint = { fg = colors.comment, bg = colors.Magenta },
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
        ["@lsp.type.interface"] = { link = "Structure" },
        ["@lsp.type.keyword"] = { link = "@keyword" },
        ["@lsp.type.namespace"] = { fg = colors.Lime },
        ["@lsp.type.number"] = { link = "@number" },
        ["@lsp.type.operator"] = { link = "@operator" },
        ["@lsp.type.parameter"] = { link = "@variable.parameter" },
        ["@lsp.type.property"] = { link = "@property" },
        ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
        ["@lsp.type.string.rust"] = { link = "@string" },
        ["@lsp.type.typeAlias"] = { link = "@type.definition" },
        ["@lsp.type.unresolvedReference"] = { link = "Error" },
        -- ["@lsp.type.variable"] = { link = "@variable" }, -- use treesitter styles for regular variables
        ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
        ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
        ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
        ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
        ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.operator.injected"] = { link = "@operator" },
        ["@lsp.typemod.string.injected"] = { link = "@string" },
        ["@lsp.typemod.type.defaultLibrary"] = { fg = colors.Lime },
        ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
        ["@lsp.typemod.variable.injected"] = { link = "@variable" },
        -- ["@lsp.type.regexp"] = { fg = colors.Red },
        -- ["@lsp.typemod.variable.globalScope"] (global variables)
    },
    plugins = {
        -- treesitter-context
        TreesitterContext = { bg = colors.bg_float },
        TreesitterContextLineNumber = { fg = colors.purple },

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
        CmpItemAbbrMatch = { fg = colors.purple, bold = true }, -- matched characters of each completion field
        CmpItemAbbrMatchFuzzy = { fg = colors.blue }, -- fuzzy-matched characters of each completion field
        CmpItemKind = { fg = colors.fg }, -- kind of the field (the symbol after each completion option)
        CmpItemMenu = { fg = colors.fg_dark }, -- menu field's higlight group (cmp source in brackets)

        -- telescope
        TelescopeNormal = { fg = colors.fg_dark, bg = colors.bg_float },
        -- TelescopeBorder = { fg = colors.Foo, bg = colors.bg_float },
        TelescopeMatching = { fg = colors.purple },
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
        TroubleNormal = { bg = config.opts.transparent and colors.none or colors.bg },
        TroubleNormalNC = { bg = config.opts.transparent and colors.none or colors.bg },

        -- todo-comments (not comprehensive)
        TodoFgTodo = { fg = colors.purple },
        TodoBgTodo = { fg = colors.bg, bg = colors.purple, bold = true },
        TodoFgNote = { fg = colors.gray0 },
        TodoBgNote = { fg = colors.bg, bg = colors.gray0, bold = true },
        TodoFgWarn = { fg = colors.yellow },
        TodoBgWarn = { fg = colors.bg, bg = colors.yellow, bold = true },
        TodoFgFix = { fg = colors.red },
        TodoBgFix = { fg = colors.bg, bg = colors.red, bold = true },

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
    },
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
    M.sets.plugins[base] = { link = link }
    for _, plugin in pairs(kind_groups) do
        M.sets.plugins[plugin:format(kind)] = { link = base }
    end
end

return M
