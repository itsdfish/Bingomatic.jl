# Bingomatic

Bingomatic is an awesome Julia package that creates bingo cards.

## Example

```julia
using Revise, Bingomatic
n_rows = 3
word_list = ["a","b","c","d","e","f","g","h","i"]
labels = sample_cells(word_list, n_rows, n_rows)
card = make_bingo(labels, n_rows)
```
