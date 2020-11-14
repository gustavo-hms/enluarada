provide-module enluarada-search-tools %[

require-module luar

declare-option str highlight_search_with_face +ub -docstring %{
    face used to highlight occurrences of the last search pattern.
}

declare-option -hidden bool highlight_search_on false

define-command -hidden highlight-search-on -docstring %{
    highlight-search-on: highlight all occurrences of the last search pattern.
} %{
    lua %opt{highlight_search_on} %opt{highlight_search_with_face} %{
        local on, face = args()

        if not on then
            kak.add_highlighter("window/highlight-search", "dynregex", "%reg{/}", "0:" .. face)
        end

        kak.set_option("window", "highlight_search_on", true)
    }
}

define-command highlight-search-toggle -docstring %{
    highlight-search-toggle: toggle the highlight of all occurrences of the last search pattern.
} %{
    lua %opt{highlight_search_on} %opt{highlight_search_with_face} %{
        local on, face = args()

        if on then
            kak.remove_highlighter("window/highlight-search")
        else
            kak.add_highlighter("window/highlight-search", "dynregex", "%reg{/}", "0:" .. face)
        end

        kak.set_option("window", "highlight_search_on", not on)
    }
}

define-command search-word-or-selection -docstring %{
    search-word-or-selection: search the word under cursor if main selection is one character long; otherwise, search the contents of the main selection.
} %{
    try %{
        lua %val{selection} %{
            if #arg[1] == 1 then kak.execute_keys("<a-i>w") end
        }
    }

    execute-keys -save-regs '' *
    highlight-search-on
}

]
