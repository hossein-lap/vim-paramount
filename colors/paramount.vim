" Name:       paramount.vim
" Version:    0.1.0
" Maintainer: github.com/owickstrom
" License:    The MIT License (MIT)
"
" A minimal colorscheme for Vim that only puts emphasis on the paramount.
"
" Based on the pencil and off colorschemes:
"
" https://github.com/reedes/vim-colors-pencil
" https://github.com/reedes/vim-colors-off
"
"""
hi clear

if exists('syntax on')
	syntax reset
endif

" Toggle bold, italics, underline {{{
let g:fontfaces = 0

if g:fontfaces == 1
	let s:thebold = 'bold'
	let s:theitalic = 'italic'
	let s:theurl = 'underline'
else
	let s:thebold = 'none'
	let s:theitalic = 'none'
	let s:theurl = 'none'
endif
" }}}

let g:colors_name='paramount'

let s:black           = { "gui": "#000000", "cterm": "232"  }
let s:actual_black    = { "gui": "NONE",    "cterm": "NONE" }
let s:medium_gray     = { "gui": "#767676", "cterm": "243"  }
let s:white           = { "gui": "#F1F1F1", "cterm": "15"   }
let s:dark_white      = { "gui": "#efefef", "cterm": "15"   }
let s:actual_white    = { "gui": "#FFFFFF", "cterm": "231"  }
let s:subtle_black    = { "gui": "#151515", "cterm": "236"  }
let s:light_black     = { "gui": "#262626", "cterm": "235"  }
let s:lighter_black   = { "gui": "#4E4E4E", "cterm": "239"  }
let s:light_gray      = { "gui": "#A8A8A8", "cterm": "248"  }
let s:lighter_gray    = { "gui": "#C6C6C6", "cterm": "251"  }
let s:lightest_gray   = { "gui": "#EEEEEE", "cterm": "255"  }
let s:pink            = { "gui": "#fb007a", "cterm": "9"    }
let s:dark_red        = { "gui": "#aa0000", "cterm": "1"    }
let s:light_red       = { "gui": "#ee0000", "cterm": "1"    }
let s:orange          = { "gui": "#D75F5F", "cterm": "167"  }
let s:darker_blue     = { "gui": "#005F87", "cterm": "18"   }
let s:dark_blue       = { "gui": "#008EC4", "cterm": "32"   }
let s:blue            = { "gui": "#20BBFC", "cterm": "12"   }
let s:light_blue      = { "gui": "#b6d6fd", "cterm": "153"  }
let s:dark_cyan       = { "gui": "#20A5BA", "cterm": "6"    }
let s:light_cyan      = { "gui": "#4FB8CC", "cterm": "14"   }
let s:dark_green      = { "gui": "#10A778", "cterm": "2"    }
let s:light_green     = { "gui": "#5FD7A7", "cterm": "10"   }
let s:darker_purple   = { "gui": "#8e44ad", "cterm": "140"  }
let s:dark_purple     = { "gui": "#af5fd7", "cterm": "134"  }
let s:light_purple    = { "gui": "#a790d5", "cterm": "140"  }
let s:lighter_purple  = { "gui": "#d6acff", "cterm": "140"  }
let s:yellow          = { "gui": "#F3E430", "cterm": "11"   }
let s:light_yellow    = { "gui": "#ffff87", "cterm": "228"  }
let s:dark_yellow     = { "gui": "#A89C14", "cterm": "3"    }

let s:background = &background

if &background == "dark"
	let s:bg              = s:black
	let s:bg_subtle       = s:lighter_black
	let s:bg_very_subtle  = s:subtle_black
	let s:norm            = s:lighter_gray
	let s:norm_subtle     = s:medium_gray
	let s:purple          = s:light_purple
	let s:cyan            = s:light_cyan
	let s:green           = s:light_green
	let s:red             = s:light_red
	let s:visual          = s:light_purple
	let s:yellow          = s:light_yellow
	let s:nontext         = s:light_black
else
	let s:bg              = s:actual_white
	let s:bg_subtle       = s:light_gray
	let s:bg_very_subtle  = s:lightest_gray
	let s:norm            = s:light_black
	let s:norm_subtle     = s:medium_gray
	let s:purple          = s:dark_purple
	let s:cyan            = s:dark_cyan
	let s:green           = s:dark_green
	let s:red             = s:dark_red
	let s:visual          = s:dark_purple
	let s:yellow          = s:dark_yellow
	let s:nontext         = s:dark_white
endif

let s:active = s:purple
if &background == "dark"
	let s:dark_active = s:darker_purple
	let s:light_active = s:lighter_purple
else
	let s:dark_active = s:lighter_purple
	let s:light_active = s:darker_purple
endif
let s:visual = s:dark_active

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
	execute "highlight" a:group
				\ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
				\ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
				\ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
				\ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
				\ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
				\ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
				\ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
call s:h("PlainNormal",   {"bg": s:actual_black, "fg": s:norm})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
	execute "set background=" . s:background
endif

call s:h("Cursor",        {"bg": s:purple, "fg": s:norm })
call s:h("Comment",       {"fg": s:bg_subtle, "gui": s:theitalic})

call s:h("Constant",      {"fg": s:purple})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

call s:h("Identifier",    {"fg": s:dark_active})
hi! link Identifier       PlainNormal
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:norm_subtle})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("Operator",      {"fg": s:norm, "cterm": s:thebold, "gui": s:thebold})

call s:h("PreProc",     {"fg": s:norm_subtle})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:norm})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:norm_subtle, "gui": s:theitalic})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": s:theurl, "cterm": s:theurl})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:actual_white, "bg": s:red, "cterm": s:thebold})
call s:h("Todo",          {"fg": s:purple, "gui": s:theurl, "cterm": s:theurl})
call s:h("SpecialKey",    {"fg": s:light_green})
call s:h("NonText",       {"fg": s:nontext})
call s:h("Directory",     {"fg": s:dark_purple})
call s:h("ErrorMsg",      {"fg": s:red})
call s:h("IncSearch",     {"bg": s:active, "fg": s:light_black})
call s:h("Search",        {"bg": s:light_active, "fg": s:light_black})
call s:h("MoreMsg",       {"fg": s:medium_gray, "cterm": s:thebold, "gui": s:thebold})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_subtle})
call s:h("CursorLineNr",  {"fg": s:active, "bg": s:bg_very_subtle})
call s:h("Question",      {"fg": s:dark_active})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:black, "fg": s:white})
call s:h("Title",         {"fg": s:dark_active})
call s:h("Visual",        {"fg": s:black, "bg": s:visual})
call s:h("VisualNOS",     {"bg": s:bg_subtle})
call s:h("WarningMsg",    {"fg": s:yellow})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:dark_yellow})
call s:h("DiffText",      {"fg": s:dark_blue})
call s:h("SignColumn",    {"fg": s:light_green})


if has("gui_running")
	call s:h("SpellBad",    {"gui": s:theurl, "sp": s:red})
	call s:h("SpellCap",    {"gui": s:theurl, "sp": s:light_green})
	call s:h("SpellRare",   {"gui": s:theurl, "sp": s:pink})
	call s:h("SpellLocal",  {"gui": s:theurl, "sp": s:dark_green})
else
	call s:h("SpellBad",    {"cterm": s:theurl, "fg": s:red})
	call s:h("SpellCap",    {"cterm": s:theurl, "fg": s:light_green})
	call s:h("SpellRare",   {"cterm": s:theurl, "fg": s:pink})
	call s:h("SpellLocal",  {"cterm": s:theurl, "fg": s:dark_green})
endif

call s:h("Pmenu",         {"fg": s:norm, "bg": s:black})
call s:h("PmenuSel",      {"fg": s:black, "bg": s:purple})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:purple, "bg": s:bg_subtle, "gui": s:thebold, "cterm": s:thebold})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_very_subtle})
call s:h("CursorLine",    {"bg": s:bg_very_subtle})
call s:h("ColorColumn",   {"bg": s:subtle_black})

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:medium_gray})

call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})

" Synatastic
call s:h("SyntasticWarningSign",    {"fg": s:yellow})
call s:h("SyntasticWarning",        {"bg": s:yellow, "fg": s:black, "gui": s:thebold, "cterm": s:thebold})
call s:h("SyntasticErrorSign",      {"fg": s:red})
call s:h("SyntasticError",          {"bg": s:red, "fg": s:white, "gui": s:thebold, "cterm": s:thebold})

" Neomake
hi link NeomakeWarningSign	SyntasticWarningSign
hi link NeomakeErrorSign	SyntasticErrorSign

" ALE
hi link ALEWarningSign	SyntasticWarningSign
hi link ALEErrorSign	SyntasticErrorSign

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
hi link GitGutterAdd                LineNr
hi link GitGutterDelete             LineNr
hi link GitGutterChange             LineNr
hi link GitGutterChangeDelete       LineNr
