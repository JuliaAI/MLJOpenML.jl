module TestOpenml

using Test
using MLJOpenML
using ScientificTypes

for M in [OpenML, MLJOpenML]
    @test length(M.list_tags()) > 200
    table = M.list_datasets(
        tag = "OpenML100",
        filter = "number_instances/100..1000/number_features/1..10")
    @test issubset([:id, :name, :status], schema(table).names)
    M.describe_dataset(61)
    table = M.load(61)
    @test :sepallength in schema(table).names
end


end
true
