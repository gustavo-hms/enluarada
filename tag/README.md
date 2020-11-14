The `tag.kak` file defines the `tag` command, which allows easily navigating between tags in the current buffer using the built-in fuzzy searching capabilities of Kakoune.

Even though it uses the `ctags` program to generate the tags, there's no need to create a `tags` file, everything is done using Unix pipes. It doesn't even create temporary files. Just type `tag ` in the command prompt and it will display all the tags found in the current buffer. Select one, press `<ret>` and it will jump to the definition of the selected tag.

It's known to work well with [Universal Ctags](https://ctags.io/). Other `ctags` implementations are untested. Since Universal Ctags supports [a lot of filetypes](https://github.com/universal-ctags/ctags/tree/master/parsers), you gain code navigation for all of them for free.

### Suggested mapping

You can map the `tag` command to a key for fast tag selection:

```kak
map global user t ': tag ' -docstring 'Jump to a tag definition'
```
