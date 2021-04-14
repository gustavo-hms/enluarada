provide-module enluarada-selections %[

require-module luar

define-command selections-increment -docstring %{
    selections-increment: replaces the selections with an incremental list of numbers, starting from the number in the first selection.
} %{
    lua %val{selections} %{
        for i = 2,#arg do
            arg[i] = arg[1] + i-1
        end

        return arg
    }
}

define-command selections-sort -docstring %{
    selections-sort: sort the contents of the selections.
} %{
    lua %val{selections} %{
        table.sort(arg)
        return arg
    }
}

define-command selections-propagate -docstring %{
    selections-propagate: replaces selections' contents with the content of the first selection.
} %{
    lua %val{selection} %{
        return arg[1]
    }
}

]
