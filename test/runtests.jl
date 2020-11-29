using Bingomatic
using Test

@testset "Bingomatic.jl" begin
    @test_throws ErrorException sample_words(["a","b"], 2)
    @test_throws ErrorException sample_words(["a", "b", "c"], 4)
    n_rows = 3
    word_list = ["a","b","c","d","e","f","g","h","i"]
    words = sample_words(word_list, n_rows, n_rows)
    @test size(words) == (n_rows,n_rows)
    @test words[5] == "Free Space"
    #card = make_card(labels)
end
