--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--
-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial
--
-- Note: Because this is lua file, vim will append your file to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--
-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`
local lush = require('lush')
local hsl = lush.hsl

local colors = {
    fg = "#EBDBB2",
    bg = "#282828",

    red = "#ea6962",
    green = "#a9b665",
    yellow = "#d8a657",
    blue = "#7daea3",
    purple = "#d3869b",
    aqua = "#89b482",
    orange = "#e78a4e",
    gray = "#a89984",

    gray_2 = "#928374",
    red_2 = "#c14a4a",
    green_2 = "#b8bb26",
    yellow_2 = "#fabd2f",
    blue_2 = "#83a598",
    purple_2 = "#d3869b",
    aqua_2 = "#8ec07c",
    orange_2 = "#fe8019",

    bh0_h = "#1d2021",
    bg0 = "#282828",
    bg1 = "#3c3836",
    bg2 = "#504945",
    bg3 = "#665c54",
    bg4 = "#7c6f64",

    bg0_s = "#32302f",
    fg4 = "#a89984",
    fg3 = "#bdae93",
    fg2 = "#d5c4a1",
    fg1 = "#ebdbb2",

    git = {delete = "#c14a4a", add = "#6f8352", change = "#b47109", bg_red = "#ae5858"},
    gitSigns = {delete = "#ae5858", add = "#6f8352", change = "#a96b2c"},
    lightspeed = {secondary = "#9ADDFF", primary = "#F00077"}
}

local theme = lush(function()
    return {
        -- The following are all the Neovim default highlight groups from the docs
        -- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
        -- probably style all of these at a bare minimum.
        --
        -- Referenced/linked groups must come before being referenced/lined,
        -- so the order shown ((mostly) alphabetical) is likely
        -- not the order you will end up with.
        --
        -- You can uncomment these and leave them empty to disable any
        -- styling for that group (meaning they mostly get styled as Normal)
        -- or leave them commented to apply vims default colouring or linking.

        Comment {fg = colors.bg3, gui = "italic"}, -- any comment
        ColorColumn {bg = colors.bg2}, -- used for the columns set with 'colorcolumn'
        Conceal {fg = colors.bg3}, -- placeholder characters substituted for concealed text (see 'conceallevel')
        -- Cursor       { }, -- character under the cursor
        -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
        CursorColumn {bg = colors.bg0}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine {bg = colors.bg0_s}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory {fg = colors.blue_2}, -- directory names (and other special names in listings)
        DiffAdd {fg = colors.git.add, bg = colors.bg}, -- diff mode: Added line |diff.txt|
        DiffChange {fg = colors.git.change}, -- diff mode: Changed line |diff.txt|
        DiffDelete {fg = colors.git.delete, bg = colors.bg}, -- diff mode: Deleted line |diff.txt|
        DiffText {fg = colors.bg, bg = colors.yellow}, -- diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer {fg = colors.bg}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
        -- TermCursor   { }, -- cursor in a focused terminal
        -- TermCursorNC { }, -- cursor in an unfocused terminal
        ErrorMsg {fg = colors.red_2}, -- error messages on the command line
        VertSplit {fg = colors.bg1}, -- the column separating vertically split windows
        Folded {fg = colors.bg3}, -- line used for closed folds
        -- FoldColumn   { }, -- 'foldcolumn'
        SignColumn {bg = colors.bg}, -- column where |signs| are displayed
        IncSearch {fg = colors.aqua, bg = colors.bg3}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        Substitute {fg = colors.bh0_h, bg = colors.red}, -- |:substitute| replacement text highlighting
        LineNr {fg = colors.bg2}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        CursorLineNr {fg = colors.bg4}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        MatchParen {fg = colors.blue, gui = "underline"}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg {fg = colors.fg, gui = "bold"}, -- 'showmode' message (e.g., "-- INSERT -- ")
        MsgArea {fg = colors.fg}, -- Area for messages and cmdline
        -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg {fg = colors.fg}, -- |more-prompt|
        NonText {fg = colors.bg3}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal {fg = colors.fg, bg = colors.bg}, -- normal text
        NormalFloat {fg = colors.fg, bg = colors.bg0}, -- Normal text in floating windows.
        FloatBorder {fg = colors.bg2}, --
        -- NormalNC     { }, -- normal text in non-current windows
        -- NormalSB =   { }, -- normal text in non-current windows
        Pmenu {fg = colors.fg, bg = colors.bg1}, -- Popup menu: normal item.
        PmenuSel {fg = colors.bg, bg = colors.blue}, -- Popup menu: selected item.
        PmenuSbar {bg = colors.bg3}, -- Popup menu: scrollbar.
        PmenuThumb {bg = colors.fg}, -- Popup menu: Thumb of the scrollbar.
        Question {fg = colors.purple}, -- |hit-enter| prompt and yes/no questions
        QuickFixLine {fg = colors.bg, bg = colors.yellow}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search {fg = colors.fg, bg = colors.bg2}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
        SpecialKey {fg = colors.bg3}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad {fg = colors.fg, gui = "underline"}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
        -- SpellCap {fg = colors.fg}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal {fg = colors.fg}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare {fg = colors.fg}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
        StatusLine {fg = colors.fg, bg = colors.bg2}, -- status line of current window
        StatusLineNC {fg = colors.bg3}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        TabLine {fg = colors.bg3}, -- tab pages line, not active tab page label
        TabLineFill {bg = colors.bg}, -- tab pages line, where there are no labels
        TabLineSel {fg = colors.fg}, -- tab pages line, active tab page label
        Title {fg = colors.fg}, -- titles for output from ":set all", ":autocmd" etc.
        Visual {bg = colors.bg2}, -- Visual mode selection
        VisualNOS {bg = colors.bg2}, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg {fg = colors.yellow}, -- warning messages
        -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        WildMenu {fg = colors.bg, bg = colors.blue}, -- current added nvim-comment configmatch in 'wildmenu' completion
        -- These groups are not listed as default vim groups,
        -- but they are defacto standard group names for syntax highlighting.
        -- commented out groups should chain up to their "preferred" group by
        -- default,
        -- Uncomment and edit if you want more specific syntax highlighting.
        Constant {fg = colors.orange}, -- (preferred) any constant
        String {fg = colors.green}, --   a string constant: "this is a string"
        Character {fg = colors.green}, --  a character constant: 'c', '\n'
        -- Number {fg = colors.yellow_2}, --   a number constant: 234, 0xff
        -- Boolean {fg = colors.orange}, --  a boolean constant: TRUE, false
        -- Float {fg = colors.yellow_2}, --    a floating point constant: 2.3e10
        Identifier {fg = colors.red}, -- (preferred) any variable name
        Function {fg = colors.blue}, -- function name (also: methods for classes)
        Statement {fg = colors.purple}, -- (preferred) any statement
        -- Conditional {fg = colors.fg}, --  if, then, else, endif, switch, etc.
        -- Repeat {fg = colors.purple}, --   for, do, while, etc.
        -- Label {fg = colors.blue_2}, --    case, default, etc.
        Operator {fg = colors.red}, -- "sizeof", "+", "*", etc.
        Keyword {fg = colors.aqua}, --  any other keyword
        -- Exception {fg = colors.purple}, --  try, catch, throw
        PreProc {fg = colors.aqua}, -- (preferred) generic Preprocessor
        -- Include {fg = colors.blue}, --  preprocessor #include
        -- Define {fg = colors.purple}, --   preprocessor #define
        -- Macro {fg = colors.purple}, --    same as Define
        -- PreCondit {fg = colors.purple}, --  preprocessor #if, #else, #endif, etc.
        Type {fg = colors.yellow}, -- (preferred) int, long, char, etc.
        -- StorageClass {fg = colors.blue}, -- static, register, volatile, etc.
        -- Structure {fg = colors.yellow}, --  struct, union, enum, etc.
        -- Typedef {fg = colors.yellow}, --  A typedef
        Special {fg = colors.red, gui = "italic"}, -- (preferred) any special symbol
        -- SpecialChar    { }, --  special character in a constant
        -- Tag            { }, --    you can use CTRL-] on this
        -- Delimiter      { }, --  character that needs attention
        SpecialComment {fg = colors.bg3}, -- special things inside a comment
        -- Debug          { }, --    debugging statements
        Underlined {gui = "underline"}, -- (preferred) text that stands out, HTML links
        Bold {gui = "bold"}, Italic {gui = "italic"}, -- ("Ignore", below, may be invisible...)
        -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|
        Error {fg = colors.red_2}, -- (preferred) any erroneous construct
        Todo {fg = colors.purple, gui = "italic"}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- These groups are for the native LSP client. Some other LSP clients may
        -- use these groups, or use their own. Consult your LSP client's
        -- documentation.

        LspReferenceText {bg = colors.bg2}, -- used for highlighting "text" references
        LspReferenceRead {bg = colors.bg2}, -- used for highlighting "read" references
        LspReferenceWrite {bg = colors.bg2}, -- used for highlighting "write" references
        LspDiagnosticsDefaultError {fg = colors.red}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        LspDiagnosticsDefaultWarning {fg = colors.yellow}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        LspDiagnosticsDefaultInformation {fg = colors.blue}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        LspDiagnosticsDefaultHint {fg = colors.aqua}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

        LspDiagnosticsVirtualTextError {fg = colors.red}, -- Used for "Error" diagnostic virtual text
        LspDiagnosticsVirtualTextWarning {fg = colors.yellow}, -- Used for "Warning" diagnostic virtual text
        LspDiagnosticsVirtualTextInformation {fg = colors.blue}, -- Used for "Information" diagnostic virtual text
        LspDiagnosticsVirtualTextHint {fg = colors.aqua}, -- Used for "Hint" diagnostic virtual text
        LspDiagnosticsUnderlineError {gui = "undercurl", sp = colors.red}, -- Used to underline "Error" diagnostics
        LspDiagnosticsUnderlineWarning {gui = "undercurl", sp = colors.yellow}, -- Used to underline "Warning" diagnostics
        LspDiagnosticsUnderlineInformation {gui = "undercurl", sp = colors.blue}, -- Used to underline "Information" diagnostics
        LspDiagnosticsUnderlineHint {gui = "undercurl", sp = colors.aqua}, -- Used to underline "Hint" diagnostics
        -- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
        -- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
        -- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
        -- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float
        -- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
        -- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
        -- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
        -- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column
        -- These groups are for the neovim tree-sitter highlights.
        -- As of writing, tree-sitter support is a WIP, group names may change.
        -- By default, most of these groups link to an appropriate Vim group,
        -- TSError -> Error for example, so you do not have to define these unless
        -- you explicitly want to support Treesitter's improved syntax awareness.
        -- TSAnnotation         { colors.yellow };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        -- TSAttribute          { colors.orange };    -- (unstable) TODO: docs
        -- TSBoolean            { colors.blue };    -- For booleans.
        TSCharacter {fg = colors.green}, -- For characters.
        -- TSComment            { };    -- For comment blocks.
        TSConstructor {fg = colors.aqua_2}, -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
        TSConditional {fg = colors.purple}, -- For keywords related to conditionnals.
        TSConstant {fg = colors.yellow}, -- For constants
        TSConstBuiltin {fg = colors.blue}, -- For constant that are built in the language: `nil` in Lua.
        -- TSConstMacro         { colors.orange };    -- For constants that are defined by macros: `NULL` in C.
        TSError {fg = colors.red_2}, -- For syntax/parser errors.
        TSException {fg = colors.purple}, -- For exception related keywords.
        TSField {fg = colors.aqua}, -- For fields.
        -- TSFloat              { colors.yellow };    -- For floats.
        TSFunction {fg = colors.yellow}, -- For function (calls and definitions).
        TSFuncBuiltin {fg = colors.yellow}, -- For builtin functions: `table.insert` in Lua.
        TSFuncMacro {fg = colors.yellow}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude {fg = colors.blue}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSKeyword {fg = colors.purple}, -- For keywords that don't fall in previous categories.
        TSKeywordFunction {fg = colors.purple}, -- For keywords used to define a fuction.
        TSLabel {fg = colors.blue}, -- For labels: `label:` in C and `:label:` in Lua.
        TSMethod {fg = colors.yellow}, -- For method calls and definitions.
        TSNamespace { fg = colors.red };    -- For identifiers referring to modules and namespaces.
        -- TSNone               { };    -- TODO: docs
        -- TSNote = {}
        TSNumber {fg = colors.purple}, -- For all numbers
        TSOperator {fg = colors.fg}, -- For any operator: `+`, but also `->` and `*` in C.
        TSParameter {fg = colors.red}, -- For parameters of a function.
        -- TSParameterReference {fg = colors.blue_2}, -- For references to parameters of a function.
        TSProperty {fg = colors.red}, -- Same as `TSField`.
        TSPunctDelimiter {fg = colors.red}, -- For delimiters ie: `.`
        TSPunctBracket {fg = colors.orange}, -- For brackets and parens.
        TSPunctSpecial {fg = colors.orange}, -- For special punctutation that does not fall in the catagories before.
        TSRepeat {fg = colors.purple}, -- For keywords related to loops.
        TSString {fg = colors.green}, -- For strings.
        -- TSStringRegex        { colors.orange };    -- For regexes.
        -- TSStringEscape       { colors.yellow_2 };    -- For escape characters within a string.
        -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
        TSType {fg = colors.yellow}, -- For types.
        TSTypeBuiltin {fg = colors.blue}, -- For builtin types.
        TSVariable {fg = colors.fg}, -- Any variable name that does not have another highlight.
        TSVariableBuiltin {fg = colors.blue}, -- Variable names that are defined by the languages, like `this` or `self`.

        TSTag {fg = colors.blue}, -- Tags like html tag names.
        TSTagDelimiter {fg = colors.bg3}, -- Tag delimiter like `<` `>` `/`
        TSText {fg = colors.yellow}, -- For strings considered text in a markup language.
        TSEmphasis {fg = colors.yellow}, -- For text to be represented with emphasis.
        TSUnderline {fg = colors.yellow}, -- For text to be represented with an underline.
        TSStrike {fg = colors.yellow}, -- For strikethrough text.
        TSTitle {fg = colors.yellow}, -- Text that is part of a title.
        TSLiteral {fg = colors.yellow}, -- Literal text.
        TSURI {fg = colors.yellow}, -- Any URI like a link or email.

        -- START which-key --
        WhichKey {fg = colors.yellow}, --
        WhichKeySeperator {fg = colors.fg}, --
        WhichKeyGroup {fg = colors.blue},--
        WhichKeyDesc {fg = colors.red}, --
        WhichKeyFloat {bg = colors.bg}, --
        WhichKeyValue {fg = colors.bg2},--
        -- END which-key --

        -- START nvimtree --
        NvimTreeNormal {fg = colors.fg}, --
        NvimTreeRootFolder {fg = colors.green, gui = "bold"}, --
        NvimTreeFolderName {fg = colors.blue_2}, --
        NvimTreeFolderIcon {fg = colors.blue_2},--
        NvimTreeEmptyFolderName {fg = colors.blue_2}, --
        NvimTreeOpenedFolderName {fg = colors.blue_2},--
        NvimTreeImageFile {fg = colors.purple}, --
        NvimTreeExecFile {fg = colors.green},--
        NvimTreeSpecialFile {fg = colors.yellow, gui = "underline"}, --
        NvimTreeSymlink {fg = colors.blue},--
        NvimTreeGitNew {fg = colors.git.add}, --
        NvimTreeGitDirty {fg = colors.git.change},--
        NvimTreeGitDeleted {fg = colors.git.delete}, --
        NvimTreeGitStaged {fg = colors.green},--
        NvimTreeGitMerge {fg = colors.green}, --
        NvimTreeGitRenamed {fg = colors.green},--
        NvimTreeIndentMarker {fg = colors.gray}, --
        NvimTreeLspDiagnostics {fg = colors.orange},--
        -- LspDiagnosticsError = { fg = c.error },
        -- LspDiagnosticsWarning = { fg = c.warning },
        -- LspDiagnosticsInformation = { fg = c.info },
        -- LspDiagnosticsHint = { fg = c.hint },
        -- END nvimtree --

        -- START dashboard
        DashboardShortCut {fg = colors.purple}, --
        DashboardHeader {fg = colors.red}, --
        DashboardCenter {fg = colors.blue},--
        DashboardFooter {fg = colors.yellow, gui = "italic"}, --
        -- END dashboard

        -- START hop
        HopNextKey {fg = colors.red_2, gui = "bold"}, --
        HopUnmatched {fg = colors.bg3},--
        -- END hop

        -- START easymotion
        EasyMotionTarget {fg = colors.red_2, gui = "bold"}, --
        EasyMotionTarget2First {fg = colors.red_2, gui = "bold"},--
        EasyMotionTarget2Second {fg = colors.red_2, gui = "bold"}, --
        EasyMotionShade {fg = colors.bg3}, --
        -- END easymotion

        -- START gitsigns
        GitSignsAdd {fg = colors.gitSigns.add}, -- diff mode: Added line |diff.txt|
        GitSignsChange {fg = colors.gitSigns.change}, -- diff mode: Changed line |diff.txt|
        GitSignsDelete {fg = colors.gitSigns.delete}, -- diff mode: Deleted line |diff.txt|
        -- END gitsigns

        -- START gitgutter
        GitGutterAdd {fg = colors.gitSigns.add}, -- diff mode: Added line |diff.txt|
        GitGutterChange {fg = colors.gitSigns.change}, -- diff mode: Changed line |diff.txt|
        GitGutterDelete {fg = colors.gitSigns.delete}, -- diff mode: Deleted line |diff.txt|
        -- END gitgutter

        --  START neogit
        NeogitBranch {fg = colors.blue}, --
        NeogitRemote {fg = colors.blue},--
        NeogitHunkHeader {bg = colors.bg1, fg = colors.fg},--
        NeogitHunkHeaderHighlight {bg = colors.bg2, fg = colors.purple}, --
        NeogitDiffContextHighlight {bg = colors.bg1},--
        NeogitDiffDeleteHighlight {fg = colors.git.delete, bg = colors.bg1},--
        NeogitDiffAddHighlight {fg = colors.git.add, bg = colors.bg1}, --
        --  END neogit

        --  START lightspeed.nvim
        -- LightspeedCursor {fg = c.black, bg = c.yellow},
        LightspeedLabel {fg = colors.lightspeed.primary, gui = "bold, underline"},
        LightspeedLabelOverlapped {fg = colors.lightspeed.primary, gui = "underline"},
        LightspeedLabelDistant {fg = colors.lightspeed.secondary, gui = "bold, underline"},
        LightspeedLabelDistantOverlapped {fg = colors.lightspeed.secondary, gui = "underline"},
        LightspeedShortcut {
            fg = colors.white,
            bg = colors.lightspeed.primary,
            gui = "bold, underline"
        },
        LightspeedShortcutOverlapped {fg = colors.white, bg = colors.lightspeed.primary, gui = "bold, underline"},
        LightspeedMaskedChar {fg = colors.red},
        LightspeedGreyWash {fg = colors.gray_2},
        LightspeedUnlabeledMatch {fg = colors.white, gui = "bold"},
        LightspeedOneCharMatch {fg = colors.white, bg = colors.lightspeed.primary, gui = "bold"},
        LightspeedUniqueChar {fg = colors.white, gui = "bold"},
        LightspeedPendingOpArea {fg = colors.white, bg = colors.lightspeed.primary},
        LightspeedPendingChangeOpArea {fg = colors.lightspeed.primary, gui = "italic, strikethrough"},
        --  END lightspeed.nvim

        --  START telescope
        TelescopeBorder { fg = colors.bg2 },
        TelescopePromptBorder { fg = colors.fg4 },
        TelescopeResultsBorder { fg = colors.bg2},
        TelescopeSelectionCaret { fg = colors.purple },
        TelescopeSelection { fg = colors.purple, bg = colors.bg2},
        TelescopeMatching { fg = colors.blue },
        --  END telescope

        --  START buffer
        BufferCurrent {fg = colors.fg, bg = colors.bg},
        BufferCurrentIndex {fg = colors.blue, bg = colors.bg},
        BufferCurrentMod {fg = colors.fg, bg = colors.bg},
        BufferCurrentSign {fg = colors.blue, bg = colors.bg},
        BufferCurrentTarget {fg = colors.red, bg = colors.bg, gui = "bold"},

        BufferVisible {fg = colors.fg, bg = colors.bg},
        BufferVisibleIndex {fg = colors.fg, bg = colors.bg},
        BufferVisibleMod {fg = colors.fg, bg = colors.bg},
        BufferVisibleSign {fg = colors.fg, bg = colors.bg},
        BufferVisibleTarget {fg = colors.red, bg = colors.bg, gui = "bold"},

        BufferInactive {fg = colors.gray_2, bg = colors.bg1},
        BufferInactiveIndex {fg = colors.gray_2, bg = colors.bg1},
        BufferInactiveMod {fg = colors.gray_2, bg = colors.bg1},
        BufferInactiveSign {fg = colors.gray_2, bg = colors.bg1},
        BufferInactiveTarget {fg = colors.red, bg = colors.bg_inactive, gui = "bold"}, --
        -- BufferTabpages: "blue bg_inactive b",
        -- BufferTabpageFill: "gutter_fg_grey bg_inactive",
        --  END buffer

        -- START markdown
        -- mkdHeading = { fg = c.orange, style = "bold" },
        -- mkdCode = { bg = c.bg2, fg = c.fg },
        mkdCodeDelimiter { bg = colors.bg2, fg = colors.fg },
        mkdCodeStart { fg = colors.yellow, gui = "bold" },
        mkdCodeEnd { fg = colors.yellow, gui = "bold" },
        -- mkdLink = { fg = c.blue, style = "underline" },

        markdownHeadingDelimiter { fg = colors.orange, gui = "bold" },
        markdownCode { fg = colors.yellow },
        markdownCodeBlock { fg = colors.yellow },
        markdownH1 { fg = colors.red, gui = "bold" },
        markdownH2 { fg = colors.blue, gui = "bold" },
        markdownLinkText { fg = colors.blue, gui = "underline" },

        -- VimwikiHeader1 {fg = colors.orange, gui = "bold"},
        -- VimwikiHeader2 {fg = colors.green, gui = "bold"},
        -- VimwikiHeader3 {fg = colors.blue, gui = "bold"},
        -- VimwikiHeader4 {fg = colors.aqua, gui = "bold"},
        -- VimwikiHeader5 {fg = colors.red, gui = "bold"},
        -- VimwikiHeader6 {fg = colors.purple, gui = "bold"},
        -- VimwikiLink {fg = colors.aqua},
        -- VimwikiHeaderChar {fg = colors.bg2},
        -- VimwikiHR {fg = colors.yellow},
        -- VimwikiList {fg = colors.orange},
        -- VimwikiTag {fg = colors.orange},
        -- VimwikiMarkers {fg = colors.bg2},
        -- END markdown

    }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
