The `selections.kak` shows how we can rely on the returning value of the `luar`'s anonymous function to easily implement some handy functionality.

### Usage

First, require the provided module:

```kak
require-module enluarada-selections
```

Now, you have access to the following commands:


#### `selections-increment`

Replace your selections' contents with a range of numbers, starting from the number of the first selection. So, for instance, if you have the following code:

```go
const (
    Quatro 4
)
```

You can add values to the enumeration by first duplicating the `Quatro 4` line, renaming the constants and selecting the numbers:

```go
const (
    Quatro [4]
    Cinco [4]
    Seis [4]
    Sete [4]
    Oito [4]
)
```
Here, the notation `[something]` means `something` is selected. Then, running `selections-increment`, you get:

```go
const (
    Quatro [4]
    Cinco [5]
    Seis [6]
    Sete [7]
    Oito [8]
)
```

#### `selections-sort`

Sort the contents of your selections. Starting from:

```
[um] [dois] [três] [quatro]
```
and running `selections-sort`, you get:

```
[dois] [quatro] [três] [um]
```

#### `selections-propagate`

Propagate the content of the first selection to all of the selections, replacing their contents. Having:

```
E [quero que você venha comigo]
E [quero ir-me embora]
E [quero é dar o fora]
```
and running `selections-propagate`, you get:

```
E [quero que você venha comigo]
E [quero que você venha comigo]
E [quero que você venha comigo]
```
