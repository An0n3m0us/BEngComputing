import LinearAlgebra: norm

# Define square matrix X
A = [1 2 -1; 1 0 1; 4 -4 5]
X = [[0.0; 0.0; 1.0]]
delta = 0.001

global i = 1;

while i < 8
    # Calculate Y = AX
    Y = A*X[i]
    global i += 1;
    # Find value of largest element in magnitude
    K = Y[argmax(abs.(Y))]
    # Calculate fresh value X
    @show round(K, digits = 4)
    push!(X, (1/K)*Y)

    @show (norm(X[i]) - norm(X[i-1])) < delta
end


#=
while true
    println()
    #println("k: ", iter)
    println("(v^(", iter, "))^T: ", round.(X, digits = 3))

    magX1 = norm(X)

    # Calculate Y = AX
    global Y = A*X

    # Find value of largest element in magnitude
    global K = Y[argmax(abs.(Y))]

    # Calculate fresh value X
    global X = (1/K)*Y
    magX2 = norm(X)

    println("(Av^(", iter, "))^T: ", round.(Y, digits = 3))
    println("m_(", iter+1, "): ", round(K, digits = 3))
    
    global iter += 1

    println()
    (magX2 - magX1) > delta || break
end

println(iter)
global Y = A*X
println(round.(Y, digits = 3))
=#