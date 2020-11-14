The `tag.kak` file defines the `tag` command, which allows listing tags in the current buffer and easily jumping to them using the built-in fuzzy searching capabilities of Kakoune. Just type `tag ` in the command prompt and it will display all the tags found in the current buffer using the `ctags` program. Select one, press `<ret>` and it will jump to the definition of the selected tag.

### Suggested mapping

You can map the `tag` command to a key for fast tag selection:

```kak
map global user t ': tag ' -docstring 'Jump to a tag definition'
```
