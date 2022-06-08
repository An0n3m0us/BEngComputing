import LinearAlgebra: norm

# Define square matrix X
A = [1 2 -1; 1 0 1; 4 -4 5]
global X = transpose([0 0 1])
delta = 0.001

# Other definitions
global iter = 0;
global Y = 0;
global K = 0;

while true
    println()
    println("k: ", iter)
    println(round.(X, digits = 3), "(v^k)^T")

    magX1 = norm(X)

    # Calculate Y = AX
    global Y = A*X

    # Find value of largest element in magnitude
    global K = Y[argmax(abs.(Y))]

    # Calculate fresh value X
    global X = (1/K)*Y
    magX2 = norm(X)

    println(round.(Y, digits = 3), "(Av^k)^T")
    println(round(K, digits = 3), "m_(k+1)")
    
    global iter += 1
    println()
    (magX2 - magX1) > delta/20 || break
end

println(iter)
global Y = A*X
println(round.(Y, digits = 3))