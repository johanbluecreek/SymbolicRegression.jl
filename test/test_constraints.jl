using SymbolicRegression
using SymbolicRegression: check_constraints
using Test
include("test_params.jl")

_inv(x) = 1 / x
options = Options(;
    default_params...,
    binary_operators=(+, *, ^, /, greater),
    unary_operators=(_inv,),
    constraints=(_inv => 4,),
    npopulations=4,
)
tree = Node(5, (Node(3.0) * Node(1, Node("x1")))^2.0, -1.2)
violating_tree = Node(1, tree)

@test check_constraints(tree, options) == true
@test check_constraints(violating_tree, options) == false
