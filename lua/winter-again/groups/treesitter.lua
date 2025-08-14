local colors = require("winter-again.colors").colors

-- see https://neovim.io/doc/user/treesitter#treesitter-highlight-groups
local M = {
    ["@variable"] = { link = "Identifier" }, -- various variable names (didn't match anything else)
    ["@variable.builtin"] = { fg = colors.moon, italic = true }, -- built-in variable names (e.g., this, self)
    ["@variable.parameter"] = { fg = colors.fg }, -- parameters of a function
    ["@variable.parameter.builtin"] = { fg = colors.fg }, -- special parameters (e.g., _, it)
    ["@variable.member"] = { fg = colors.blue }, -- object and struct fields.

    ["@constant"] = { link = "Constant" }, -- constant identifiers
    ["@constant.builtin"] = { fg = colors.red, italic = true }, -- built-in constant values
    ["@constant.macro"] = { link = "Constant" }, -- constants defined by the preprocessor

    ["@module"] = { fg = colors.blue, bold = true }, -- module or namespaces (like main in package main in Go)
    ["@module.builtin"] = { link = "@variable.builtin" }, -- built-in modules or namespaces
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

    -- req custom queries in queries/markdown/highlights.scm
    -- ["@markup.heading"] = {},
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
    -- ["@markup.list"] = { fg = colors.fg }, -- list markers
    ["@markup.list.checked"] = { fg = colors.fg_dark, strikethrough = true }, -- checked todo-style list markers -> top item only
    ["@markup.list.checked_item"] = { fg = colors.fg_dark }, -- any nested text below
    -- ["@markup.list.unchecked"] = {}, -- unchecked todo-style list markers

    ["@markup.quote"] = { fg = colors.green, italic = true }, -- block quotes
    ["@markup.math"] = { fg = colors.yellow }, -- math environments (e.g., $ ... $ in LaTeX)
    ["@markup.link"] = { fg = colors.purple, italic = true }, -- text references, footnotes, citations, etc.
    ["@markup.link.label"] = { fg = colors.purple, underline = true }, -- link, reference descriptions (the link label for markdown links)
    ["@markup.link.url"] = { fg = colors.purple, italic = true }, -- URL-style links (the actual url for markdown link)
    ["@markup.raw"] = { fg = colors.blue, bg = colors.bg_float }, -- literal or verbatim text (e.g., inline code)
    -- ["@markup.raw.block"] = {}, -- literal or verbatim text as a stand-alone block
    -- req custom queries queries/markdown_inline/highlights.scm
    ["@markup.wikilink.label"] = { fg = colors.green },
    ["@markup.wikilink.url"] = { fg = colors.green, italic = true },

    -- custom capture for markdown fenced code blocks
    ["@codeblock.delim"] = { link = "@punctutation.delimiter" },
    ["@codeblock.lang"] = { fg = colors.purple, italic = true },

    ["@diff.plus"] = { link = "DiffAdd" }, -- added text (for diff files)
    ["@diff.minus"] = { link = "DiffDelete" }, -- deleted text (for diff files)
    ["@diff.delta"] = { link = "DiffChange" }, -- changed text (for diff files)

    ["@tag"] = { link = "Keyword" }, -- XML-style tag names (e.g., in XML, HTML, etc.)
    ["@tag.builtin"] = { fg = colors.red }, -- builtin tag names (e.g., HTML5 tags)
    ["@tag.attribute"] = { link = "Function" }, -- XML-style tag attributes
    ["@tag.delimiter"] = { link = "Delimiter" }, -- XML-style tag delimiters
}

return M
