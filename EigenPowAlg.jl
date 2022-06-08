using LinearAlgebra

function powerAlgorithm(A, X, K, delta, iter::Int64=1)
    # Calculate Y = AX
    Y = A*X[iter]
    # Find value of largest element in magnitude
    Kval = Y[argmax(abs.(Y))]
    # Calculate fresh value X
    v1 = (1/Kval)*Y
    push!(X, v1)
    push!(K, Kval)
    #@show Y

    # Begin error checking after second recursion
    if iter > 1
        @show abs(K[iter]), abs(K[iter-1]), abs(K[iter] - K[iter-1])
        if abs(K[iter] - K[iter-1]) < delta
            push!(lambda, Kval)
            println()
            @show Kval
            @show v1
            # Check if Av1 = lambda1v1
            check = round.(Kval*v1, digits = 2)
            @show check
            println()
        else
            powerAlgorithm(A, X, K, delta, iter+1)
        end
    else
        powerAlgorithm(A, X, K, delta, iter+1)
    end
end

# Define square matrix X
global A = [1 2 -1; 1 0 1; 4 -4 5]

### First to find the largest magnitude eigenvalue ###

# Store v_0 up to v_n in array X
global X = [[0.0; 0.0; 1.0]]
# Store K values in array for referencing a point in recursion
global K = Float64[];
# Store lambda values in array
global lambda = Float64[];
# Set delta (error) value
global delta = 0.001

# Run power algorithm
powerAlgorithm(A, X, K, delta)

### Now we will find the smallest eigenvalue and the corresponding eigenvector ###

# Calculate the shifted matrix B = A_shifted
global B = A-(lambda[1]*I)
# Re-define the X array from before but with a new v_0# Store v_0 up to v_n in array X
global X = [[0.0; 1.0; 0.0]] 
# Re-define the K values array
global K = Float64[];

powerAlgorithm(B, X, K, delta)

