The `golang.kak` file defines the very basic `golang-alternative-file` command. It allows fast switching between implementation and the corresponding test file when working with the Go programming language.

### Suggested mapping

You can define a `goto` map to easily switch between the files:

```kak
hook global WinSetOption filetype=go %{
    map buffer goto o '<esc>: golang-alternative-file<ret>' -docstring "switch test/impl"
}
```
