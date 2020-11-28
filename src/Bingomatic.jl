module Bingomatic
    using Plots, StatsBase
    export make_bingo, sample_cells

    function sample_cells(list, n...; free_space=true)
        n_cells = prod(n)
        center = Int(ceil(n_cells/2))
        length(list) < n_cells ? error("list must have more elements than cells") : nothing
        iseven(n_cells) ? error("Must have an odd number of cells") : nothing 
        cells = sample(list, n, replace=false)
        cells[center] = free_space ? "Free Space" : cells[center]
        return cells 
    end

    function make_bingo(labels, n_rows=5; word_size=12, kwargs...)
        min_x = 0
        max_x = 2
        n_cells = n_rows^2
        offset = 1/n_rows
        iseven(n_rows) ? error("n_rows must be odd") : nothing 
        length(labels) < n_cells ? error("labels must have more elements than cells") : nothing
        ticks = range(min_x, max_x, length=n_rows+1)
        scale = range(min_x+offset, max_x-offset, length=n_rows)
        x = [[i j] for i in scale for j in scale]
        x = vcat(x...)
        pyplot()
        return scatter(x[:,1], x[:,2], markersize=0, xlims=(min_x,max_x), ylims=(min_x,max_x),
            series_annotations = text.(labels[:], :center, word_size), label = false, grid=true,
            gridstyle=:solid, gridlinewidth=1.5, gridalpha=1, xticks=ticks, yticks=ticks,
            xaxis=font(0), yaxis=font(0), xlabel="", ylabel="", frame_style=:box; kwargs...)
    end
end
