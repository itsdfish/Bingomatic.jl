using Bingomatic
using Test

@testset "Bingomatic.jl" begin
    @test_throws ErrorException sample_cells(["a","b"], 2)
    @test_throws ErrorException sample_cells(["a", "b", "c"], 4)
    n_rows = 3
    word_list = ["a","b","c","d","e","f","g","h","i"]
    labels = sample_cells(word_list, n_rows, n_rows)
    @test size(labels) == (n_rows,n_rows)
    @test labels[5] == "Free Space"
    card = make_bingo(labels, n_rows)
end
