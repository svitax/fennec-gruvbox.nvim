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

local util = {}

util.bg = "#000000"
util.fg = "#ffffff"

local function hexToRgb(hex_str)
  local hex = "[abcdef0-9][abcdef0-9]"
  local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
  hex_str = string.lower(hex_str)

  assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

  local r, g, b = string.match(hex_str, pat)
  return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

function util.blend(fg, bg, alpha)
  bg = hexToRgb(bg)
  fg = hexToRgb(fg)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

function util.darken(hex, amount, bg) return util.blend(hex, bg or util.bg, math.abs(amount)) end
function util.lighten(hex, amount, fg) return util.blend(hex, fg or util.fg, math.abs(amount)) end

local c = {
    white = "#c7b89d",
    darker_black = "#232323",
    black = "#282828", --  nvim bg
    black2 = "#2e2e2e",
    one_bg = "#353535",
    one_bg2 = "#3f3f3f",
    one_bg3 = "#444444",
    grey = "#46494a",
    grey_fg = "#5d6061",
    grey_fg2 = "#5b5e5f",
    light_grey = "#585b5c",
    red = "#ec6b64",
    baby_pink = "#ce8196",
    pink = "#ff75a0",
    line = "#2c2f30", -- for lines like vertsplit
    green = "#89b482",
    vibrant_green = "#a9b665",
    nord_blue = "#6f8faf",
    blue = "#6d8dad",
    yellow = "#d6b676",
    sun = "#d1b171",
    purple = "#b4bbc8",
    dark_purple = "#cc7f94",
    teal = "#749689",
    orange = "#e78a4e",
    cyan = "#82b3a8",
    statusline_bg = "#2c2c2c",
    lightbg = "#353535",
    lightbg2 = "#303030",
    pmenu_bg = "#89b482",
    folder_bg = "#6d8dad",
}

