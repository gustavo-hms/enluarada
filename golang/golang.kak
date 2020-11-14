provide-module enluarada-golang %[

require-module luar

define-command golang-alternative-file -docstring %{
    golang-alternative-file: jump to the corresponding test file if you are on an implementation file and vice-versa.
} %{
    lua %val{buffile} %{
        local name = arg[1]

        if name:match("_test%.go") then
            alternative = name:gsub("_test", "")
        else
            alternative = name:gsub("%.go", "_test.go")
        end

        kak.edit(alternative)
    }
}

]
