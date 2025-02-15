using SafeTestsets

@safetestset "Test tree construction and scoring" begin
    include("test_tree_construction.jl")
end

@safetestset "Test custom operators and additional types" begin
    include("test_operators.jl")
end

@safetestset "Test SymbolicUtils interface" begin
    include("test_symbolic_utils.jl")
end

@safetestset "Test constraints interface" begin
    include("test_constraints.jl")
end

@safetestset "Test custom losses" begin
    include("test_losses.jl")
end

@safetestset "Test derivatives" begin
    include("test_derivatives.jl")
end

@safetestset "Test simplification" begin
    include("test_simplification.jl")
end

@safetestset "Test printing" begin
    include("test_print.jl")
end

@safetestset "Test validity of expression evaluation" begin
    include("test_evaluation.jl")
end

@safetestset "Test tournament selection" begin
    include("test_prob_pick_first.jl")
end

@safetestset "Test crossover mutation" begin
    include("test_crossover.jl")
end

@safetestset "Test NaN detection in evaluator" begin
    include("test_nan_detection.jl")
end

@safetestset "Test nested constraint checking" begin
    include("test_nested_constraints.jl")
end

@safetestset "Test complexity evaluation" begin
    include("test_complexity.jl")
end

@safetestset "Test options" begin
    include("test_options.jl")
end

@safetestset "Test hash of tree" begin
    include("test_hash.jl")
end
