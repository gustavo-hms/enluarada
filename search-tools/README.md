The file `search-tools.kak`, despite its name, is inspired by a Vim plugin called [vim-visual-multi](https://github.com/mg979/vim-visual-multi). Using the commands provided here, you can create multiple selections in a way similar to how Sublime Text achieve it.

### Ussage

First, require the provided module:

```kak
require-module enluarada-search-tools
```

Now, you have the following commands to use:

#### `highlight-search-toggle`

This command toggles the highlighting of all occurrences of the last search pattern. Say, for instance, that you just searched for the word *amar* in the following verses from Drummond:

    Que pode uma criatura senão,
    Entre criaturas, amar?
    Amar e esquecer, amar e malamar,
    Amar, desamar, amar?
    Sempre, e até de olhos vidrados, amar?

Then, by running `highlight-search-toggle`, all occurrences of *amar* will be highlighted:

    Que pode uma criatura senão,
    Entre criaturas, _amar_?
    Amar e esquecer, _amar_ e mal_amar_,
    Amar, des_amar_, _amar_?
    Sempre, e até de olhos vidrados, _amar_?

Running it again will undo the highlighting.

#### `search-word-or-selection`

This command works similarly to the built-in `*` key, except for two differences:

- if the current selection is just one character long, it first selects the word under the cursor and then set the search pattern to the main selection;
- if automatically activates the highlighting of matches of the search pattern. This way you can easily visualise the occurrences of some pattern in your buffer.

### Suggested mappings

Define

```kak
map global normal <c-n> ': search-word-or-selection<ret>'
```
if you want to use mappings similar to `vim-visual-multi`. Then, pressing `<c-n>` will set the search pattern (the `/` register) to the word under cursor if the main selection is just one character long; otherwise, it will set the search pattern to the contents of the main selection (just like the `*` key). Note that all occurrences of the search pattern are automatically highlighted. Then you can start creating new selections by pressing `n` (to go to the next match) and `N` (to add a new selection with the next match).

If you prefer to use Sublime Text mappings, define:

```kak
map global normal <c-d> ': search-word-or-selection<ret>'
```

It's also useful to define a mapping to toggle the highlight of the matches:

```kak
map global normal <F2> ': highlight-seach-toggle<ret>'
```

### Configuration

By default, the occurrences of the search pattern are highlighted with a bold underline face. To change that, overwrite the `highlight_search_with_face` option. For instance, to highlight using the `MatchingChar` face, set:

```kak
set-option global highlight_search_with_face '@MatchingChar'
```
