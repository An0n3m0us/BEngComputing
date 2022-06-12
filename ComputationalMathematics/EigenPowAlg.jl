using LinearAlgebra

## Power function ##
# Input: A, X, delta
# Output: k, (v^(k)), (Av^(k)), m_(k+1), lambda value, result
function powerAlgorithm(A, X, delta, Y::Vector=Vector{Float64}[], K::Array{Float64}=Float64[], iter::Int64=1)
    X isa Vector{Int64} ? xLoc = Vector{Float64}[X] : xLoc = X
    yLoc = Y
    kLoc = K

    # Calculate Y = AX
    Y = A*xLoc[iter]

    # Find value of largest element in magnitude
    kVal = Y[argmax(abs.(Y))]

    # Calculate the next value of X and store it
    push!(xLoc, (1/kVal)*Y)

    # Store other data
    push!(yLoc, Y)
    push!(kLoc, kVal)

    # Begin error checking after second recursion
    if iter > 1
        diff = abs(kLoc[iter] - kLoc[iter-1])

        # If the difference is less than the error, stop running else continue to next iteration
        if diff < delta
            # Check if A*v = lambda*v
            result = round.(kVal*last(X), digits = 2)
            return iter-1, xLoc, yLoc, kLoc, kVal, (round.(kVal, digits = 2), round.(last(X), digits = 2), result)
        end
    end

    powerAlgorithm(A, xLoc, delta, yLoc, kLoc, iter+1)
end

# Store lambda values in array
lambda = Float64[];
# Define square matrix X
A = [1 2 -1; 1 0 1; 4 -4 5]
# Define v0 under the name of X
X = [0; 0; 1]
# Define delta (error)
delta = 0.001

### a) First to find the largest magnitude eigenvalue ###

# Run power algorithm
k, vK, AvK, kValues, lambdaValue, check = powerAlgorithm(A, X, delta)
# Push lambda value returned to the global storage for lambda values
push!(lambda, lambdaValue)
@show kValues; @show lambda; @show check; println()

### b) Now we will find the smallest eigenvalue and the corresponding eigenvector ###

# Calculate the shifted matrix B = A_shifted
B = A-(lambda[1]*I)
X = [0; 1; 0]

k, vK, AvK, kValues, lambdaValue, check = powerAlgorithm(B, X, delta)
push!(lambda, lambdaValue)
@show kValues; @show lambda; @show check; println()


k, vK, AvK, kValues, lambdaValue, check = powerAlgorithm([-2 -6 0; 2 7 0; 1 2 -1], [0, 1, 1], 0.05)
push!(lambda, lambdaValue)
@show kValues; @show lambda; @show check; println()