local b = {
    base00 = "#222526",
    base01 = "#2c2f30",
    base02 = "#36393a",
    base03 = "#404344",
    base04 = "#d4be98",
    base05 = "#c0b196",
    base06 = "#c3b499",
    base07 = "#c7b89d",
    base08 = "#ec6b64",
    base09 = "#e78a4e",
    base0A = "#e0c080",
    base0B = "#a9b665",
    base0C = "#86b17f",
    base0D = "#7daea3",
    base0E = "#d3869b",
    base0F = "#d65d0e",
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

        Normal {fg = b.base05, bg = b.base00}, -- normal text
        Bold {gui = "bold"}, --
        Debug {fg = b.base08 }, -- debugging statements
        Directory {fg = b.base0D}, -- directory names (and other special names in listings)
        Error {fg = b.base00, bg = b.base08}, -- (preferred) any erroneous construct
        ErrorMsg {fg = b.base08, bg = b.base00}, -- error messages on the command line
        Exception {fg = b.base08}, -- try, catch, throw
        FoldColumn {fg =  b.base0C, bg = b.base01 }, -- 'foldcolumn'
        Folded {fg = b.base03, bg = b.base01}, -- line used for closed folds
        IncSearch {fg = b.base01, bg = b.base0A}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
        Italic {gui = "italic"}, -- ("Ignore", below, may be invisible...)
        Macro {fg = b.base08}, -- same as Define
        MatchParen {bg = c.light_grey, gui = "underline"}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg {fg = b.base0B, gui = "bold"}, -- 'showmode' message (e.g., "-- INSERT -- ")
        MoreMsg {fg = b.base0B}, -- |more-prompt|
        Question {fg = b.base0D}, -- |hit-enter| prompt and yes/no questions
        Search {bg = b.base02}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
        Substitute {fg = b.base01, bg = b.base0A}, -- |:substitute| replacement text highlighting
        SpecialKey {fg = b.base03}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
        TooLong {fg = b.base08},
        Underlined {gui = "underline"}, -- (preferred) text that stands out, HTML links
        Visual {bg = b.base02}, -- Visual mode selection
        VisualNOS {fg = b.base08}, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg {fg = b.base0B}, -- warning messages
        WildMenu {fg = b.base08, bg = b.base0A}, -- current added nvim-comment configmatch in 'wildmenu' completion
        Title {fg = b.base0D}, -- titles for output from ":set all", ":autocmd" etc.
        Conceal {fg = b.base0D, bg = b.base00}, -- placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor {fg = b.base00, bg = b.base05}, -- character under the cursor
        NonText {fg = b.base03}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        LineNr {fg = c.grey}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        SignColumn {bg = b.base00}, -- column where |signs| are displayed
        StatusLine {fg = b.base04}, -- status line of current window
        StatusLineNC {fg = c.one_bg3, gui = "underline"}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        VertSplit {fg = c.one_bg2}, -- the column separating vertically split windows
        ColorColumn {bg = b.base01}, -- used for the columns set with 'colorcolumn'
        CursorColumn {bg = b.base01}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine {bg = b.base01}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
        CursorLineNr {fg = c.white}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        QuickFixLine {bg = b.base01}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Pmenu {fg = b.base05, bg = c.one_bg}, -- Popup menu: normal item.
        PmenuSel {fg = b.base01, bg = c.pmenu_bg}, -- Popup menu: selected item.
        TabLine {fg = b.base03, bg = b.base01}, -- tab pages line, not active tab page label
        TabLineFill {fg = b.base03, bg = b.base01}, -- tab pages line, where there are no labels
        TabLineSel {fg = b.base0B, bg = b.base01}, -- tab pages line, active tab page label

        EndOfBuffer {fg = c.black}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
        FloatBorder {fg = c.blue}, --
        NormalFloat {bg = b.base00}, -- Normal text in floating windows.
        PmenuSbar {bg = c.one_bg2}, -- Popup menu: scrollbar.
        PmenuThumb {bg = c.nord_blue}, -- Popup menu: Thumb of the scrollbar.
        NvimInternalError {fg = c.red},

        Boolean {fg = b.base09}, --  a boolean constant: TRUE, false
        Character {fg = b.base08}, --  a character constant: 'c', '\n'
        Comment {fg = c.grey_fg, gui = "italic"}, -- any comment
        Conditional {fg = b.base0E}, --  if, then, else, endif, switch, etc.
        Constant {fg = b.base09}, -- (preferred) any constant
        Define {fg = b.base0E}, --   preprocessor #define
        Delimiter {fg = b.base0F }, --  character that needs attention
        Float {fg = b.base09}, --    a floating point constant: 2.3e10
        Function {fg = b.base0D}, -- function name (also: methods for classes)
        Identifier {fg = b.base08}, -- (preferred) any variable name
        Include {fg = b.base0D}, --  preprocessor #include
        Keyword {fg = b.base0E}, --  any other keyword
        Label {fg = b.base0A}, --    case, default, etc.
        Number {fg = b.base09}, --   a number constant: 234, 0xff
        Operator {fg = b.base05}, -- "sizeof", "+", "*", etc.
        PreProc {fg = b.base0A}, -- (preferred) generic Preprocessor
        Repeat {fg = b.base0A}, --   for, do, while, etc.
        Special {fg = b.base0C}, -- (preferred) any special symbol
        SpecialChar {fg = b.base0F}, --  special character in a constant
        Statement {fg = b.base08}, -- (preferred) any statement
        StorageClass {fg = b.base0A}, -- static, register, volatile, etc.
        String {fg = b.base0B}, --   a string constant: "this is a string"
        Structure {fg = b.base0E}, --  struct, union, enum, etc.
        Tag {fg = b.base0A}, --    you can use CTRL-] on this
        Todo {fg = b.base0A, bg = b.base01, gui = "italic"}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        Type {fg = b.base0A}, -- (preferred) int, long, char, etc.
        Typedef {fg = b.base0A}, --  A typedef

        -- PreCondit {fg = colors.purple}, --  preprocessor #if, #else, #endif, etc.
        -- SpecialComment {fg = c.bg3}, -- special things inside a comment
        -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|
        -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|

        DiffAdd {fg = c.nord_blue, bg = b.base00}, -- diff mode: Added line |diff.txt|
        DiffModified {fg = c.nord_blue}, --
        DiffDelete {fg = b.base08, bg = b.base00 }, -- diff mode: Deleted line |diff.txt|
        DiffText {fg = b.base0D, bg = b.base00 }, -- diff mode: Changed text within a changed line |diff.txt|
        DiffAdded {fg = b.base0B, bg = b.base00}, --
        DiffChange {fg = c.nord_blue, bg = b.base00}, -- diff mode: Changed line |diff.txt|
        DiffFile {fg = b.base08, bg = b.base00}, --
        DiffNewFile {fg = b.base0B, bg = b.base00}, --
        DiffLine {fg = b.base0D, bg = b.base00}, --
        DiffRemoved {fg = b.base08, bg = b.base00}, --

        -- START spelling
        SpellBad { gui = "undercurl", sp = b.base08}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
        SpellLocal { gui = "undercurl", sp = b.base0C}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellCap { gui = "undercurl", sp = b.base0D}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellRare { gui = "undercurl", sp = b.base0E}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
        -- END spelling

        -- START cmp custom menu
        CmpItemAbbr {fg = c.white},
        CmpItemAbbrDeprecated {fg = c.white},
        CmpItemMenu {fg = c.white},
        CmpItemKindText {fg = c.white},
        CmpItemAbbrMatch {fg = c.green},
        CmpItemAbbrMatchFuzzy {fg = c.green},
        CmpItemKindMethod {fg = c.vibrant_green},
        CmpItemKindFunction {fg = c.vibrant_green},
        CmpItemKindConstructor {fg = c.vibrant_green},
        CmpItemKindField {fg = c.vibrant_green},
        CmpItemKindVariable {fg = c.cyan},
        CmpItemKindProperty {fg = c.cyan},
        CmpItemKindEnumMember {fg = c.cyan},
        CmpItemKindConstant {fg = c.cyan},
        CmpItemKindUnit {fg = c.dark_purple},
        CmpItemKindValue {fg = c.dark_purple},
        CmpItemKindClass {fg = c.yellow},
        CmpItemKindInterface {fg = c.yellow},
        CmpItemKindModule {fg = c.yellow},
        CmpItemKindEnum {fg = c.yellow},
        CmpItemKindStruct {fg = c.yellow},
        CmpItemKindTypeParameter {fg = c.yellow},
        CmpItemKindKeyword {fg = c.red},
        CmpItemKindSnippet {fg = c.green},
        CmpItemKindColor {fg = c.green},
        CmpItemKindFile {fg = c.green},
        CmpItemKindFolder {fg = c.green},
        CmpItemKindEvent {fg = c.orange},
        CmpItemKindOperator {fg = c.orange},
        -- CmpDocumentation {fg = colors.fg},
        -- CmpDocumentationBorder {fg = colors.bg3},
        -- END cmp custom menu

        -- START diagnostics
        DiagnosticError {fg = c.red}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        DiagnosticWarn {fg = c.yellow}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        DiagnosticInfo {fg = c.green}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        DiagnosticHint {fg = c.purple}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

        DiagnosticSignError {fg = c.red}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        DiagnosticSignWarn {fg = c.yellow}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        DiagnosticSignInfo {fg = c.green}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        DiagnosticSignHint {fg = c.purple}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

        DiagnosticVirtualTextError {bg = util.darken(c.red, 0.1),fg = c.red}, -- Used for "Error" diagnostic virtual text
        DiagnosticVirtualTextWarn {bg = util.darken(c.yellow, 0.1), fg = c.yellow}, -- Used for "Warning" diagnostic virtual text
        DiagnosticVirtualTextInfo {bg = util.darken(c.green, 0.1), fg = c.green}, -- Used for "Information" diagnostic virtual text
        DiagnosticVirtualTextHint {bg = util.darken(c.purple, 0.1), fg = c.purple}, -- Used for "Hint" diagnostic virtual text

        DiagnosticUnderlineError {gui = "undercurl", sp = c.red}, -- Used to underline "Error" diagnostics
        DiagnosticUnderlineWarn {gui = "undercurl", sp = c.yellow}, -- Used to underline "Warning" diagnostics
        DiagnosticUnderlineInfo {gui = "undercurl", sp = c.green}, -- Used to underline "Information" diagnostics
        DiagnosticUnderlineHint {gui = "undercurl", sp = c.purple}, -- Used to underline "Hint" diagnostics
        -- END diagnostics

        -- START dashboard
        DashboardShortCut {fg = c.purple}, --
        DashboardHeader {fg = c.red}, --
        DashboardCenter {fg = c.blue},--
        DashboardFooter {fg = c.yellow, gui = "italic"}, --
        -- END dashboard

        IndentBlanklineChar {fg = c.grey_fg2},

        --  START telescope
        TelescopeBorder { fg = c.grey_fg2 }, --
        TelescopePromptTitle { fg = c.blue, bg = c.one_bg }, --
        TelescopeResultsTitle { fg = c.red, bg = c.one_bg}, --
        TelescopePreviewTitle { fg = c.green, bg = c.one_bg }, --
        TelescopePromptBorder { fg = c.grey_fg }, --
        TelescopeResultsBorder { fg = c.grey_fg}, --
        TelescopeSelectionCaret { fg = c.purple }, --
        -- TelescopeSelection { fg = colors.purple, bg = colors.bg2}, --
        TelescopeMatching { fg = c.green }, --
        --  END telescope

        -- START which-key --
        WhichKey {fg = c.yellow}, --
        WhichKeySeperator {fg = c.white}, --
        WhichKeyGroup {fg = c.blue},--
        WhichKeyDesc {fg = c.red}, --
        WhichKeyFloat {bg = b.base00}, --
        -- WhichKeyValue {fg = colors.bg2},--
        -- END which-key --







        -- TermCursor   { }, -- cursor in a focused terminal
        -- TermCursorNC { }, -- cursor in an unfocused terminal
        -- SignColumnSB {bg = colors.bg}, -- column where |signs| are displayed
        -- IncSearch {fg = colors.fg, bg = colors.visual_yellow}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        -- MsgArea {fg = c.fg}, -- Area for messages and cmdlin,
        -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        -- NormalNC     { bg = colors.black }, -- normal text in non-current windows
        -- NormalSB =   { bg = colors.black }, -- normal text in non-current windows
        -- Search {fg = colors.fg, bg = colors.visual_yellow}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
        -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        -- These groups are not listed as default vim groups,
        -- but they are defacto standard group names for syntax highlighting.
        -- commented out groups should chain up to their "preferred" group by
        -- default,
        -- Uncomment and edit if you want more specific syntax highlighting.

        -- These groups are for the native LSP client. Some other LSP clients may
        -- use these groups, or use their own. Consult your LSP client's
        -- documentation.

        -- LspReferenceText {bg = c.bg2}, -- used for highlighting "text" references
        -- LspReferenceRead {bg = c.bg2}, -- used for highlighting "read" references
        -- LspReferenceWrite {bg = c.bg2}, -- used for highlighting "write" references

        -- LspDiagnosticsDefaultError {fg = colors.red}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        -- LspDiagnosticsDefaultWarning {fg = colors.yellow}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        -- LspDiagnosticsDefaultInformation {fg = colors.blue}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        -- LspDiagnosticsDefaultHint {fg = colors.aqua}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

        -- LspDiagnosticsVirtualTextError {bg = util.darken(colors.red, 0.1),fg = colors.red}, -- Used for "Error" diagnostic virtual text
        -- LspDiagnosticsVirtualTextWarning {bg = util.darken(colors.yellow, 0.1), fg = colors.yellow}, -- Used for "Warning" diagnostic virtual text
        -- LspDiagnosticsVirtualTextInformation {bg = util.darken(colors.blue, 0.1), fg = colors.blue}, -- Used for "Information" diagnostic virtual text
        -- LspDiagnosticsVirtualTextHint {bg = util.darken(colors.green, 0.1), fg = colors.aqua}, -- Used for "Hint" diagnostic virtual text

        -- LspDiagnosticsUnderlineError {gui = "undercurl", sp = colors.red}, -- Used to underline "Error" diagnostics
        -- LspDiagnosticsUnderlineWarning {gui = "undercurl", sp = colors.yellow}, -- Used to underline "Warning" diagnostics
        -- LspDiagnosticsUnderlineInformation {gui = "undercurl", sp = colors.blue}, -- Used to underline "Information" diagnostics
        -- LspDiagnosticsUnderlineHint {gui = "undercurl", sp = colors.aqua}, -- Used to underline "Hint" diagnostics
        -- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
        -- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
        -- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
        -- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float
        -- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
        -- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
        -- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
        -- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column
        -- LspCodeLens { fg = c.bg3 },

        -- These groups are for the neovim tree-sitter highlights.
        -- As of writing, tree-sitter support is a WIP, group names may change.
        -- By default, most of these groups link to an appropriate Vim group,
        -- TSError -> Error for example, so you do not have to define these unless
        -- you explicitly want to support Treesitter's improved syntax awareness.
        -- TSAnnotation         { colors.yellow };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        -- TSAttribute          { colors.orange };    -- (unstable) TODO: docs
        -- TSBoolean            { colors.blue };    -- For booleans.
        -- TSCharacter {fg = c.green}, -- For characters.
        -- TSComment            { };    -- For comment blocks.
        -- TSConstructor {fg = c.aqua_2}, -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
        -- TSConstructor {fg = colors.orange}, -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
        -- luaTSConstructor {fg = c.orange},
        -- TSConditional {fg = c.purple}, -- For keywords related to conditionnals.
        -- TSConstant {fg = c.yellow}, -- For constants
        -- TSConstBuiltin {fg = c.blue}, -- For constant that are built in the language: `nil` in Lua.
        -- TSConstMacro         { colors.orange };    -- For constants that are defined by macros: `NULL` in C.
        -- TSError {fg = c.red_2}, -- For syntax/parser errors.
        -- TSException {fg = c.purple}, -- For exception related keywords.
        -- TSField {fg = c.aqua}, -- For fields.
        -- TSFloat              { colors.yellow };    -- For floats.
        -- TSFunction {fg = c.yellow}, -- For function (calls and definitions).
        -- TSFuncBuiltin {fg = c.yellow}, -- For builtin functions: `table.insert` in Lua.
        -- TSFuncMacro {fg = c.yellow}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        -- TSInclude {fg = c.blue}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        -- TSKeyword {fg = c.purple}, -- For keywords that don't fall in previous categories.
        -- TSKeywordOperator {fg = c.purple}, --
        -- TSKeywordFunction {fg = c.purple}, -- For keywords used to define a fuction.
        -- TSLabel {fg = c.blue}, -- For labels: `label:` in C and `:label:` in Lua.
        -- TSMethod {fg = c.yellow}, -- For method calls and definitions.
        -- TSNamespace { fg = c.red };    -- For identifiers referring to modules and namespaces.
        -- TSNone               { };    -- TODO: docs
        -- TSNote = {}
        -- TSNumber {fg = c.purple}, -- For all numbers
        -- TSOperator {fg = colors.fg}, -- For any operator: `+`, but also `->` and `*` in C.
        -- TSOperator {fg = util.darken(c.orange, 0.85)}, -- For any operator: `+`, but also `->` and `*` in C.        TSParameter {fg = colors.red}, -- For parameters of a function.
        -- TSParameterReference {fg = colors.blue_2}, -- For references to parameters of a function.
        -- TSProperty {fg = c.red}, -- Same as `TSField`.
        -- TSPunctDelimiter {fg = c.red}, -- For delimiters ie: `.`
        -- TSPunctBracket {fg = util.darken(c.orange, 0.85) }, -- For brackets and parens.
        -- TSPunctBracket {fg = colors.fg}, -- For brackets and parens.
        -- TSPunctSpecial {fg = util.darken(c.orange, 0.85)}, -- For special punctutation that does not fall in the catagories before.
        -- TSRepeat {fg = c.purple}, -- For keywords related to loops.
        -- TSString {fg = c.green}, -- For strings.
        -- TSStringRegex        { colors.orange };    -- For regexes.
        -- TSStructure {},
        -- TSStringEscape       { colors.yellow_2 };    -- For escape characters within a string.
        -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
        -- TSType {fg = c.yellow}, -- For types.
        -- TSTypeBuiltin {fg = c.blue}, -- For builtin types.
        -- TSVariable {fg = c.fg}, -- Any variable name that does not have another highlight.
        -- TSVariableBuiltin {fg = c.blue}, -- Variable names that are defined by the languages, like `this` or `self`.

        -- TSTag {fg = c.blue}, -- Tags like html tag names.
        -- TSTagDelimiter {fg = c.bg3}, -- Tag delimiter like `<` `>` `/`
        -- TSText {fg = c.yellow}, -- For strings considered text in a markup language.
        -- TSEmphasis {fg = c.yellow}, -- For text to be represented with emphasis.
        -- TSUnderline {fg = c.yellow}, -- For text to be represented with an underline.
        -- TSStrike {fg = c.yellow}, -- For strikethrough text.
        -- TSTitle {fg = c.yellow}, -- Text that is part of a title.
        -- TSLiteral {fg = c.yellow}, -- Literal text.
        -- TSURI {fg = c.purple }, -- Any URI like a link or email.


        -- START nvimtree --
        -- NvimTreeEmptyFolderName {fg = c.blue}, --
        -- NvimTreeEndOfBuffer {fg = c.darker_black},--
        -- NvimTreeFolderIcon {fg = c.folder_bg},--
        -- NvimTreeFolderName {fg = c.folder_bg}, --
        -- NvimTreeGitDirty {fg = c.red},--
        -- NvimTreeIndentMarker {fg = c.bg2}, --
        -- NvimTreeNormal {bg = c.darker_black}, --
        -- NvimTreeNormalNC {bg = c.darker_black}, --
        -- NvimTreeOpenedFolderName {fg = c.blue},--
        -- NvimTreeRootFolder {fg = c.red, gui = "underline"}, --
        -- NvimTreeStatuslineNc {fg = c.darker_black, bg = c.darker_black},--
        -- NvimTreeVertSplit {fg = c.darker_black, bg = c.darker_black},--
        -- NvimTreeWindowPicker {fg = c.red, bg = c.black2},--

        -- NvimTreeFolderName {fg = colors.blue_2}, --
        -- NvimTreeOpenedFile {fg = colors.blue_2},--
        -- NvimTreeImageFile {fg = colors.purple}, --
        -- NvimTreeExecFile {fg = colors.green},--
        -- NvimTreeSpecialFile {fg = colors.yellow, gui = "underline"}, --
        -- NvimTreeSymlink {fg = colors.blue},--
        -- NvimTreeGitNew {fg = colors.fg}, --
        -- NvimTreeGitDeleted {fg = colors.fg}, --
        -- NvimTreeGitDirty {fg = colors.fg},--
        -- NvimTreeGitNew {fg = colors.git.add}, --
        -- NvimTreeGitDeleted {fg = colors.git.delete}, --
        -- NvimTreeGitSpecialFile {fg = colors.yellow},
        -- NvimTreeGitStaged {fg = colors.green},--
        -- NvimTreeGitMerge {fg = colors.green}, --
        -- NvimTreeGitRenamed {fg = colors.green},--
        -- NvimTreeLspDiagnostics {fg = colors.orange},--
        -- LspDiagnosticsError = { fg = c.error },
        -- LspDiagnosticsWarning = { fg = c.warning },
        -- LspDiagnosticsInformation = { fg = c.info },
        -- LspDiagnosticsHint = { fg = c.hint },
        -- END nvimtree --


        -- START hop
        -- HopNextKey {fg = colors.red_2, gui = "bold"}, --
        -- HopUnmatched {fg = colors.bg3},--
        -- END hop

        -- START easymotion
        -- EasyMotionTarget {fg = colors.red_2, gui = "bold"}, --
        -- EasyMotionTarget2First {fg = colors.red_2, gui = "bold"},--
        -- EasyMotionTarget2Second {fg = colors.red_2, gui = "bold"}, --
        -- EasyMotionShade {fg = colors.bg3}, --
        -- END easymotion

        -- START gitsigns
        -- GitSignsAdd {fg = colors.gitSigns.add}, -- diff mode: Added line |diff.txt|
        -- GitSignsChange {fg = colors.gitSigns.change}, -- diff mode: Changed line |diff.txt|
        -- GitSignsDelete {fg = colors.gitSigns.delete}, -- diff mode: Deleted line |diff.txt|
        -- END gitsigns

        -- START gitgutter
        -- GitGutterAdd {fg = colors.gitSigns.add}, -- diff mode: Added line |diff.txt|
        -- GitGutterChange {fg = colors.gitSigns.change}, -- diff mode: Changed line |diff.txt|
        -- GitGutterDelete {fg = colors.gitSigns.delete}, -- diff mode: Deleted line |diff.txt|
        -- END gitgutter

        -- DiffAdd {fg = c.nord_blue, bg = c.nord_blue},
        -- DiffChange {fg = c.grey_fg, bg = c.grey_fg},
        -- DiffModified {fg = c.nord_blue, bg = c.nord_blue},


        --  START neogit
        -- NeogitUnstagedChanges {fg = colors.aqua_2, gui = "bold"},--
        -- NeogitUntrackedFiles {fg = colors.aqua_2, gui = "bold"},--
        -- NeogitUnmergedChanges {fg = colors.aqua_2, gui = "bold"},--
        -- NeogitUnpulledChanges {fg = colors.aqua_2, gui = "bold"},--
        -- NeogitRecentCommits {fg = colors.aqua_2, gui = "bold"},--
        -- NeogitStagedChanges {fg = colors.aqua_2, gui = "bold"},--
        -- NeogitStashes {fg = colors.aqua_2, gui = "bold"},--

        -- -- NeogitCommandText {fg = colors.red, gui = "bold"},--
        -- -- NeogitCommandTime {fg = colors.red, gui = "bold"},--
        -- NeogitFilePath {fg = colors.purple },--
        -- NeogitCommitViewHeader {fg = colors.bg4, gui = "bold"},--
        -- -- NeogitCommitViewDescription {fg = colors.red, gui = "bold"},--
        -- -- NeogitCommitMessage {fg = colors.red, gui = "bold"},--
        -- -- NeogitFold {fg = colors.red, gui = "bold"},--
        -- -- NeogitHead {fg = colors.red, gui = "bold"},--
        -- -- NeogitPush {fg = colors.red, gui = "bold"},--
        -- -- NeogitUnmergedInto {fg = colors.yellow, gui = "bold"},--
        -- -- NeogitUnpulledFrom {fg = colors.yellow, gui = "bold"},--
        -- NeogitStash {fg = colors.aqua_2, gui = "bold"},--
        -- NeogitObjectId {fg = colors.bg3, gui = "bold"},--
        -- NeogitBranch {fg = colors.aqua_2, gui = "bold"}, --
        -- NeogitRemote {fg = colors.green_2},--

        -- NeogitHunkHeader {bg = colors.bg1, fg = colors.purple_2 },--
        -- NeogitHunkHeaderHighlight {bg = colors.bg2, fg = colors.purple}, --
        -- NeogitDiffContext {fg = colors.fg, bg = colors.bg},--
        -- NeogitDiffDelete {fg = colors.git.delete, bg = colors.git.bg_delete},--
        -- NeogitDiffAdd {fg = colors.git.add, bg = colors.git.bg_add}, --
        -- NeogitDiffContextHighlight {bg = colors.bg},--
        -- NeogitDiffDeleteHighlight {fg = colors.git.delete, bg = colors.git.bg_delete},--
        -- NeogitDiffAddHighlight {fg = colors.git.add, bg = colors.git.bg_add}, --
        --  END neogit

        --  START fennec lightspeed.nvim
        -- LightspeedCursor {fg = colors.bg, bg = colors.blue, gui = "bold, underline"},
        -- LightspeedLabel {fg = colors.red, gui = "bold, underline"},
        -- -- LightspeedLabelOverlapped {fg = colors.green_2, gui = "bold"},
        -- LightspeedLabelDistant {fg = colors.orange, gui = "bold, underline"},
        -- -- LightspeedLabelDistantOverlapped {fg = colors.orange, gui = "bold"},
        -- LightspeedShortcut {
        --     fg = colors.bg,
        --     bg = colors.yellow_2,
        --     gui = "bold"
        -- },
        -- -- LightspeedShortcutOverlapped {fg = colors.bg, bg = colors.green_2, gui = "bold"},
        -- LightspeedMaskedChar {fg = colors.fg, gui = "bold"},
        -- LightspeedGreyWash {fg = c.grey_fg},
        -- LightspeedUnlabeledMatch {fg = colors.fg, gui = "italic, bold"},
        -- LightspeedOneCharMatch {fg = colors.bg, bg = colors.yellow_2, gui = "bold"},
        -- -- LightspeedUniqueChar {fg = colors.white, gui = "bold"},
        -- -- LightspeedPendingOpArea {fg = colors.fg, bg = colors.lightspeed.primary},
        -- -- LightspeedPendingChangeOpArea {fg = colors.lightspeed.primary, gui = "italic, strikethrough"},
        --  END fennec lightspeed.nvim


        --  START buffer
        -- BufferCurrent {fg = colors.fg, bg = colors.bg},
        -- BufferCurrentIndex {fg = colors.blue, bg = colors.bg},
        -- BufferCurrentMod {fg = colors.fg, bg = colors.bg},
        -- BufferCurrentSign {fg = colors.blue, bg = colors.bg},
        -- BufferCurrentTarget {fg = colors.red, bg = colors.bg, gui = "bold"},

        -- BufferVisible {fg = colors.fg, bg = colors.bg},
        -- BufferVisibleIndex {fg = colors.fg, bg = colors.bg},
        -- BufferVisibleMod {fg = colors.fg, bg = colors.bg},
        -- BufferVisibleSign {fg = colors.fg, bg = colors.bg},
        -- BufferVisibleTarget {fg = colors.red, bg = colors.bg, gui = "bold"},

        -- BufferInactive {fg = colors.gray_2, bg = colors.bg1},
        -- BufferInactiveIndex {fg = colors.gray_2, bg = colors.bg1},
        -- BufferInactiveMod {fg = colors.gray_2, bg = colors.bg1},
        -- BufferInactiveSign {fg = colors.gray_2, bg = colors.bg1},
        -- BufferInactiveTarget {fg = colors.red, bg = colors.bg_inactive, gui = "bold"}, --
        -- -- BufferTabpages: "blue bg_inactive b",
        -- -- BufferTabpageFill: "gutter_fg_grey bg_inactive",
        --  END buffer

        -- START markdown
        -- markdownH1 { fg = c.red, gui = "bold" },
        -- markdownH2 { fg = c.orange, gui = "bold" },
        -- markdownH3 {fg = c.yellow, gui = "bold"},
        -- markdownH4 {fg = c.green, gui = "bold"},
        -- markdownH5 {fg = c.aqua, gui = "bold"},
        -- markdownH6 {fg = c.blue, gui = "bold"},
        -- markdownHeadingDelimiter { fg = c.bg3 },
        -- markdownHeadingRule { fg = c.bg3 },
        -- markdownBold{ fg = c.orange, gui = "bold"},
        -- markdownBoldDelimiter{ fg = c.bg3},
        -- markdownItalic {fg = c.yellow, gui = "italic" },
        -- markdownItalicDelimiter {fg = c.bg3 },
        -- markdownBoldItalic {fg = c.red, gui = "bold, italic" },
        -- markdownBoldItalicDelimiter {fg = c.bg3 },
        -- markdownCode { fg = c.green},
        -- markdownCodeDelimiter { fg = c.bg3},
        -- markdownCodeBlock { fg = c.bg3},
        -- markdownBlockQuote { fg = c.bg3},
        -- -- not sure what the markdownID stuff does
        -- markdownID {fg = c.red},
        -- markdownIDDeclaration {fg = c.red },
        -- markdownIDDelimiter {fg = c.bg3 },
        -- markdownIDItalic {fg = c.red, gui = "italic"},
        -- -- not sure what the markdownID stuff does
        -- markdownLinkDelimiter {fg = c.bg3},
        -- markdownLinkText {fg = c.green},
        -- markdownListMarker {fg = c.orange, gui = "bold"},
        -- markdownOrderedListMarker {fg = c.orange, gui = "bold"},
        -- markdownRule { fg = c.bg3 },
        -- markdownURL {fg = c.purple},
        -- markdownInlineURL {fg = c.blue},
        -- markdownUrlTitle {fg = c.blue },
        -- END markdown

        -- START vim-markdown
        -- htmlH1 {fg = c.red, gui = "bold"},
        -- htmlH2 {fg = c.orange, gui = "bold"},
        -- htmlH3 {fg = c.yellow, gui = "bold"},
        -- htmlH4 {fg = c.green, gui = "bold"},
        -- htmlH5 {fg = c.aqua, gui = "bold"},
        -- htmlH6 {fg = c.blue, gui = "bold"},
        -- mkdHeading {fg = c.bg3, gui = "bold"},
        -- htmlBold {fg = c.orange, gui = "bold"},
        -- mkdBold {fg = c.bg3, gui = "bold"},
        -- htmlItalic {fg = c.yellow, gui = "italic"},
        -- mkdItalic {fg = c.bg3, gui = "italic"},
        -- htmlBoldItalic {fg = c.red, gui = "bold, italic"},
        -- mkdBoldItalic {fg = c.bg3},
        -- -- mkdFootnotes {},
        -- -- mkdLinkDef  {},
        -- -- mkdLinkDefTarget {},
        -- -- mkdLinkTitle {},
        -- mkdListItem {fg = c.orange},
        -- -- mkdNonListItemBlock {},
        -- -- mkdListItemLine {fg = colors.orange},
        -- -- mkdString {},
        -- mkdCode {fg = c.green},
        -- mkdCodeDelimiter {fg = c.bg3},
        -- mkdCodeStart {fg = c.bg3},
        -- mkdCodeEnd {fg = c.bg3},
        -- -- mkdFootnote {},
        -- -- mkdBlockquote {},
        -- mkdRule {fg = c.orange},
        -- -- mkdLineBreak {},
        -- -- mkdFootnotes {},
        -- mkdLink {fg = c.green},
        -- mkdURL {fg = c.purple},
        -- -- mkdInlineURL {fg = colors.purple},
        -- -- mkdID {fg = colors.yellow},
        -- -- mkdLinkDef {fg = colors.orange},
        -- -- mkdLinkDefTarget {fg = colors.orange},
        -- -- mkdLinkTitle {fg = colors.orange},
        -- mkdDelimiter {fg = c.bg3},
        -- END vim-markdown

        -- START vimwiki
        -- VimwikiHeader1 {fg = c.red, gui = "bold"},
        -- VimwikiHeader2 {fg = c.orange, gui = "bold"},
        -- VimwikiHeader3 {fg = c.yellow, gui = "bold"},
        -- VimwikiHeader4 {fg = c.green, gui = "bold"},
        -- VimwikiHeader5 {fg = c.aqua, gui = "bold"},
        -- VimwikiHeader6 {fg = c.blue, gui = "bold"},
        -- VimwikiLink {fg = c.purple},
        -- VimwikiLinkT {fg = c.bg3},
        -- VimwikiWeblink1 {fg = c.purple},
        -- VimwikiHeaderChar {fg = c.bg3},
        -- VimwikiCode {fg = c.green},
        -- VimwikiList {fg = c.orange, gui = "bold"},
        -- -- VimwikiTodo {fg = colors.blue},
        -- -- VimwikiListTodo {fg = colors.orange, gui = "bold"},
        -- -- VimwikiComment {fg = colors.red},
        -- VimwikiTag {fg = c.purple, gui = "bold"},
        -- VimwikiBold {fg = c.orange, gui = "bold"},
        -- -- VimwikiBoldChar {fg = colors.bg3},
        -- VimwikiItalic {fg = c.yellow, gui = "italic"},
        -- -- VimwikiItalicChar {fg = colors.bg3},
        -- VimwikiBoldItalic {fg = c.red, gui = "bold, italic"},
        -- VimwikiUnderline {gui = "underline"},
        -- -- VimwikiHR {fg = colors.yellow},
        -- END vimwiki

        -- START orgmode.nvim
        -- OrgTSTimestampActive {fg = colors.fg},
        -- OrgTSTimestampInactive {fg = colors.fg},
        -- OrgTSBullet {fg = colors.fg},
        OrgTSHeadlineLevel1 {fg=c.red},
        OrgTSHeadlineLevel2 {fg=c.orange},
        OrgTSHeadlineLevel3 {fg=c.yellow},
        OrgTSHeadlineLevel4 {fg=c.green},
        OrgTSHeadlineLevel5 {fg=c.aqua},
        OrgTSHeadlineLevel6 {fg=c.blue},
        -- OrgTSPropertyDrawer {fg=colors.purple},
        -- OrgTSDrawer {fg=colors.purple},
        -- OrgTSTag {fg=colors.purple},
        -- OrgTSPlan {fg=colors.purple},
        -- OrgTSComment {fg=colors.purple},
        -- OrgDirective {fg=colors.red},
        -- OrgTSCheckbox {fg=colors.purple},
        -- OrgTSCheckboxChecked {fg=colors.purple},
        -- OrgTSCheckboxHalfChecked {fg=colors.purple},
        -- OrgTSCheckboxUnchecked {fg=colors.purple},

        -- org_bold_delimiter {fg = c.bg3},
        -- org_bold {fg = c.orange, gui = "bold"},
        -- org_italic_delimiter {fg = c.bg3},
        -- org_italic {fg = c.yellow, gui = "italic"},
        -- org_underline_delimiter {fg = c.bg3},
        -- org_underline {fg = c.green, gui = "underline"},
        -- -- org_code_delimiter {fg = colors.bg3},
        -- -- org_code {fg = colors.green},
        -- -- org_verbatim_delimiter {fg = colors.bg3},
        -- -- org_verbatim {fg = colors.green},
        -- org_strike_delimiter {fg = c.bg3},
        -- org_strike {gui = "strikethrough"},
        -- -- org_timestamp {},
        -- -- org_timestamp_inactive {},
        -- -- org_deadline_scheduled {},
        -- -- org_hyperlink {fg = colors.green},
        -- -- org_hyperlinkBracketsLeft {fg = colors.bg3},
        -- -- org_hyperlinkURL {fg = colors.purple},
        -- -- org_hyperlinkBracketsRight {fg = colors.bg3},
        -- -- org_comment {},
        -- -- org_list_ordered {fg = colors.orange},
        -- -- org_list_unordered {fg = colors.orange},
        -- -- org_list_def {},
        -- -- org_list_item {},
        -- -- org_list_bullet {},
        -- -- org_list_checkbox {},
        -- -- org_block_delimiter {},
        -- -- org_key_identifier {},
        -- org_title {fg = c.purple},
        -- -- org_properties_delimiter {},
        -- -- org_property {},
        -- -- org_property_value {},
        -- -- org_subtask_number {},
        -- -- org_subtask_percent {},
        -- -- org_subtask_number_all {},
        -- -- org_subtask_percent_100 {},
        -- -- org_latex {},
        -- -- OrgAgendaDay {},
        -- -- OrgAgendaTags {},
        -- -- orghelp_key {},
        -- -- orghelp_bold {},
        -- -- orghelp_bold_italic {},
        -- -- orghelp_backtick {},
        -- -- orghelp_asterisk {},
        -- -- orghelp_underscore {},

        -- OrgHeadlineStar1 {}
        -- OrgHeadlineStar2
        -- OrgHeadlineStar3
        -- OrgHeadlineStar4
        OrgHeadlineLevel1 {fg = c.red},
        OrgHeadlineLevel2 {fg = c.orange},
        OrgHeadlineLevel3 {fg = c.yellow},
        OrgHeadlineLevel4 {fg = c.green},
        OrgHeadlineLevel5 {fg = c.aqua},
        OrgHeadlineLevel6 {fg = c.blue},
        -- END orgmode.nvim

        -- "START" vim-sandwich
        -- OperatorSandwichBuns {fg = colors.bg, bg = colors.yellow_2},
        OperatorSandwichChange {bg = b.base02},
        OperatorSandwichDelete {fg = b.base00, bg = c.yellow},
        -- OperatorSandwichAdd {},
        -- END vim-sandwich

        -- START vim-visual-multi
        -- -- needs "vim.g.VM_theme_set_by_colorscheme = true" for it to work
        VM_Mono {fg = b.base00, bg = c.green},
        VM_Extend {bg = b.base02},
        VM_Cursor {fg = b.base00, bg = b.base0A, gui = "underline" },
        VM_Insert {gui = "underline", sp = c.red},
        -- END vim-visual-multi

        -- START treesitter context
        -- TreesitterContext {bg = c.bg1},
        -- END treesitter context

        -- START lsp_signature
        LspSignatureActiveParameter {fg = c.orange},
        -- END lsp_signature

        -- START nvim-biscuits
        -- BiscuitColor {fg = c.bg3},
        -- END nvim-biscuits

        -- START diffview
        -- diffAdded { bg = c.git.bg_add, fg = c.git.add },
        -- diffRemoved { bg = c.git.bg_delete, fg = c.git.delete },
        -- diffChanged { fg = c.git.change },
        -- diffOldFile { fg = c.yellow },
        -- diffNewFile { fg = c.orange },
        -- diffFile { fg = c.blue },
        -- diffLine { fg = c.bg3 },
        -- diffIndexLine { fg = c.purple },
        -- END diffview
    }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
