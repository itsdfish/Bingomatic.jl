# Bingomatic

Bingomatic™ is an awesome Julia package that creates bingo cards, using state-of-the-art bingo technology.

## Standard Bingo Card

A standard size bingo card can be made with a few lines of code, as shown below.
```julia
using Bingomatic, Random
Random.seed!(780775)
word_pool = map(_->randstring(4), 1:50)
words = sample_words(word_pool)
card = make_card(words)
```

<img src="extras/example1.png" alt="" width="400" height="400">

## Customized Bingo Card

The example below shows that bingo cards can be be customized. It is also possible to override default values in `make_card` with variable keyword arguments.

```julia
n_rows = 3
word_pool = map(_->randstring(4), 1:50)
words = sample_words(word_pool, n_rows, n_rows)
card = make_card(words; size=(300,300))
```
<img src="extras/example2.png" alt="" width="300" height="300">

## Halmark Christmas Bingo

Bingomatic™ includes a bonus word pool for Halmark Christmas Bingo, a $19.99 value, absolutely free! Variations of this coveted game include screaming each time the [secret word](https://www.youtube.com/watch?v=gxMZgeBlqzQ) "Christmas" is said. 

```julia 
using Bingomatic, Random
Random.seed!(1225)
pkg_path = dirname(pathof(Bingomatic))
path = joinpath(pkg_path,"../extras/word_pool.csv")
word_pool = CSV.read(path, DataFrame)

words = sample_words(word_pool.words)
card = make_card(words; word_size=11, size=(630,630))
```
<img src="extras/christmas_bingo.png" alt="" width="630" height="630">