local colors = require("winter-again.colors").colors
local config = require("winter-again.config")

-- builtin highlighting groups
-- see https://neovim.io/doc/user/syntax.html#highlight-groups
local M = {
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
    DiffText = { fg = colors.blue, bg = colors.bg_visual }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = colors.fg_comment }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor = { link = "Cursor" }, -- Cursor in a focused terminal
    -- TermCursorNC = {}, -- Cursor in an unfocused terminal
    WinSeparator = { fg = colors.gray2, bg = config.opts.transparent and colors.none or colors.bg }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    Folded = { fg = colors.blue, bg = colors.gray4 }, -- Line used for closed folds
    ErrorMsg = { fg = colors.red }, -- Error messages on the command line
    FoldColumn = { link = "LineNr" }, -- 'foldcolumn'
    SignColumn = { link = "LineNr" }, -- Column where |signs| are displayed
    IncSearch = { fg = colors.bg, bg = colors.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    VertSplit = { link = "WinSeparator" }, -- Column separating vertically split windows
    Substitute = { fg = colors.bg, bg = colors.red, bold = true }, -- |:substitute| replacement text highlighting
    LineNr = { fg = colors.gray1 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove = {}, -- Line number for when the relativenumber option is set, above the cursor line
    -- LineNrBelow = {}, -- Line number for when the relativenumber option is set, below the cursor line
    CursorLineNr = { fg = colors.purple, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold = {}, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign = {}, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen = { bg = colors.cursor_line, bold = true }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
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
    QuickFixLine = { fg = colors.purple }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { fg = colors.gray3, bg = colors.yellow, reverse = true }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out. Non-current search matches
    -- SnippetTabstop = {}, -- Tabstops in snippets
    -- SpecialKey = {}, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|

    SpellBad = { sp = colors.red, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = colors.yellow, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = colors.red, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = colors.red, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.

    -- StatusLine = {}, -- Status line of current window
    -- StatusLineNC = {}, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- StatusLineTerm = {}, -- Status line of terminal window
    -- StatusLineTermNC = {}, -- Status line of non-current terminal window

    -- TabLine = {}, -- Tab pages line, not active tab page label
    -- TabLineFill = {}, -- Tab pages line, where there are no labels
    -- TabLineSel = {}, -- Tab pages line, active tab page label
    -- Title = {}, -- Titles for output from ":set all", ":autocmd" etcolors.

    Visual = { bg = colors.cursor_line }, -- Visual mode selection
    -- VisualNOS = {}, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = colors.yellow }, -- Warning messages
    -- Whitespace = {}, -- "nbsp", "space", "tab" and "trail" in 'listchars'

    -- WildMenu = {}, -- Current match in 'wildmenu' completion

    WinBar = { fg = colors.fg_mid, bg = colors.none }, -- Window bar of current window
    WinBarNC = { fg = colors.fg_dark, bg = colors.none }, -- Window bar of not-current windows

    -- Menu = {}, -- Current font, background and foreground colors of the menus. Also used for the toolbar
    -- Scrollbar = {}, -- Current background and foreground of the main window's scrollbars.
    -- Tooltip = {}, -- Current font, background and foreground of the tooltips

    qfLineNr = { link = "LineNr" },
    qfFileName = { fg = colors.fg },

    -- ['helpCommand'] = { bg = colors.terminal_black, fg = colors.blue },
    -- debugPC = { bg = colors.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    -- debugBreakpoint = { bg = util.darken(colors.info, 0.1), fg = colors.info }, -- used for breakpoint colors in terminal-debug
    -- dosIniLabel = { link = '@property' },

    -- health
    healthError = { fg = colors.red },
    healthSuccess = { fg = colors.green },
    healthWarning = { fg = colors.yellow },
}

return M
