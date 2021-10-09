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

    black = "#1d2021",

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


    git = {
      delete = "#c44936",
      bg_delete = '#543834',

      inactive_delete = "#9e3a2a",
      inactive_bg_delete = '#473834',

      add = "#9e9e3c",
      bg_add = "#3f3f29",

      inactive_add = "#7c7c2e",
      inactive_bg_add = "#333327",

      -- change = '#45707a',
      -- bg_change = "#0d3138"
      change = '#b47109',
      bg_change = "#482D03"
    },

    -- gitSigns = {delete = "#ea4a5a", add = "#28a745", change = "#2188ff"}, -- github dark
    -- gitSigns = {delete = "#c14a4a", add = "#6c782e", change = "#45707a"}, -- gruvbox-material
    gitSigns = {delete = "#c14a4a", add = "#6c782e", change = "#b47109"}, -- gruvbox-flat

    visual_red = "#442e2d",
    visual_green = "#333e34",
    visual_blue = "#2e3b3b",
    visual_yellow = "#473c29",
    search = "#335075",

    -- lightspeed = {primary = "#fabd2f", secondary = "#EBDBB2" },
    lightspeed = {secondary = "#9ADDFF", primary = "#F00077"},
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
        -- Cursor       {bg = colors.gray }, -- character under the cursor
        -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
        CursorColumn {bg = colors.bg0}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine {bg = colors.bg0_s}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory {fg = colors.blue_2}, -- directory names (and other special names in listings)
        DiffAdd {fg = colors.git.add, bg = colors.git.bg_add}, -- diff mode: Added line |diff.txt|
        DiffChange {fg = colors.git.change, bg = colors.git.bg_change}, -- diff mode: Changed line |diff.txt|
        DiffDelete {fg = colors.git.delete, bg = colors.git.bg_delete}, -- diff mode: Deleted line |diff.txt|
        DiffText {fg = colors.bg, bg = colors.yellow}, -- diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer {fg = colors.bg}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
        -- TermCursor   { }, -- cursor in a focused terminal
        -- TermCursorNC { }, -- cursor in an unfocused terminal
        ErrorMsg {fg = colors.red_2}, -- error messages on the command line
        VertSplit {fg = colors.bg1}, -- the column separating vertically split windows
        Folded {fg = colors.bg3}, -- line used for closed folds
        -- FoldColumn   { }, -- 'foldcolumn'
        SignColumn {bg = colors.bg}, -- column where |signs| are displayed
        -- SignColumnSB {bg = colors.bg}, -- column where |signs| are displayed
        -- IncSearch {fg = colors.fg, bg = colors.visual_yellow}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        IncSearch {fg = colors.fg, bg = colors.search}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
        Substitute {fg = colors.bh0_h, bg = colors.red}, -- |:substitute| replacement text highlighting
        LineNr {fg = colors.bg2}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        CursorLineNr {fg = colors.bg4}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        MatchParen {fg = util.lighten(colors.blue, 0.95), gui = "underline", gui = "bold"}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg {fg = colors.fg, gui = "bold"}, -- 'showmode' message (e.g., "-- INSERT -- ")
        MsgArea {fg = colors.fg}, -- Area for messages and cmdlin,
        -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg {fg = colors.fg}, -- |more-prompt|
        NonText {fg = colors.bg3}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal {fg = colors.fg, bg = colors.bg}, -- normal text
        NormalFloat {fg = colors.fg, bg = colors.bg0}, -- Normal text in floating windows.
        FloatBorder {fg = colors.bg2}, --
        -- NormalNC     { bg = colors.black }, -- normal text in non-current windows
        -- NormalSB =   { bg = colors.black }, -- normal text in non-current windows
        Pmenu {fg = colors.fg, bg = colors.bg1}, -- Popup menu: normal item.
        PmenuSel {fg = colors.bg, bg = colors.blue}, -- Popup menu: selected item.
        PmenuSbar {bg = colors.bg3}, -- Popup menu: scrollbar.
        PmenuThumb {bg = colors.fg}, -- Popup menu: Thumb of the scrollbar.
        Question {fg = colors.purple}, -- |hit-enter| prompt and yes/no questions
        QuickFixLine {fg = colors.bg, bg = colors.yellow}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        -- Search {fg = colors.fg, bg = colors.visual_yellow}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
        Search {fg = colors.fg, bg = colors.search}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
        SpecialKey {fg = colors.bg3}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad { gui = "underline"}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
        SpellCap { gui = "underline"}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
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
        -- Boolean {fg = colors.purple}, --  a boolean constant: TRUE, false
        -- Float {fg = colors.yellow_2}, --    a floating point constant: 2.3e10
        Identifier {fg = colors.red}, -- (preferred) any variable name
        Function {fg = colors.blue}, -- function name (also: methods for classes)
        Statement {fg = colors.purple}, -- (preferred) any statement
        -- Conditional {fg = colors.fg}, --  if, then, else, endif, switch, etc.
        -- Repeat {fg = colors.purple}, --   for, do, while, etc.
        -- Label {fg = colors.blue_2}, --    case, default, etc.
        Operator {fg = util.darken(colors.red, 0.85)}, -- "sizeof", "+", "*", etc.
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

        LspDiagnosticsVirtualTextError {bg = util.darken(colors.red, 0.1),fg = colors.red}, -- Used for "Error" diagnostic virtual text
        LspDiagnosticsVirtualTextWarning {bg = util.darken(colors.yellow, 0.1), fg = colors.yellow}, -- Used for "Warning" diagnostic virtual text
        LspDiagnosticsVirtualTextInformation {bg = util.darken(colors.blue, 0.1), fg = colors.blue}, -- Used for "Information" diagnostic virtual text
        LspDiagnosticsVirtualTextHint {bg = util.darken(colors.green, 0.1), fg = colors.aqua}, -- Used for "Hint" diagnostic virtual text
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
        -- TSConstructor {fg = colors.orange}, -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
        luaTSConstructor {fg = colors.orange},
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
        TSKeywordOperator {fg = colors.purple}, -- 
        TSKeywordFunction {fg = colors.purple}, -- For keywords used to define a fuction.
        TSLabel {fg = colors.blue}, -- For labels: `label:` in C and `:label:` in Lua.
        TSMethod {fg = colors.yellow}, -- For method calls and definitions.
        TSNamespace { fg = colors.red };    -- For identifiers referring to modules and namespaces.
        -- TSNone               { };    -- TODO: docs
        -- TSNote = {}
        TSNumber {fg = colors.purple}, -- For all numbers
        -- TSOperator {fg = colors.fg}, -- For any operator: `+`, but also `->` and `*` in C.
        TSOperator {fg = util.darken(colors.orange, 0.85)}, -- For any operator: `+`, but also `->` and `*` in C.        TSParameter {fg = colors.red}, -- For parameters of a function.
        -- TSParameterReference {fg = colors.blue_2}, -- For references to parameters of a function.
        TSProperty {fg = colors.red}, -- Same as `TSField`.
        TSPunctDelimiter {fg = colors.red}, -- For delimiters ie: `.`
        TSPunctBracket {fg = util.darken(colors.orange, 0.85) }, -- For brackets and parens.
        -- TSPunctBracket {fg = colors.fg}, -- For brackets and parens.
        TSPunctSpecial {fg = util.darken(colors.orange, 0.85)}, -- For special punctutation that does not fall in the catagories before.
        TSRepeat {fg = colors.purple}, -- For keywords related to loops.
        TSString {fg = colors.green}, -- For strings.
        -- TSStringRegex        { colors.orange };    -- For regexes.
        -- TSStructure {},
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
        TSURI {fg = colors.purple }, -- Any URI like a link or email.

        -- START which-key --
        WhichKey {fg = colors.yellow}, --
        WhichKeySeperator {fg = colors.fg}, --
        WhichKeyGroup {fg = colors.blue},--
        WhichKeyDesc {fg = colors.red}, --
        WhichKeyFloat {bg = colors.bg}, --
        WhichKeyValue {fg = colors.bg2},--
        -- END which-key --

        -- START nvimtree --
        NvimTreeNormal {fg = colors.fg, bg = colors.black}, --
        NvimTreeRootFolder {fg = colors.green, gui = "bold"}, --
        -- NvimTreeFolderName {fg = colors.blue_2}, --
        NvimTreeFolderName {fg = colors.blue_2}, --
        NvimTreeFolderIcon {fg = colors.blue_2},--
        NvimTreeEmptyFolderName {fg = colors.blue_2}, --
        NvimTreeOpenedFolderName {fg = colors.blue_2},--
        NvimTreeImageFile {fg = colors.purple}, --
        NvimTreeExecFile {fg = colors.green},--
        NvimTreeSpecialFile {fg = colors.yellow, gui = "underline"}, --
        NvimTreeSymlink {fg = colors.blue},--
        -- NvimTreeGitNew {fg = colors.git.add}, --
        NvimTreeGitNew {fg = colors.fg}, --
        -- NvimTreeGitDirty {fg = colors.git.change},--
        NvimTreeGitDirty {fg = colors.fg},--
        -- NvimTreeGitDeleted {fg = colors.git.delete}, --
        NvimTreeGitDeleted {fg = colors.fg}, --
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
        NeogitUnmergedInto {fg = colors.red, gui = "bold"},
        NeogitUnpulledFrom {fg = colors.red, gui = "bold"},
        NeogitBranch {fg = colors.aqua, gui = "bold"}, --
        NeogitRemote {fg = colors.blue},--
        NeogitHunkHeader {bg = colors.bg1, fg = colors.fg2 },--
        NeogitHunkHeaderHighlight {bg = colors.bg2, fg = colors.purple}, --
        NeogitDiffContextHighlight {fg = colors.fg, bg = colors.bg},--
        NeogitDiffDeleteHighlight {fg = colors.git.delete, bg = colors.git.bg_delete},--
        NeogitDiffAddHighlight {fg = colors.git.add, bg = colors.git.bg_add}, --
        --  END neogit

        --  START fennec lightspeed.nvim
        LightspeedCursor {fg = colors.bg, bg = colors.blue, gui = "bold, underline"},
        LightspeedLabel {fg = colors.red, gui = "bold, underline"},
        -- LightspeedLabelOverlapped {fg = colors.green_2, gui = "bold"},
        LightspeedLabelDistant {fg = colors.orange, gui = "bold, underline"},
        -- LightspeedLabelDistantOverlapped {fg = colors.orange, gui = "bold"},
        LightspeedShortcut {
            fg = colors.bg,
            bg = colors.yellow_2,
            gui = "bold"
        },
        -- LightspeedShortcutOverlapped {fg = colors.bg, bg = colors.green_2, gui = "bold"},
        LightspeedMaskedChar {fg = colors.fg, gui = "bold"},
        LightspeedGreyWash {fg = colors.bg3},
        LightspeedUnlabeledMatch {fg = colors.fg, gui = "italic, bold"},
        LightspeedOneCharMatch {fg = colors.bg, bg = colors.yellow_2, gui = "bold"},
        -- LightspeedUniqueChar {fg = colors.white, gui = "bold"},
        -- LightspeedPendingOpArea {fg = colors.fg, bg = colors.lightspeed.primary},
        -- LightspeedPendingChangeOpArea {fg = colors.lightspeed.primary, gui = "italic, strikethrough"},
        --  END fennec lightspeed.nvim

        --  START telescope
        TelescopeBorder { fg = colors.bg3 },
        TelescopePromptBorder { fg = colors.bg3 },
        TelescopeResultsBorder { fg = colors.bg3},
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
        markdownH1 { fg = colors.red, gui = "bold" },
        markdownH2 { fg = colors.orange, gui = "bold" },
        markdownH3 {fg = colors.yellow, gui = "bold"},
        markdownH4 {fg = colors.green, gui = "bold"},
        markdownH5 {fg = colors.aqua, gui = "bold"},
        markdownH6 {fg = colors.blue, gui = "bold"},
        markdownHeadingDelimiter { fg = colors.bg3 },
        markdownHeadingRule { fg = colors.bg3 },
        markdownBold{ fg = colors.orange, gui = "bold"},
        markdownBoldDelimiter{ fg = colors.bg3},
        markdownItalic {fg = colors.yellow, gui = "italic" },
        markdownItalicDelimiter {fg = colors.bg3 },
        markdownBoldItalic {fg = colors.red, gui = "bold, italic" },
        markdownBoldItalicDelimiter {fg = colors.bg3 },
        markdownCode { fg = colors.green},
        markdownCodeDelimiter { fg = colors.bg3},
        markdownCodeBlock { fg = colors.bg3},
        markdownBlockQuote { fg = colors.bg3},
        -- not sure what the markdownID stuff does
        markdownID {fg = colors.red},
        markdownIDDeclaration {fg = colors.red },
        markdownIDDelimiter {fg = colors.bg3 },
        markdownIDItalic {fg = colors.red, gui = "italic"},
        -- not sure what the markdownID stuff does
        markdownLinkDelimiter {fg = colors.bg3},
        markdownLinkText {fg = colors.green},
        markdownListMarker {fg = colors.orange, gui = "bold"},
        markdownOrderedListMarker {fg = colors.orange, gui = "bold"},
        markdownRule { fg = colors.bg3 },
        markdownURL {fg = colors.purple},
        markdownInlineURL {fg = colors.blue},
        markdownUrlTitle {fg = colors.blue },
        -- END markdown

        -- START vim-markdown
        htmlH1 {fg = colors.red, gui = "bold"},
        htmlH2 {fg = colors.orange, gui = "bold"},
        htmlH3 {fg = colors.yellow, gui = "bold"},
        htmlH4 {fg = colors.green, gui = "bold"},
        htmlH5 {fg = colors.aqua, gui = "bold"},
        htmlH6 {fg = colors.blue, gui = "bold"},
        mkdHeading {fg = colors.bg3, gui = "bold"},
        htmlBold {fg = colors.orange, gui = "bold"},
        mkdBold {fg = colors.bg3, gui = "bold"},
        htmlItalic {fg = colors.yellow, gui = "italic"},
        mkdItalic {fg = colors.bg3, gui = "italic"},
        htmlBoldItalic {fg = colors.red, gui = "bold, italic"},
        mkdBoldItalic {fg = colors.bg3},
        -- mkdFootnotes {},
        -- mkdLinkDef  {},
        -- mkdLinkDefTarget {},
        -- mkdLinkTitle {},
        mkdListItem {fg = colors.orange},
        -- mkdNonListItemBlock {},
        -- mkdListItemLine {fg = colors.orange},
        -- mkdString {},
        mkdCode {fg = colors.green},
        mkdCodeDelimiter {fg = colors.bg3},
        mkdCodeStart {fg = colors.bg3},
        mkdCodeEnd {fg = colors.bg3},
        -- mkdFootnote {},
        -- mkdBlockquote {},
        mkdRule {fg = colors.orange},
        -- mkdLineBreak {},
        -- mkdFootnotes {},
        mkdLink {fg = colors.green},
        mkdURL {fg = colors.purple},
        -- mkdInlineURL {fg = colors.purple},
        -- mkdID {fg = colors.yellow},
        -- mkdLinkDef {fg = colors.orange},
        -- mkdLinkDefTarget {fg = colors.orange},
        -- mkdLinkTitle {fg = colors.orange},
        mkdDelimiter {fg = colors.bg3},
        -- END vim-markdown

        -- START vimwiki
        VimwikiHeader1 {fg = colors.red, gui = "bold"},
        VimwikiHeader2 {fg = colors.orange, gui = "bold"},
        VimwikiHeader3 {fg = colors.yellow, gui = "bold"},
        VimwikiHeader4 {fg = colors.green, gui = "bold"},
        VimwikiHeader5 {fg = colors.aqua, gui = "bold"},
        VimwikiHeader6 {fg = colors.blue, gui = "bold"},
        VimwikiLink {fg = colors.purple},
        VimwikiLinkT {fg = colors.bg3},
        VimwikiWeblink1 {fg = colors.purple},
        VimwikiHeaderChar {fg = colors.bg3},
        VimwikiCode {fg = colors.green},
        VimwikiList {fg = colors.orange, gui = "bold"},
        -- VimwikiTodo {fg = colors.blue},
        -- VimwikiListTodo {fg = colors.orange, gui = "bold"},
        -- VimwikiComment {fg = colors.red},
        VimwikiTag {fg = colors.purple, gui = "bold"},
        VimwikiBold {fg = colors.orange, gui = "bold"},
        -- VimwikiBoldChar {fg = colors.bg3},
        VimwikiItalic {fg = colors.yellow, gui = "italic"},
        -- VimwikiItalicChar {fg = colors.bg3},
        VimwikiBoldItalic {fg = colors.red, gui = "bold, italic"},
        VimwikiUnderline {gui = "underline"},
        -- VimwikiHR {fg = colors.yellow},
        -- END vimwiki

        -- START orgmode.nvim
        org_bold_delimiter {fg = colors.bg3},
        org_bold {fg = colors.orange, gui = "bold"},
        org_italic_delimiter {fg = colors.bg3}, 
        org_italic {fg = colors.yellow, gui = "italic"},
        org_underline_delimiter {fg = colors.bg3}, 
        org_underline {gui = "underline"},
        org_code_delimiter {fg = colors.bg3}, 
        org_code {fg = colors.green},
        org_verbatim_delimiter {fg = colors.bg3}, 
        org_verbatim {fg = colors.green},
        org_strike_delimiter {fg = colors.bg3}, 
        org_strike {gui = "strikethrough"},
        -- org_timestamp {},
        -- org_timestamp_inactive {},
        -- org_deadline_scheduled {},
        org_hyperlink {fg = colors.green},
        org_hyperlinkBracketsLeft {fg = colors.bg3},
        org_hyperlinkURL {fg = colors.purple},
        org_hyperlinkBracketsRight {fg = colors.bg3},
        -- org_comment {},
        org_list_ordered {fg = colors.orange},
        org_list_unordered {fg = colors.orange},
        -- org_list_def {},
        -- org_list_item {},
        -- org_list_bullet {},
        -- org_list_checkbox {},
        -- org_block_delimiter {},
        -- org_key_identifier {},
        -- org_title {},
        -- org_properties_delimiter {},
        -- org_property {},
        -- org_property_value {},
        -- org_subtask_number {},
        -- org_subtask_percent {},
        -- org_subtask_number_all {},
        -- org_subtask_percent_100 {},
        -- org_latex {},
        -- OrgAgendaDay {},
        -- OrgAgendaTags {},
        -- orghelp_key {},
        -- orghelp_bold {},
        -- orghelp_bold_italic {},
        -- orghelp_backtick {},
        -- orghelp_asterisk {},
        -- orghelp_underscore {},

        -- OrgHeadlineStar1 {}
        -- OrgHeadlineStar2
        -- OrgHeadlineStar3
        -- OrgHeadlineStar4
        -- OrgHeadlineLevel1 {fg = colors.red},
        -- OrgHeadlineLevel2 {fg = colors.orange},
        -- OrgHeadlineLevel3 {fg = colors.yellow},
        -- OrgHeadlineLevel4 {fg = colors.green},
        -- END orgmode.nvim

        -- "START" vim-sandwich
        -- OperatorSandwichBuns {fg = colors.bg, bg = colors.yellow_2},
        OperatorSandwichChange {bg = colors.bg2},
        OperatorSandwichDelete {fg = colors.bg, bg = colors.yellow_2},
        -- OperatorSandwichAdd {},
        -- END vim-sandwich

        -- START vim-visual-multi
        -- needs "vim.g.VM_theme_set_by_colorscheme = true" for it to work
        VM_Mono {fg = colors.bg, bg = colors.green},
        VM_Extend {fg = colors.fg, bg = colors.search},
        VM_Cursor { fg = colors.bg, bg = colors.yellow_2, gui = "underline" },
        VM_Insert {gui = "underline", sp = colors.red},
        -- END vim-visual-multi

        -- START cmp custom menu
        CmpDocumentation {fg = colors.fg},
        CmpDocumentationBorder {fg = colors.bg3},
        CmpItemAbbr {fg = colors.fg},
        CmpItemAbbrDeprecated {fg = colors.bg2},
        CmpItemAbbrMatch {fg = colors.blue },
        CmpItemAbbrMatchFuzzy {fg = colors.blue },
        CmpItemKind {fg = colors.purple},
        CmpItemMenu {fg = colors.bg4},
        -- END cmp custom menu


    }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
