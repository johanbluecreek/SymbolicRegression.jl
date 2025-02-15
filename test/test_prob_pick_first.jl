println("Testing whether probPickFirst works.")
using SymbolicRegression
using Test
include("test_params.jl")

n = 10

options = Options(;
    default_params...,
    binary_operators=(+, -, *, /),
    unary_operators=(cos, sin),
    probPickFirst=0.999,
    ns=n,
)

for reverse in [false, true]
    members = PopMember{Float32}[]

    # Generate members with scores from 0 to 1:
    for i in 1:n
        tree = Node("x1") * 3.2f0
        score = Float32(i - 1) / (n - 1)
        if reverse
            score = 1 - score
        end
        test_loss = 1.0f0  # (arbitrary for this test)
        push!(members, PopMember(tree, score, test_loss))
    end

    pop = Population(members, n)

    dummy_frequencies = [0.0f-10 for i in 1:100]
    best_pop_member = [
        SymbolicRegression.best_of_sample(pop, dummy_frequencies, options).score for
        j in 1:100
    ]

    mean_value = sum(best_pop_member) / length(best_pop_member)

    # Make sure average score is small
    @test mean_value < 0.1
end

println("Passed.")
